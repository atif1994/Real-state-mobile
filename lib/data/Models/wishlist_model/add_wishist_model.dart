// To parse this JSON data, do
//
//     final addWishlistModel = addWishlistModelFromJson(jsonString);

import 'dart:convert';

AddWishlistModel addWishlistModelFromJson(String str) => AddWishlistModel.fromJson(json.decode(str));

String addWishlistModelToJson(AddWishlistModel data) => json.encode(data.toJson());

class AddWishlistModel {
    AddWishlistModel({
        this.error,
        this.data,
        this.message,
    });

    bool? error;
    String? data;
    String? message;

    factory AddWishlistModel.fromJson(Map<String, dynamic> json) => AddWishlistModel(
        error: json["error"],
        data: json["data"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "error": error,
        "data": data,
        "message": message,
    };
}
