import 'package:cinemapedia/domain/entities/movie.dart';
//Abstracta por que no queremos instanciar esta clase
//Se define como lucen los origenes de datos que traen la informacion,
//los metodos voy a obtener para tener esta data

abstract class MoviesDatasource {
  Future<List<Movie>> getNowPlaying({int page = 1});

  Future<List<Movie>> getPopular({int page = 1});

  Future<List<Movie>> getTopRated({int page = 1});

  Future<List<Movie>> getUpcoming({int page = 1});

  Future<Movie> getMovieById(String id);
}
