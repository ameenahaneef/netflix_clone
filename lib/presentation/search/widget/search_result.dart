import 'package:flutter/material.dart';
import 'package:netflix_app/core/constants.dart';
import 'package:netflix_app/model/movie.dart';
import 'package:netflix_app/presentation/search/widget/title.dart';



class SearchResultWidget extends StatefulWidget {
  final List<Movie> movies;
  const SearchResultWidget({super.key, required this.movies});

  @override
  State<SearchResultWidget> createState() => _SearchResultWidgetState();
}

class _SearchResultWidgetState extends State<SearchResultWidget> {
  late Future<List<Movie>> _movies;
  @override
  void initState() {
    super.initState();
    _movies=Future.value(widget.movies);
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      const  SearchTextTitle(title: 'Movies & TV'),
        kHeight,
        FutureBuilder(future: _movies, builder: (context,snapshot){
          if(snapshot.connectionState==ConnectionState.waiting){
            return const CircularProgressIndicator();
          }else if(snapshot.hasError){
            return Text('error:${snapshot.error}');
          }else{
            return  Expanded(child: GridView.count(
          shrinkWrap: true,
          crossAxisCount: 3,
          mainAxisSpacing: 5,
          crossAxisSpacing: 8,
          childAspectRatio: 1/1.4,
          children: List.generate(snapshot.data!.length, (index){
            final movie=snapshot.data![index];
            return  MainCard(movie:movie);
          })
          ),
          );
          }
        })
        
      ],
    );
  }
}

class MainCard extends StatelessWidget {
  final Movie movie;
  const MainCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
       image: DecorationImage(image: NetworkImage('${Constants.imagePath}${movie.posterPath}'),fit: BoxFit.cover) ,
       borderRadius: BorderRadius.circular(7)
      ),
    );
  }
}