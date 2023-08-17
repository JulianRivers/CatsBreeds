import 'package:cats_breeds/src/models/cat_model.dart';
import 'package:cats_breeds/src/service/cats_service.dart';
import 'package:flutter/material.dart';

class CatApiProvider extends ChangeNotifier {
  final CatsService _catsService = CatsService();
  bool _isInitialized = false;
  late CatModel _catDetail;
  List<CatModel> _cats = [];

  List<CatModel> get cats => _cats;
  bool get isInitialized => _isInitialized;
  CatModel get cat => _catDetail;

  Future<void> fetchCats() async {
    try {
      _cats = await _catsService.fetchCatsData();
      _isInitialized = true;
      notifyListeners();
    } catch (error) {
      throw Exception("Error: $error");
    }
  }
}
