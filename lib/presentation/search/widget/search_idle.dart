import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_app/api/api.dart';
import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/core/constants.dart';
import 'package:netflix_app/model/movie.dart';
import 'package:netflix_app/presentation/search/widget/title.dart';

// const imageUrl =
// "https://imgs.search.brave.com/FaS_lLz-6HEO1KuHzmvaSAEgWotZNRSkIojFLPmCMtQ/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9wb3N0/ZXJtdXNldW0uY29t/L2Nkbi9zaG9wL3By/b2R1Y3RzL3oyWHRF/Q3RfbGFyZ2UuanBn/P3Y9MTU5ODM4NTU3/OQ";
class SearchIdleWidget extends StatefulWidget {
  const SearchIdleWidget({super.key});

  @override
  State<SearchIdleWidget> createState() => _SearchIdleWidgetState();
}

class _SearchIdleWidgetState extends State<SearchIdleWidget> {
  late Future<List<Movie>> _topSearches;
  @override
  void initState() {
    super.initState();
    _topSearches = Api().getTrendingMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SearchTextTitle(
          title: 'Top Searches',
        ),
        kHeight,
        FutureBuilder(
            future: _topSearches,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('error:${snapshot.error}');
              } else {
                return Expanded(
                  child: ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (ctx, index) {
                        final movie = snapshot.data![index];
                        return TopSearchItemTile(movie: movie);
                      },
                      separatorBuilder: (ctx, index) => kHeight20,
                      itemCount: 10),
                );
              }
            })
      ],
    );
  }
}

class TopSearchItemTile extends StatelessWidget {
  final Movie movie;
  const TopSearchItemTile({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: screenWidth * 0.35,
          height: 65,
          decoration: BoxDecoration(
              image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage('${Constants.imagePath}${movie.posterPath}'),
          )),
        ),
        Expanded(
            child: Text(
          movie.title,
          style: const TextStyle(
              color: kwhiteColor, fontWeight: FontWeight.bold, fontSize: 16),
        )),
        const CircleAvatar(
          backgroundColor: kwhiteColor,
          radius: 25,
          child: CircleAvatar(
            backgroundColor: kBlackColor,
            radius: 23,
            child: Icon(
              CupertinoIcons.play_fill,
              color: kwhiteColor,
            ),
          ),
        )
      ],
    );
  }
}
