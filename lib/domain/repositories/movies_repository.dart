import 'package:cinemapedia/domain/entities/movie.dart';

//Los Repositorios son los que llaman al datasource
//El repositorio es quien permite cambiar el origen de los datos

abstract class MoviesRepository {
  Future<List<Movie>> getNowPlaying({int page = 1});

  Future<List<Movie>> getPopular({int page = 1});
  Future<List<Movie>> getTopRated({int page = 1});

  Future<List<Movie>> getUpcoming({int page = 1});
  Future<Movie> getMovieById(String id);
}
