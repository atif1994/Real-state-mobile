// To parse this JSON data, do
//
//     final deletePropertiesResponse = deletePropertiesResponseFromJson(jsonString);

import 'dart:convert';

DeletePropertiesResponse deletePropertiesResponseFromJson(String str) =>
    DeletePropertiesResponse.fromJson(json.decode(str));

String deletePropertiesResponseToJson(DeletePropertiesResponse data) =>
    json.encode(data.toJson());

class DeletePropertiesResponse {
  DeletePropertiesResponse({
    this.error,
    this.data,
    this.message,
  });

  bool? error;
  dynamic data;
  String? message;

  factory DeletePropertiesResponse.fromJson(Map<String, dynamic> json) =>
      DeletePropertiesResponse(
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
