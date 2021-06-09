import 'package:flutter/cupertino.dart';
import 'package:gamecloth_frontend/models/product.dart';
import 'package:gamecloth_frontend/repository/product_repository.dart';

class ProductController extends ChangeNotifier {
  final _repository = ProductRepository();

  List<Product> product = [];

  Future<List<Product>> fetchAllProducts() async {
    product = await _repository.getAllProducts();
    return product;
  }

  Future<bool> deleteProduct({required int idProduct}) async {
    return await _repository.deleteProduct(idProduct: idProduct);
  }

  Future<bool> createProduct(
      {required int idUser,
      required String title,
      required String image,
      required double price,
      required String game}) async {
    if (game == 'League of Legends') {
      game = 'LOL';
    } else if (game == 'Counter Strike Global Offensive') {
      game = 'CS';
    }

    print(game);

    return await _repository.createProduct(
        idUser: idUser,
        title: title,
        image: image,
        price: price,
        game: game.replaceAll(new RegExp(r"\s+"), "").toUpperCase());
  }

  Future<bool> alterProduct(
      {required int idProduct,
      required String title,
      required String image,
      required double price,
      required String game}) async {
    if (game == 'League of Legends') {
      game = 'LOL';
    } else if (game == 'Counter Strike Global Offensive') {
      game = 'CS';
    }

    print(game);

    return await _repository.alterProduct(
        idProduct: idProduct,
        title: title,
        image: image,
        price: price,
        game: game.replaceAll(new RegExp(r"\s+"), "").toUpperCase());
  }
}
