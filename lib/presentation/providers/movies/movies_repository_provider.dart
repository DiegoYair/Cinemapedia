//instancia del repositorio

import 'package:cinemapedia/infrastructure/datasources/moviedb_datasource.dart';
import 'package:cinemapedia/infrastructure/repositories/movie_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/* Este archivo crea la instancia del movie repository implementation
 Riverpod es el gestor de estado.
 Esta clase nunca va a cambia la Data
 */

final movieRepositoryProvider = Provider((ref) {
  // Provider es un proveedor de información.
  return MovieRepositoryImp(MoviedbDatasource());
  /* return MovieRepositoryImp(datasource);
  datasource(MoviedbDatasource).- Es el origen de datos para traer la informacion de TheMovieDB
      y asi permite que funcione el movieRepositoryProvider. 
  Objetivo:Proporcionar a los demas providers la informacion
      necesaria para que puedan consultar la informacion de MovieRepositoryImp
  */
});
