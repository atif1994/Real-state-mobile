// To parse this JSON data, do
//
//     final forgetPassModel = forgetPassModelFromJson(jsonString);

import 'dart:convert';

ForgetPassModel forgetPassModelFromJson(String str) =>
    ForgetPassModel.fromJson(json.decode(str));

String forgetPassModelToJson(ForgetPassModel data) =>
    json.encode(data.toJson());

class ForgetPassModel {
  ForgetPassModel({
    this.message,
  });

  String? message;

  factory ForgetPassModel.fromJson(Map<String, dynamic> json) =>
      ForgetPassModel(
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
      };
}
