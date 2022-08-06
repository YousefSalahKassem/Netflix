import 'package:dartz/dartz.dart';
import 'package:netflixapp/movies/domain/repository/base_movies_repository.dart';
import '../../../core/error/failure.dart';
import '../entities/movie.dart';

class GetPopularMoviesUsecase {
  final BaseMoviesRepository _repository;

  GetPopularMoviesUsecase(this._repository);


  Future<Either<Failure, List<Movie>>> execute() async {
    return await _repository.getPopularMovies();
  }
}