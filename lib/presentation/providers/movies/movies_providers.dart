import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/movies/movies_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/*
Esta clase me permite saber cuales peliculas estan disponibles.
 StateNotifierProvider .- Es un proveedor de estado que nofitica cuando cambia su estado
 nowPlayingMoviesProvider .- Me ayuda a saber cuales son las peliculas que estan ahora en cines 
 */
final nowPlayingMoviesProvider =
    StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
  /*
      StateNotifierProvider<MoviesNotifier, List<Movie>>
      MoviesNotifier .- Clase que lo controla que sirve para notificar 
      List<Movie> .- Data o stage
      */
  final fetchMoreMovies = ref.watch(movieRepositoryProvider).getNowPlaying;
  return MoviesNotifier(fetchMoreMovies: fetchMoreMovies);
});

final popularMoviesProvider =
    StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
  final fetchMoreMovies = ref.watch(movieRepositoryProvider).getPopular;
  return MoviesNotifier(fetchMoreMovies: fetchMoreMovies);
});

final upcomingMoviesProvider =
    StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
  final fetchMoreMovies = ref.watch(movieRepositoryProvider).getUpcoming;
  return MoviesNotifier(fetchMoreMovies: fetchMoreMovies);
});

final topRatedMoviesProvider =
    StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
  final fetchMoreMovies = ref.watch(movieRepositoryProvider).getTopRated;
  return MoviesNotifier(fetchMoreMovies: fetchMoreMovies);
});

//ESpecifica el tipo de funcion que espero.Define el caso de uso
typedef MovieCallback = Future<List<Movie>> Function({int page});

/*
StateNotifier.- Este paquete es una solución recomendada para administrar el estado cuando se usa Provider 
o Riverpod. Para resumir, en lugar de extender ChangeNotifier, extienda StateNotifier.
*/

class MoviesNotifier extends StateNotifier<List<Movie>> {
  int currentPage = 0; //pagina actual
  bool isLoading = false;
  MovieCallback fetchMoreMovies;
  MoviesNotifier({required this.fetchMoreMovies}) : super([]);

  Future<void> loadNextPage() async {
    if (isLoading) return;
    isLoading = true;
    currentPage++;
    final List<Movie> movies = await fetchMoreMovies(page: currentPage);
    state = [...state, ...movies]; //operador spread

    await Future.delayed(const Duration(milliseconds: 300));
    isLoading = false;
  }
}
