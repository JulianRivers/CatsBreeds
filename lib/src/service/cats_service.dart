import 'dart:convert';
import 'package:cats_breeds/src/models/cat_model.dart';
import 'package:http/http.dart' as http;

class CatsService {
  final String apiKey = "bda53789-d59e-46cd-9bc4-2936630fde39";
  final String baseUrl = "https://api.thecatapi.com/v1";

  Future<List<CatModel>> fetchCatsData() async {
    final url = Uri.parse("$baseUrl/breeds");
    final response = await http.get(
      url,
      headers: {
        "Content-Type": "application/json",
        "x-api-key": apiKey,
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((data) => CatModel.fromJson(data)).toList();
    } else {
      throw Exception("Failed to load data");
    }
  }
}
