import 'package:dartz/dartz.dart';
import 'package:netflixapp/core/error/failure.dart';
import 'package:netflixapp/movies/data/datasource/movie_remote_data_source.dart';
import 'package:netflixapp/movies/domain/entities/movie.dart';
import 'package:netflixapp/movies/domain/entities/movie_detail.dart';
import 'package:netflixapp/movies/domain/entities/recommendation.dart';
import 'package:netflixapp/movies/domain/repository/base_movies_repository.dart';

import '../../../core/error/exceptions.dart';

class MovieRepository extends BaseMoviesRepository {
  final BaseMovieRemoteDataSource remoteDataSource;

  MovieRepository({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies() async {
    final result = await remoteDataSource.getNowPlayingMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessage.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async {
    final result = await remoteDataSource.getPopularMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessage.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies() async {
    final result = await remoteDataSource.getTopRatedMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessage.statusMessage));
    }
  }

  @override
  Future<Either<Failure, MovieDetail>> getMovieDetails(int params) async {
    final result = await remoteDataSource.getMovieDetails(params);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessage.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Recommendation>>> getRecommendations(int params) async {
    final result = await remoteDataSource.getRecommendations(params);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessage.statusMessage));
    }
  }
}
