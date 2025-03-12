import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import '../model/joke_model.dart';

class JokeController {
  static const String apiUrl = "https://api.sampleapis.com/jokes/goodJokes";

  Future<Joke> fetchJoke() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List<dynamic> jokes = jsonDecode(response.body);
      if (jokes.isNotEmpty) {
        final randomIndex = Random().nextInt(jokes.length);
        final jokeData = jokes[randomIndex];
        return Joke.fromJson(jokeData);
      } else {
        throw Exception("No se encontraron chistes.");
      }
    } else {
      throw Exception("Error al cargar el chiste.");
    }
  }
}
