import 'package:cats_breeds/infraestructure/models/cat_model.dart';
import 'package:flutter/material.dart';

class CatApiProvider extends ChangeNotifier {
  List<CatModel> cats = [];
}
