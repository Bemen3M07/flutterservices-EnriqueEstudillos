import 'package:flutter/material.dart';
import 'package:P3B_Estudillos/Ejercicio_4/controller/joke_controller.dart';
import 'package:P3B_Estudillos/Ejercicio_4/model/joke_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: JokeScreen(),
    );
  }
}

class JokeScreen extends StatefulWidget {
  @override
  _JokeScreenState createState() => _JokeScreenState();
}

class _JokeScreenState extends State<JokeScreen> {
  final JokeController _jokeController = JokeController();
  Joke? _currentJoke;

  @override
  void initState() {
    super.initState();
    _loadJoke();
  }

  Future<void> _loadJoke() async {
    Joke joke = await _jokeController.fetchJoke();
    setState(() {
      _currentJoke = joke;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _currentJoke != null
                ? Column(
                    children: [
                      Text(
                        _currentJoke!.setup,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 10),
                      Text(
                        _currentJoke!.punchline,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  )
                : CircularProgressIndicator(),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _loadJoke,
              child: Text('Otro'),
            ),
          ],
        ),
      ),
    );
  }
}
