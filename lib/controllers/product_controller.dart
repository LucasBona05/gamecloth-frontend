import 'package:flutter/cupertino.dart';
import 'package:gamecloth_frontend/models/product.dart';
import 'package:gamecloth_frontend/repository/product_repository.dart';

class ProductController extends ChangeNotifier {
  final _repository = ProductRepository();

  List<Product?> product = [];

  Future<List<Product?>> fetchAllProducts() async{
    product = await _repository.getAllProducts();
    return product;
  }
}