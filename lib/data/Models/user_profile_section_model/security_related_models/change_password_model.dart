// To parse this JSON data, do
//
//     final changePasswordResponse = changePasswordResponseFromJson(jsonString);

import 'dart:convert';

ChangePasswordResponse changePasswordResponseFromJson(String str) =>
    ChangePasswordResponse.fromJson(json.decode(str));

String changePasswordResponseToJson(ChangePasswordResponse data) =>
    json.encode(data.toJson());

class ChangePasswordResponse {
  ChangePasswordResponse({
    this.error,
    this.data,
    this.message,
  });

  bool? error;
  dynamic data;
  String? message;

  factory ChangePasswordResponse.fromJson(Map<String, dynamic> json) =>
      ChangePasswordResponse(
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
