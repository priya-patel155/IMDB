import 'package:dio/dio.dart';
import 'package:flutter_imdb/services/api_endpoint.dart';

import 'model_class/movie.dart';

Future<List<Movie>> fetchMovies(String query) async {
  MovieList movieList;
  var res = await Dio().get(Endpoints.movieSearchUrl(query));
  print(res.data);
  movieList = MovieList.fromJson(res.data);
  return movieList.movies ?? [];
}
