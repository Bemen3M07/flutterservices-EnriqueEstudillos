import 'package:flutter/material.dart';
import '../provider/CarProvider.dart';
import '../page/CarsPage.dart';
import '../data/car_http_service.dart';
import '../model/car_model.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CarProvider(),
      child: MaterialApp(
        title: 'Rent Cars',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const CarsPage()
      ),
    );
  }
}