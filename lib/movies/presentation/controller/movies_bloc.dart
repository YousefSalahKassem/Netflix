import 'package:netflixapp/movies/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:netflixapp/movies/presentation/controller/movies_event.dart';
import 'package:netflixapp/movies/presentation/controller/movies_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/utils/enums.dart';
import '../../domain/usecases/get_popular_movies_usecase.dart';
import '../../domain/usecases/get_top_rated_movies_usecase.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMoviesUsecase getNowPlayingMoviesUsecase;
  final GetPopularMoviesUsecase getPopularMoviesUsecase;
  final GetTopRatedMoviesUsecase getTopRatedMoviesUsecase;

  MoviesBloc(this.getNowPlayingMoviesUsecase, this.getPopularMoviesUsecase,
      this.getTopRatedMoviesUsecase)
      : super(const MoviesState()) {
    on<GetNowPlayingMoviesEvent>(_getNowPlayingMovies);
    on<GetPopularMoviesEvent>(_getPopularMovies);
    on<GetTopRatedMoviesEvent>(_getTopRatedMovies);
  }

  _getNowPlayingMovies(GetNowPlayingMoviesEvent event, emit) async {
    final result = await getNowPlayingMoviesUsecase.execute();
    result.fold(
        (l) => emit(state.copyWith(
            nowPlayingState: RequestState.error, nowPlayingMessage: l.message)),
        (r) => emit(state.copyWith(
            nowPlayingState: RequestState.loaded, nowPlayingMovies: r)));
  }

  _getPopularMovies(GetPopularMoviesEvent event, emit) async {
    final result = await getPopularMoviesUsecase.execute();
    result.fold(
        (l) => emit(state.copyWith(
            popularState: RequestState.error, popularMessage: l.message)),
        (r) => emit(state.copyWith(
            popularState: RequestState.loaded, popularMovies: r)));
  }

  _getTopRatedMovies(GetTopRatedMoviesEvent event, emit) async {
    final result = await getTopRatedMoviesUsecase.execute();
    result.fold(
        (l) => emit(state.copyWith(
            topRatedState: RequestState.error, topRatedMessage: l.message)),
        (r) => emit(state.copyWith(
            topRatedState: RequestState.loaded, topRatedMovies: r)));
  }
}
