// To parse this JSON data, do
//
//     final Product = ProductFromJson(jsonString);

import 'dart:convert';

import 'package:gamecloth_frontend/models/user.dart';

List<Product> productFromJson(String str) => List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
    Product({
        this.idProduct,
        this.createDate,
        this.user,
        this.title,
        this.image,
        this.game,
        this.price,
    });

    int? idProduct;
    DateTime? createDate;
    User? user;
    String? title;
    String? image;
    String? game;
    double? price;

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        idProduct: json["idProduct"],
        createDate: DateTime.parse(json["createDate"]),
        user: User.fromJson(json["user"]),
        title: json["title"],
        image: json["image"],
        game: json["game"],
        price: json["price"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "idProduct": idProduct,
        "createDate": "${createDate!.year.toString().padLeft(4, '0')}-${createDate!.month.toString().padLeft(2, '0')}-${createDate!.day.toString().padLeft(2, '0')}",
        "user": user!.toJson(),
        "title": title,
        "image": image,
        "game": game,
        "price": price,
    };
}
