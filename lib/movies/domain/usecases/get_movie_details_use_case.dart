import 'package:dartz/dartz.dart';
import 'package:netflixapp/core/error/failure.dart';
import 'package:netflixapp/movies/domain/entities/movie_detail.dart';
import 'package:netflixapp/movies/domain/repository/base_movies_repository.dart';

import '../../../core/utils/base_use_case.dart';

class GetMovieDetailsUseCase extends BaseUseCase<MovieDetail, int>{
  final BaseMoviesRepository moviesRepository;

  GetMovieDetailsUseCase(this.moviesRepository);

  @override
  Future<Either<Failure, MovieDetail>> execute(int params) async {
    return await moviesRepository.getMovieDetails(params);
  }


}