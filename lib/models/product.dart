// To parse this JSON data, do
//
//     final Product = ProductFromJson(jsonString);

import 'dart:convert';

import 'package:gamecloth_frontend/models/user.dart';

List<Product> productFromJson(String str) =>
    List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
  Product({
    required this.idProduct,
    required this.createDate,
    required this.user,
    required this.title,
    required this.image,
    required this.game,
    required this.price,
  });

  int idProduct;
  DateTime createDate;
  User user;
  String title;
  String image;
  Game game;
  double price;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        idProduct: json["idProduct"],
        createDate: DateTime.parse(json["createDate"]),
        user: User.fromJson(json["user"]),
        title: json["title"],
        image: json["image"],
        game: gameValues.map[json["game"]]!,
        price: json["price"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "idProduct": idProduct,
        "createDate":
            "${createDate.year.toString().padLeft(4, '0')}-${createDate.month.toString().padLeft(2, '0')}-${createDate.day.toString().padLeft(2, '0')}",
        "user": user.toJson(),
        "title": title,
        "image": image,
        "game": gameValues.reverse[game],
        "price": price,
      };
}

enum Game { FORTNITE, CS, FREEFIRE, ROCKETLEAGUE, LOL, VALORANT }

final gameValues = EnumValues({
  "FORTNITE": Game.FORTNITE,
  "CS": Game.CS,
  "FREEFIRE": Game.FREEFIRE,
  "ROCKETLEAGUE": Game.ROCKETLEAGUE,
  "LOL": Game.LOL,
  "VALORANT": Game.VALORANT,
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap!;
  }
}
