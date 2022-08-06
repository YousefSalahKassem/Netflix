import 'package:dartz/dartz.dart';
import 'package:netflixapp/movies/domain/entities/movie_detail.dart';
import 'package:netflixapp/movies/domain/entities/recommendation.dart';

import '../../../core/error/failure.dart';
import '../entities/movie.dart';

abstract class BaseMoviesRepository {
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies();
  Future<Either<Failure, List<Movie>>> getPopularMovies();
  Future<Either<Failure, List<Movie>>> getTopRatedMovies();
  Future<Either<Failure, MovieDetail>> getMovieDetails(int params);
  Future<Either<Failure, List<Recommendation>>> getRecommendations(int params);
}