// To parse this JSON data, do
//
//     final contactUsResponseModel = contactUsResponseModelFromJson(jsonString);

import 'dart:convert';

ContactUsResponseModel contactUsResponseModelFromJson(String str) =>
    ContactUsResponseModel.fromJson(json.decode(str));

String contactUsResponseModelToJson(ContactUsResponseModel data) =>
    json.encode(data.toJson());

class ContactUsResponseModel {
  ContactUsResponseModel({
    this.error,
    this.data,
    this.message,
  });

  bool? error;
  dynamic data;
  String? message;

  factory ContactUsResponseModel.fromJson(Map<String, dynamic> json) =>
      ContactUsResponseModel(
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
