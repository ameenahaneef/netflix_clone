
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/core/constants.dart';
import 'package:netflix_app/model/movie.dart';
import 'package:netflix_app/presentation/home/custom_button_widget.dart';
import 'package:netflix_app/presentation/widgets/video_widget.dart';

class ComingSoonWidget extends StatelessWidget {
  const ComingSoonWidget({
    super.key, required this.movie,
   
  });

 final Movie movie;


  @override
  Widget build(BuildContext context) {
   // Size size=MediaQuery.of(context).size;
     DateTime releaseDate = movie.releaseDate is DateTime
        ? movie.releaseDate as DateTime
        : DateTime.parse(movie.releaseDate.toString());
    String formattedDate=DateFormat.MMM().format(releaseDate );
    String dayOfMonth=DateFormat.d().format(releaseDate);
    return Row(
      children: [
         SizedBox(
          width: 50,
          height: 450,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
               formattedDate,
                style: const TextStyle(fontSize: 18, color: kGreyColor),
              ),
              Text(
                dayOfMonth,
                style: const TextStyle(
                    fontSize: 30,
                    letterSpacing: 4,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
       Flexible(
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[
              VideoWidget(movie: movie,),
               Row(
                children: [
                  Expanded(
                    child: Text(
                     movie.title,
                      style:const TextStyle(
                          fontSize: 30,
                          letterSpacing: -1,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Spacer(),
                  const Row(
                    children: [
                      CustomButtonWidget(
                        icon: Icons.notifications,
                        title: 'Remind Me',
                        iconSize: 20,
                        textSize: 12,
                      ),
                      kwidth,
                      CustomButtonWidget(
                        icon: Icons.info,
                        title: 'Info',
                        iconSize: 20,
                        textSize: 12,
                      ),
                      kwidth
                    ],
                  )
                ],
              ),
              // kHeight,
            Text('Coming on ${movie.releaseDate}'),
              kHeight,
              Text(
                movie.title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
             kHeight,
           Text(movie.overview,
             style: const TextStyle(
                color: kGreyColor
                ),
             )
            ],
          ),
        ),
      ],
    );
  }
}

