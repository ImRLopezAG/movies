import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvKeys{
  static final String? MOVIE_KEY = dotenv.env['MOVIE_KEY'];
  static final String? MOVIE_AUTH = dotenv.env['MOVIE_AUTH'];
}