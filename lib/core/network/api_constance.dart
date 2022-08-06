class ApiConstances {
  static const String baseUrl = 'https://api.themoviedb.org/3';
  static const String apiKey = '0b56230f183ec38e26ed68b5c9183333';

  static const String nowPlayingPath = '$baseUrl/movie/now_playing?api_key=$apiKey';
  static const String popularPath = '$baseUrl/movie/popular?api_key=$apiKey';
  static const String topRatedPath = '$baseUrl/movie/top_rated?api_key=$apiKey';
  static String movieDetailPath(int movieId) => '$baseUrl/movie/$movieId?api_key=$apiKey';
  static String recommendationsPath(int movieId) => '$baseUrl/movie/$movieId/recommendations?api_key=$apiKey';

  static const String imageBaseUrl = 'https://image.tmdb.org/t/p/w500';

  static String imageUrl(String path) {
    return '$imageBaseUrl$path';
  }
}