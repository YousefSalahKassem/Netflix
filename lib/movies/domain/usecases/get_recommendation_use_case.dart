import 'package:dartz/dartz.dart';
import 'package:netflixapp/core/error/failure.dart';
import 'package:netflixapp/core/utils/base_use_case.dart';

import '../entities/recommendation.dart';
import '../repository/base_movies_repository.dart';

class GetRecommendationUseCase extends BaseUseCase<List<Recommendation>, int> {
  final BaseMoviesRepository repository;
  GetRecommendationUseCase(this.repository);

  @override
  Future<Either<Failure, List<Recommendation>>> execute(int params) async {
    return await repository.getRecommendations(params);
  }
}