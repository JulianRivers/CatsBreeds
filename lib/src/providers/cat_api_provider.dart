import 'package:cats_breeds/src/models/cat_model.dart';
import 'package:cats_breeds/src/service/cats_service.dart';
import 'package:flutter/material.dart';

class CatApiProvider extends ChangeNotifier {
  final CatsService _catsService = CatsService();
  bool _isInitialized = false;
  List<CatModel> _cats = [];
  List<CatModel> _filterCat = [];

  List<CatModel> get catsData => _filterCat.isNotEmpty ? _filterCat : _cats;
  bool get isInitialized => _isInitialized;

  Future<void> fetchCats() async {
    try {
      _cats = await _catsService.fetchCatsData();
      _isInitialized = true;
      notifyListeners();
    } catch (error) {
      throw Exception("Error: $error");
    }
  }

  Future<void> searchCats(String catBreed) async {
    if (catBreed.isEmpty) return;

    _filterCat = _cats.where((cat) {
      return cat.name.toLowerCase().contains(catBreed.toLowerCase());
    }).toList();

    notifyListeners();
  }

  List<CatModel> getFilteredCats(String name) {
    return _cats
        .where((cat) => cat.name.toLowerCase().contains(name.toLowerCase()))
        .toList();
  }

  void updateFilteredCats(List<CatModel> newFilteredCats) {
    _filterCat = newFilteredCats;
    notifyListeners();
  }
}
