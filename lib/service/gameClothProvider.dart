import 'dart:convert';

import 'package:gamecloth_frontend/models/product.dart';
import 'package:http/http.dart' as http;

class GameClothProvider {
  static const URL_BASE = 'http://10.0.2.2:9090/services';

  Future<List<Product?>> fetchAllProducts() async {
    List<Product?> product = [];
    try {
      final response = await http.get(Uri.parse('$URL_BASE/product'));
      print(response);
      print('${response.body}');
      if (response.statusCode == 200) {
        // product = Product.fromJson(jsonDecode(response.body));
        product = (jsonDecode(response.body) as List).map((e) => Product.fromJson(e)).toList();
        print(product);
        
      } else {
        print('STATUS DIFERENTE DE 200');
        print('STATUS CODE: ${response.statusCode}');
      }
    } catch (exception, stacktrace) {
      print('Uma expcetion foi encontrada: $exception');
      print('O stackTrace foi: $stacktrace');
    }
    return product;
  }
}
