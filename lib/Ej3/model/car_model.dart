import 'dart:convert';

class CarModel {
  final int id;
  final int year;
  final String make;
  final String model;
  final String type;

  CarModel({
    required this.id,
    required this.year,
    required this.make,
    required this.model,
    required this.type,
  });

  // Convertir JSON a CarModel
  factory CarModel.fromJson(Map<String, dynamic> json) {
    return CarModel(
      id: json["id"],
      year: json["year"],
      make: json["make"],
      model: json["model"],
      type: json["type"],
    );
  }

  // Convertir CarModel a JSON
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "year": year,
      "make": make,
      "model": model,
      "type": type,
    };
  }

  // Convertir lista de JSON a lista de CarModel
  static List<CarModel> fromJsonList(String jsonStr) {
    final data = json.decode(jsonStr);
    return List<CarModel>.from(data.map((item) => CarModel.fromJson(item)));
  }
}
