import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_app/api/api.dart';
import 'package:netflix_app/core/constants.dart';
import 'package:netflix_app/model/movie.dart';
import 'package:netflix_app/presentation/search/widget/search_idle.dart';
import 'package:netflix_app/presentation/search/widget/search_result.dart';

class ScreenSearch extends StatefulWidget {
  const ScreenSearch({super.key});

  @override
  State<ScreenSearch> createState() => _ScreenSearchState();
}

class _ScreenSearchState extends State<ScreenSearch> {
  late Future<List<Movie>> searchResult;
  final searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    searchResult = Future.value([]);
  }

  void onSearchTextChanged(String newText) {
    if (newText.isEmpty) {
      setState(() {
        searchResult = Future.value([]);
      });
    } else {
      setState(() {
        searchResult = Api().searchResult(newText);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CupertinoSearchTextField(
            backgroundColor: Colors.grey.withOpacity(0.4),
            prefixIcon: const Icon(
              CupertinoIcons.search,
              color: Colors.grey,
            ),
            onChanged: onSearchTextChanged,
            controller: searchController,
            suffixIcon: const Icon(
              CupertinoIcons.xmark_circle_fill,
              color: Colors.grey,
            ),
            style: const TextStyle(color: Colors.white),
          ),
          kHeight,
          Expanded(
              child: searchController.text.isEmpty
                  ? const SearchIdleWidget()
                  : FutureBuilder(
                      future: searchResult,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (snapshot.hasError) {
                          return const Center(
                            child: Text('No Result Found'),
                          );
                        } else {
                          return SearchResultWidget(
                            movies: snapshot.data as List<Movie>,
                          );
                        }
                      }))
        ],
      ),
    ),
    ),
    );
  }
}
