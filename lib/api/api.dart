import 'dart:convert';

import 'package:netflix_app/core/constants.dart';
import 'package:netflix_app/model/movie.dart';
import 'package:http/http.dart' as http;

class Api {
  static const _trendingUrl =
      'https://api.themoviedb.org/3/trending/movie/day?api_key=${Constants.apiKey}';
  static const _topRatedUrl =
      'https://api.themoviedb.org/3/movie/top_rated?api_key=${Constants.apiKey}';
  static const _tenseMovieUrl =
      'https://api.themoviedb.org/3/movie/upcoming?api_key=${Constants.apiKey}';
  static const _topTenTv =
      'https://api.themoviedb.org/3/movie/popular?api_key=${Constants.apiKey}';
  static const _releasedLastYear =
      'https://api.themoviedb.org/3/movie/now_playing?api_key=${Constants.apiKey}';

  Future<List<Movie>> getTrendingMovies() async {
    final response = await http.get(Uri.parse(_trendingUrl));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      print(decodedData);
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('something happened');
    }
  }

  Future<List<Movie>> getTopRatedMovies() async {
    final response = await http.get(Uri.parse(_topRatedUrl));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      print(decodedData);
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('something happened');
    }
  }

  Future<List<Movie>> tenseDramaMovies() async {
    final response = await http.get(Uri.parse(_tenseMovieUrl));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      print(decodedData);
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('something happened');
    }
  }

  Future<List<Movie>> getTopTenTvShows() async {
    final response = await http.get(Uri.parse(_topTenTv));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      print(decodedData);
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('something happened');
    }
  }

  Future<List<Movie>> lastYearMovies() async {
    final response = await http.get(Uri.parse(_releasedLastYear));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      print(decodedData);
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('something happened');
    }
  }

  Future<List<Movie>> searchResult(String movie) async {
    String serechResult =
        'https://api.themoviedb.org/3/search/movie?api_key=${Constants.apiKey}&query=$movie';
    final response = await http.get(Uri.parse(serechResult));
    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body)['results'] as List;
      return responseData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('error');
    }
  }

  // Future<List<String>> getImageList() async {
  //   final response = await http.get(Uri.parse(_releasedLastYear));
  //   if (response.statusCode == 200) {
  //     final List<dynamic> data = json.decode(response.body);
  //     List<String> imageUrls =
  //         data.map((item) => item['url'].toString()).toList();
  //     return imageUrls;
  //   } else {
  //     throw Exception('something happened');
  //   }
  // }
}
