import 'package:flutter_dotenv/flutter_dotenv.dart';

//Conserva las variables de entorno de forma estatica para que podamos hacer uso de ellas.
class Environment {
  static String theMovieDbKey =
      dotenv.env['THE_MOVIEDB_KEY'] ?? 'No hay API Key';
}
