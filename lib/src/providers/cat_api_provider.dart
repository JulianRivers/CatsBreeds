import 'package:cats_breeds/src/models/cat_model.dart';
import 'package:cats_breeds/src/service/cats_service.dart';
import 'package:flutter/material.dart';

class CatApiProvider extends ChangeNotifier {
  final CatsService _catsService = CatsService();
  List<CatModel> _cats = [];

  List<CatModel> get cats => _cats;

  Future<void> fetchCats() async {
    try {
      _cats = await _catsService.fetchCatsData();
      notifyListeners();
    } catch (error) {
      print("Error in fetchCats(): $error"); // Imprime el error en la consola
      throw Exception("Error: $error"); // Lanza una nueva excepción
    }
  }
}
