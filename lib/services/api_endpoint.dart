class Endpoints {
  // base url

  static const String TMDB_API_BASE_URL = "https://api.themoviedb.org/3";
  static const String TMDB_BASE_IMAGE_URL = "https://image.tmdb.org/t/p/";
  static const String TMDB_API_KEY = "67af5e631dcbb4d0981b06996fcd47bc";
  static const String TMDB_API_READ_ACCESS_TOKEN =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5MzkzMmEzZDE3ZTdlYTczZGYxZDZhNjQ3ZTk4NDhjNCIsInN1YiI6IjYzYWIyNWUyNWFkNzZiMDBhZThlODc0MSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Dx-x4F_9G8Iw-E6oVoHJ0mMZ4c1DNVrUUNeHXRlNlLw';

  // receiveTimeout
  static const int receiveTimeout = 25000;
  //
  // // connectTimeout
  static const int connectionTimeout = 50000;

  //user api endpoint
  static String movieSearchUrl(String query) {
    return "$TMDB_API_BASE_URL/search/movie?query=$query&api_key=$TMDB_API_KEY";
  }
}
