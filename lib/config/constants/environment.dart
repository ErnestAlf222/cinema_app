import 'package:flutter_dotenv/flutter_dotenv.dart';


class Environment {

  static String theMovieDbKey = dotenv.env['MOVIE_DB_KEY'] ?? 'No hay api key';


}