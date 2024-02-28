import 'package:flutter/material.dart';
import 'package:netflix_app/core/constants.dart';
import 'package:netflix_app/model/movie.dart';
import 'package:netflix_app/presentation/widgets/main_title.dart';

class MainTitleCard extends StatelessWidget {
  const MainTitleCard({
    super.key,
    required this.title,
    required this.snapshot,
  });
  final String title;
  final AsyncSnapshot<List<Movie>> snapshot;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainTitle(title: title),
        kHeight,
        LimitedBox(
            maxHeight: 200,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  // final Movie movie=snapshot.data![index];
                  return Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Image.network(
                      '${Constants.imagePath}${snapshot.data![index].posterPath}',
                      filterQuality: FilterQuality.high,
                      fit: BoxFit.cover,
                      width: 120,
                      height: 180,
                    ),
                  );
                }))
      ],
    );
  }
}
