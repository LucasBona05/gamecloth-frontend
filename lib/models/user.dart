// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

import 'package:gamecloth_frontend/models/product.dart';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
    User({
        this.idUser,
        this.username,
        this.password,
        this.myStore,
    });

    int? idUser;
    String? username;
    dynamic password;
    List<Product>? myStore;

    factory User.fromJson(Map<String, dynamic> json) => User(
        idUser: json["idUser"],
        username: json["username"],
        password: json["password"],
        myStore: json["myStore"] ?? [],
    );

    Map<String, dynamic> toJson() => {
        "idUser": idUser,
        "username": username,
        "password": password,
        "myStore": myStore,
    };
}
