import 'package:get_it/get_it.dart';
import 'package:netflixapp/movies/data/datasource/movie_remote_data_source.dart';
import 'package:netflixapp/movies/domain/repository/base_movies_repository.dart';
import 'package:netflixapp/movies/domain/usecases/get_movie_details_use_case.dart';
import 'package:netflixapp/movies/domain/usecases/get_recommendation_use_case.dart';
import '../../movies/data/repository/movies_repository.dart';
import '../../movies/domain/usecases/get_now_playing_movies_usecase.dart';
import '../../movies/domain/usecases/get_popular_movies_usecase.dart';
import '../../movies/domain/usecases/get_top_rated_movies_usecase.dart';
import '../../movies/presentation/controller/movie_details_bloc.dart';
import '../../movies/presentation/controller/movies_bloc.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init(){
    // Register data sources
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(() => MovieRemoteDataSource());

    // Register repositories
    sl.registerLazySingleton<BaseMoviesRepository>(() => MovieRepository(remoteDataSource: sl()));

    // Register use cases
    sl.registerLazySingleton<GetNowPlayingMoviesUsecase>(() => GetNowPlayingMoviesUsecase(sl()));
    sl.registerLazySingleton<GetPopularMoviesUsecase>(() => GetPopularMoviesUsecase(sl()));
    sl.registerLazySingleton<GetTopRatedMoviesUsecase>(() => GetTopRatedMoviesUsecase(sl()));
    sl.registerLazySingleton<GetMovieDetailsUseCase>(() => GetMovieDetailsUseCase(sl()));
    sl.registerLazySingleton<GetRecommendationUseCase>(() => GetRecommendationUseCase(sl()));

    // Register blocs
    sl.registerFactory<MoviesBloc>(() => MoviesBloc(sl(), sl(), sl()));
    sl.registerFactory<MovieDetailsBloc>(() => MovieDetailsBloc(sl() ,sl()));
  }
}