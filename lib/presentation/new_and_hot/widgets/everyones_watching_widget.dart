import 'package:flutter/material.dart';
import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/core/constants.dart';
import 'package:netflix_app/model/movie.dart';
import 'package:netflix_app/presentation/home/custom_button_widget.dart';
import 'package:netflix_app/presentation/widgets/video_widget.dart';

class EveryonesWatching extends StatelessWidget {
  const EveryonesWatching({
    super.key, required this.movie,
  });
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return  Column(
     crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kHeight,
        Text(
          movie.title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        kHeight,
        Text(
        movie.overview,
          style: const TextStyle(color: kGreyColor),
        ),
        kHeight50,
        VideoWidget(movie:movie),
        kHeight,
        const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomButtonWidget(
              icon: Icons.share,
              title: 'Share',
              iconSize: 25,
              textSize: 15,
            ),
            kwidth,
            CustomButtonWidget(
              icon: Icons.add,
              title: 'My List',
              iconSize: 25,
              textSize: 15,
            ),kwidth,
            CustomButtonWidget(
              icon: Icons.play_arrow,
              title: 'Play',
              iconSize: 25,
              textSize: 15, 
            ),
            kwidth
          ],
        )
      ],
    );
  }
}
