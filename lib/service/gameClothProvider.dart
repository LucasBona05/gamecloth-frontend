import 'dart:convert';

import 'package:gamecloth_frontend/models/product.dart';
import 'package:http/http.dart' as http;

class GameClothProvider {
  static const URL_BASE = 'http://10.0.2.2:9090/services';

  Future<List<Product>> fetchAllProducts() async {
    List<Product> product = [];
    try {
      final response = await http.get(Uri.parse('$URL_BASE/product'));
      if (response.statusCode == 200) {
        // product = Product.fromJson(jsonDecode(response.body));
        product = (jsonDecode(response.body) as List)
            .map((e) => Product.fromJson(e))
            .toList();
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

  Future<List<Product>> fetchUserStore() async {
    List<Product> product = [];
    try {
      final response = await http.get(Uri.parse('$URL_BASE/myStore?id=2'));
      if (response.statusCode == 200) {
        product = (jsonDecode(response.body) as List)
            .map((e) => Product.fromJson(e))
            .toList();
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

  Future<bool> signIn(
      {required String username, required String password}) async {
    try {
      final response = await http.post(Uri.parse('$URL_BASE/signIn'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(
              <String, String>{'username': username, 'password': password}));
      if (response.statusCode == 200) {
        return true;
      } else {
        print(response.body);
      }
    } catch (exception, stacktrace) {
      print('Uma expcetion foi encontrada: $exception');
      print('O stackTrace foi: $stacktrace');
    }
    return false;
  }

  Future<bool> deleteProduct({required int idProduct}) async {
    try {
      final response = await http.put(Uri.parse('$URL_BASE/deleteProduct'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, int>{'id_product': idProduct}));
      if (response.statusCode == 200) {
        return true;
      } else {
        print(response.body);
      }
    } catch (exception, stacktrace) {
      print('Uma expcetion foi encontrada: $exception');
      print('O stackTrace foi: $stacktrace');
    }
    return false;
  }

  Future<bool> createProduct(
      {required int idUser,
      required String title,
      required String image,
      required double price,
      required String game}) async {
    try {
      final response = await http.post(Uri.parse('$URL_BASE/createProduct'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, dynamic>{
            'id_user': idUser,
            'title': title,
            'image': image,
            'price': price,
            'game': game
          }));
      if (response.statusCode == 200) {
        return true;
      } else {
        print(response.body);
      }
    } catch (exception, stacktrace) {
      print('Uma expcetion foi encontrada: $exception');
      print('O stackTrace foi: $stacktrace');
    }
    return false;
  }

  Future<bool> alterProduct(
      {required int idProduct,
      required String title,
      required String image,
      required double price,
      required String game}) async {
    try {
      final response = await http.post(Uri.parse('$URL_BASE/alterProduct'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, dynamic>{
            'id_product': idProduct,
            'title': title,
            'image': image,
            'price': price,
            'game': game
          }));
      if (response.statusCode == 200) {
        return true;
      } else {
        print(response.body);
      }
    } catch (exception, stacktrace) {
      print('Uma expcetion foi encontrada: $exception');
      print('O stackTrace foi: $stacktrace');
    }
    return false;
  }
}
