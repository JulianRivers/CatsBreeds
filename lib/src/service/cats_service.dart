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
      final respuesta = jsonData.map((obj) => CatModel.fromJson(obj)).toList();
      return respuesta;
    } else {
      throw Exception("Failed to load data");
    }
  }

  Future<String?> validateImageURL(String? imageId) async {
    final urlJpg = Uri.parse('https://cdn2.thecatapi.com/images/$imageId.jpg');
    final urlPng = Uri.parse('https://cdn2.thecatapi.com/images/$imageId.png');

    try {
      final responseJpg = await http.head(urlJpg);
      if (responseJpg.statusCode == 200) {
        return urlJpg.toString();
      }

      final responsePng = await http.head(urlPng);
      if (responsePng.statusCode == 200) {
        return urlPng.toString();
      }
    } catch (error) {
      throw ('Error: $error');
    }
    return null;
  }
}
