import 'package:flutter/cupertino.dart';
import 'package:gamecloth_frontend/models/product.dart';
import 'package:gamecloth_frontend/repository/user_repository.dart';

class UserController extends ChangeNotifier {
  final _repository = UserRepository();

  List<Product> product = [];

  Future<List<Product>> fetchUserStore() async{
    product = await _repository.getUserStore();
    return product;
  }
  
  Future<bool> signIn(
      {required String username, required String password}) async {
    bool userResponse =
        await _repository.signIn(username: username, password: password);
    return userResponse;
  }
}
