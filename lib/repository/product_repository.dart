import 'package:gamecloth_frontend/models/product.dart';
import 'package:gamecloth_frontend/service/gameClothProvider.dart';

class ProductRepository {
  GameClothProvider _gameClothProvider = GameClothProvider();

  Future<List<Product>> getAllProducts() {
    return _gameClothProvider.fetchAllProducts();
  }

  Future<bool> deleteProduct({required int idProduct}) {
    return _gameClothProvider.deleteProduct(idProduct: idProduct);
  }

  Future<bool> createProduct(
      {required int idUser,
      required String title,
      required String image,
      required double price,
      required String game}) {
    return _gameClothProvider.createProduct(
        idUser: idUser, title: title, image: image, price: price, game: game);
  }

  Future<bool> alterProduct(
      {required int idProduct,
      required String title,
      required String image,
      required double price,
      required String game}) {
    return _gameClothProvider.alterProduct(
        idProduct: idProduct,
        title: title,
        image: image,
        price: price,
        game: game);
  }
}
