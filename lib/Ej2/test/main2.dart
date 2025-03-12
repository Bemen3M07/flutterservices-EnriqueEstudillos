import 'package:P3B_Estudillos/Ej2/Screens/Home_Screen.dart';
import 'package:P3B_Estudillos/Ej2/providers/counter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create:(_)=>CounterProvider() ,
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Provaid Counter',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const Homescreen(),
    ); // <-- faltaba punto y coma aquí
  }
}

