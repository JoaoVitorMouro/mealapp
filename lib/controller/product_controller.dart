import 'dart:convert';

import 'package:unimar_app_pos/models/product_model.dart';
import 'package:http/http.dart' as http;

/// Acessar a API e receber os dados e em seguida, passar para a Screen
///
/// 1.Metodo para pegar os produtos da API

class ProductController {
  String baseUrl = "https://www.themealdb.com/api/json/v1/1/search.php?s=";

  Future<List<Product>> getAllProducts() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      // API retornou sucesso
      print(
          "API response: ${response.body}"); // Adicione isso para ver o corpo da resposta no console
      List<dynamic> jsonData = json.decode(
          response.body)['meals']; // Certifique-se de acessar o campo correto
      return jsonData.map((product) => Product.fromJson(product)).toList();
    } else {
      throw Exception(
          'Failed to load products, status code: ${response.statusCode}');
    }
  }
}
