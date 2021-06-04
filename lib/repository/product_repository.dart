import 'package:gamecloth_frontend/models/product.dart';
import 'package:gamecloth_frontend/service/gameClothProvider.dart';

class ProductRepository {
  GameClothProvider _gameClothProvider = GameClothProvider();

  Future<List<Product?>> getAllProducts() {
    return _gameClothProvider.fetchAllProducts();
  }
}
