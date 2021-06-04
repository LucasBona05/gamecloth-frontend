// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

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
    dynamic? password;
    dynamic myStore;

    factory User.fromJson(Map<String, dynamic> json) => User(
        idUser: json["idUser"],
        username: json["username"],
        password: json["password"],
        myStore: json["myStore"],
    );

    Map<String, dynamic> toJson() => {
        "idUser": idUser,
        "username": username,
        "password": password,
        "myStore": myStore,
    };
}
