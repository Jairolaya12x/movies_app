import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies_app/src/models/movie.dart';

const API_KEY = '89f3bc94be02204760c7409ffd51e435';
const API_URL = 'api.themoviedb.org';

const IMAGES_URL = 'https://image.tmdb.org/t/p/w500/';

class MoviesProvider {
  Future<List<Movie>> getComingMovies() async => await getMovies('/3/movie/upcoming');

  Future<List<Movie>> getNowPlayingMovies() async => await getMovies('/3/movie/now_playing');

  Future<List<Movie>> searchMovies(String query) async => await getMovies('3/search/movie/',query: query);

  Future<List<Movie>> getMovies(String endpoint, {String query}) async {
    final queryParams =  {'api_key': API_KEY};
    if(query != null) queryParams['query'] = query;
    http.Response response;
    Uri endpointUrl = Uri.https(API_URL, endpoint,queryParams);
    print(endpointUrl.toString());
    response = await http.get(endpointUrl).catchError((onError) => throw onError);
    final decodeJson = json.decode(response.body);
    return List<Movie>.from(decodeJson['results'].map((m) => Movie.fromJson(m)));
  }

  String imageUrl(String path) => '$IMAGES_URL/$path';
}
