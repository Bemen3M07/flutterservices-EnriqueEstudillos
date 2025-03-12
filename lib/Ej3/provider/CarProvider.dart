import 'package:flutter/cupertino.dart';
import '../data/car_http_service.dart';
import '../model/car_model.dart';

class CarProvider extends ChangeNotifier{
  List<CarsModel> carsModel = [];
  CarHttpService carHttpService = CarHttpService();

  void getCarsData() async{
    carsModel = await carHttpService.getCars();
    notifyListeners();
  }
}