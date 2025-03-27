import 'package:P3B_Estudillos/FLUTTERSERVICES/Ej4/Old/model/joke_model.dart';

class JokeController {
  Future<String> getRandomJoke() async {
    try {
      final joke = await JokeModel.fetchRandomJoke();
      return joke;
    } catch (e) {
      return 'Error al cargar: $e';
    }
  }
}
