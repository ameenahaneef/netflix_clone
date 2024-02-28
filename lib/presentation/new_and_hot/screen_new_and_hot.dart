import 'package:flutter/material.dart';
import 'package:netflix_app/api/api.dart';
import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/core/constants.dart';
import 'package:netflix_app/model/movie.dart';
import 'package:netflix_app/presentation/new_and_hot/widgets/coming_soon_widget.dart';
import 'package:netflix_app/presentation/new_and_hot/widgets/everyones_watching_widget.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(90),
            child: AppBar(
              title: const Text(
                'New & Hot',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    color: kwhiteColor),
              ),
              actions: [
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
              bottom: TabBar(
                dividerColor: kBlackColor,
                // isScrollable:true,
                labelColor: kBlackColor,
                unselectedLabelColor: kwhiteColor,
                labelStyle:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                indicator:
                    BoxDecoration(borderRadius: kRadius30, color: kwhiteColor),
                tabs: const [
                  Tab(
                    text: "🍿 Coming Soon  ",
                  ),
                  Tab(
                    text: "👀Everyone's Watching",
                  )
                ],
              ),
            ),
          ),
          body: TabBarView(children: [
            _buildComingSoon(),
            _buildEveryonesWatching(),
          ])),
    );
  }

  Widget _buildComingSoon() {
    return FutureBuilder(
        future: Api().tenseDramaMovies(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('error:${snapshot.error}'),
            );
          } else {
            List<Movie> movies = snapshot.data ?? [];
            return ListView.builder(
                itemCount: movies.length,
                itemBuilder: (context, index) =>
                    ComingSoonWidget(movie: movies[index]));
          }
        });
  }

  Widget _buildEveryonesWatching() {
    return FutureBuilder(
        future: Api().getTopTenTvShows(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('error:${snapshot.error}'),
            );
          } else {
            List<Movie> movies = snapshot.data ?? [];
            return ListView.builder(
                itemCount: movies.length,
                itemBuilder: (context, index) =>
                    EveryonesWatching(movie: movies[index]));
          }
        });
  }
}
