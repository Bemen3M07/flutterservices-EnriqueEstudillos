import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:P3B_Estudillos/Ej3/providers/car_provider.dart';
import 'package:P3B_Estudillos/Ej3/screens/home_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CarProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.purple),
      home: HomeScreen(),
    );
  }
}
