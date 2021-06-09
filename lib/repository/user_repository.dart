import 'package:gamecloth_frontend/models/product.dart';
import 'package:gamecloth_frontend/service/gameClothProvider.dart';

class UserRepository {
  GameClothProvider _gameClothProvider = GameClothProvider();

  Future<bool> signIn({required String username, required String password}) {
    return _gameClothProvider.signIn(username: username, password: password);
  }

    Future<List<Product>> getUserStore() {
    return _gameClothProvider.fetchUserStore();
  }
}