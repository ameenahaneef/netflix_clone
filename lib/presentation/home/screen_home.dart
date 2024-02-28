import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix_app/api/api.dart';
import 'package:netflix_app/core/constants.dart';
import 'package:netflix_app/model/movie.dart';
import 'package:netflix_app/presentation/home/background_card.dart';
import 'package:netflix_app/presentation/home/number_title_card.dart';
import 'package:netflix_app/presentation/widgets/main_title_card.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  late Future<List<Movie>> trendingMovies;
  late Future<List<Movie>> topRatedMovies;
  late Future<List<Movie>> tenseDramaMovies;
  late Future<List<Movie>> topTenTvShows;
  late Future<List<Movie>> lastYearMovies;

  @override
  void initState() {
    super.initState();
    trendingMovies = Api().getTrendingMovies();
    topRatedMovies = Api().getTopRatedMovies();
    tenseDramaMovies = Api().tenseDramaMovies();
    topTenTvShows = Api().getTopTenTvShows();
    lastYearMovies = Api().lastYearMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ValueListenableBuilder(
      valueListenable: scrollNotifier,
      builder: (BuildContext context, index, _) {
        return NotificationListener<UserScrollNotification>(
          onNotification: (notification) {
            final ScrollDirection direction = notification.direction;
            print(direction);
            if (direction == ScrollDirection.reverse) {
              scrollNotifier.value = false;
            } else if (direction == ScrollDirection.forward) {
              scrollNotifier.value = true;
            }
            return true;
          },
          child: Stack(
            children: [
              ListView(
                children: [
                  const BackgroundCard(),
                  buildFutureBuilder(lastYearMovies, 'LastYear Movies'),
                  kHeight,
                  buildFutureBuilder(trendingMovies, 'Trending Movies'),
                  kHeight,
                  SizedBox(
                    child: FutureBuilder(
                      future: topTenTvShows,
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return Center(
                            child: Text(snapshot.error.toString()),
                          );
                        } else if (snapshot.hasData) {
                          return NumberTitleCard(
                            snapshot: snapshot,
                          );
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                    ),
                  ),
                  kHeight,
                  buildFutureBuilder(topRatedMovies, 'Top Rated Movies'),
                  kHeight,
                  buildFutureBuilder(tenseDramaMovies, 'Tense Drama Movies'),
                  kHeight,
                ],
              ),
              scrollNotifier.value == true
                  ? AnimatedContainer(
                      duration: const Duration(milliseconds: 1000),
                      width: double.infinity,
                      height: 90,
                      color: Colors.black.withOpacity(0.3),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Image.network(
                                "https://imgs.search.brave.com/q8qT0BDFBjD7wA5RpxX1P5PPN1RpS05sfsk1PHYK5Oo/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9sb29k/aWJlZS5jb20vd3At/Y29udGVudC91cGxv/YWRzL05ldGZsaXgt/Ti1TeW1ib2wtbG9n/by1ibGFjay1iZy0z/MDB4MzAwLnBuZw",
                                width: 60,
                                height: 60,
                              ),
                              const Spacer(),
                              const Icon(
                                Icons.cast,
                                color: Colors.white,
                                size: 30,
                              ),
                              kwidth,
                              Container(
                                width: 30,
                                height: 30,
                                color: Colors.blue,
                              ),
                              kwidth,
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'TV Shows',
                                style: kHomeTitleText,
                              ),
                              Text(
                                'Movies',
                                style: kHomeTitleText,
                              ),
                              Text(
                                'Categories',
                                style: kHomeTitleText,
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  : kHeight
            ],
          ),
        );
      },
    ));
  }

  SizedBox buildFutureBuilder(Future<List<Movie>> future, String title) {
    return SizedBox(
      child: FutureBuilder(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else if (snapshot.hasData) {
            return MainTitleCard(
              title: title,
              snapshot: snapshot,
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
