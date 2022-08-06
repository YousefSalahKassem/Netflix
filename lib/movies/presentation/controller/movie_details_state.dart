part of 'movie_details_bloc.dart';

class MovieDetailsState extends Equatable {
  final MovieDetail? movieDetail;
  final RequestState requestState;
  final String message;
  final List<Recommendation> recommendations;
  final RequestState recommendationRequestState;
  final String recommendationMessage;

  const MovieDetailsState({
    this.movieDetail,
    this.requestState = RequestState.loading,
    this.message = '',
    this.recommendations=const [],
    this.recommendationRequestState = RequestState.loading,
    this.recommendationMessage = '',
  });

  MovieDetailsState copyWith({
    MovieDetail? movieDetail,
    RequestState? requestState,
    String? message,
    List<Recommendation>? recommendations,
    RequestState? recommendationRequestState,
    String? recommendationMessage,
  }) {
    return MovieDetailsState(
      movieDetail: movieDetail ?? this.movieDetail,
      requestState: requestState ?? this.requestState,
      message: message ?? this.message,
      recommendations: recommendations ?? this.recommendations,
      recommendationRequestState: recommendationRequestState ?? this.recommendationRequestState,
      recommendationMessage: recommendationMessage ?? this.recommendationMessage,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        movieDetail,
        requestState,
        message,
        recommendations,
        recommendationRequestState,
        recommendationMessage,
      ];
}