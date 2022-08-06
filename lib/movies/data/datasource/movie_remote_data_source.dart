import 'package:dio/dio.dart';
import 'package:netflixapp/core/network/api_constance.dart';
import 'package:netflixapp/core/network/error_message_model.dart';
import 'package:netflixapp/movies/data/model/movie_details_model.dart';
import 'package:netflixapp/movies/data/model/movie_model.dart';
import 'package:netflixapp/movies/data/model/recommendation_model.dart';
import '../../../core/error/exceptions.dart';

abstract class BaseMovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovies();

  Future<List<MovieModel>> getPopularMovies();
  
  Future<List<MovieModel>> getTopRatedMovies();

  Future<MovieDetailsModel> getMovieDetails(int params);

  Future<List<RecommendationModel>> getRecommendations(int params);
}

class MovieRemoteDataSource extends BaseMovieRemoteDataSource {

  @override
  Future<List<MovieModel>> getNowPlayingMovies() async{
    final response = await Dio().get(ApiConstances.nowPlayingPath);
    if(response.statusCode == 200){
      return List<MovieModel>.from((response.data['results'] as List).map((e) => MovieModel.fromJson(e)));
    }
    else{
      throw ServerException(ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async{
    final response = await Dio().get(ApiConstances.popularPath);
    if(response.statusCode == 200){
      return List<MovieModel>.from((response.data['results'] as List).map((e) => MovieModel.fromJson(e)));
    }
    else{
      throw ServerException(ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async{
    final response = await Dio().get(ApiConstances.topRatedPath);
    if(response.statusCode == 200){
      return List<MovieModel>.from((response.data['results'] as List).map((e) => MovieModel.fromJson(e)));
    }
    else{
      throw ServerException(ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<MovieDetailsModel> getMovieDetails(int params) async {
    final response = await Dio().get(ApiConstances.movieDetailPath(params));
    if(response.statusCode == 200){
      return MovieDetailsModel.fromJson((response.data));
    }
    else{
      throw ServerException(ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<RecommendationModel>> getRecommendations(int params) async {
    final response  = await Dio().get(ApiConstances.recommendationsPath(params));
    if(response.statusCode == 200){
      return List<RecommendationModel>.from((response.data['results'] as List).map((e) => RecommendationModel.fromJson(e)));
    }
    else{
      throw ServerException(ErrorMessageModel.fromJson(response.data));
    }
  }
}