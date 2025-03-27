import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:P3B_Estudillos/FLUTTERSERVICES/Ej3/providers/car_provider.dart';

class CarList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final carProvider = Provider.of<CarProvider>(context);

    return ListView.builder(
      itemCount: carProvider.cars.length,
      itemBuilder: (context, index) {
        final car = carProvider.cars[index];

        return ListTile(
          leading: Icon(Icons.directions_car),
          title: Text("${car.make} ${car.model} (${car.year})"),
          subtitle: Text("Tipo: ${car.type}"),
        );
      },
    );
  }
}
