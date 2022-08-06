
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflixapp/movies/domain/entities/movie_detail.dart';
import 'package:netflixapp/movies/domain/usecases/get_movie_details_use_case.dart';
import '../../../core/utils/enums.dart';
import '../../domain/entities/recommendation.dart';
import '../../domain/usecases/get_recommendation_use_case.dart';

part 'movie_details_event.dart';

part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final GetMovieDetailsUseCase getMovieDetailsUsecase;
  final GetRecommendationUseCase getRecommendationUsecase;

  MovieDetailsBloc(this.getMovieDetailsUsecase, this.getRecommendationUsecase)
      : super(const MovieDetailsState()) {
    on<GetMovieDetails>(_getMovieDetails);
    on<GetMovieRecommendations>(_getMovieRecommendations);
  }

  _getMovieDetails(GetMovieDetails event, emit) async {
    final result = await getMovieDetailsUsecase.execute(event.movieId);
    result.fold(
        (l) => emit(state.copyWith(
            movieDetail: null,
            requestState: RequestState.error,
            message: l.message)),
        (r) => emit(state.copyWith(
            movieDetail: r, requestState: RequestState.loaded, message: '')));
  }

  _getMovieRecommendations(GetMovieRecommendations event, emit) async {
    final result = await getRecommendationUsecase.execute(event.movieId);
    result.fold(
        (l) => emit(state.copyWith(
            recommendations: const [],
            recommendationRequestState: RequestState.error,
            recommendationMessage: l.message)),
        (r) => emit(state.copyWith(
            recommendations: r,
            recommendationRequestState: RequestState.loaded,
            recommendationMessage: '')));
  }
}
