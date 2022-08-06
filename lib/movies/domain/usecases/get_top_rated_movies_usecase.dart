import 'package:dartz/dartz.dart';
import 'package:netflixapp/movies/domain/repository/base_movies_repository.dart';
import '../../../core/error/failure.dart';
import '../entities/movie.dart';

class GetTopRatedMoviesUsecase {
  final BaseMoviesRepository moviesRepository;

  GetTopRatedMoviesUsecase(this.moviesRepository);

  Future<Either<Failure, List<Movie>>> execute() async {
    return await moviesRepository.getTopRatedMovies();
  }
}