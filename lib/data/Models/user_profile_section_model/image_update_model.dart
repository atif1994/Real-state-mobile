// To parse this JSON data, do
//
//     final updateimageResponse = updateimageResponseFromJson(jsonString);

import 'dart:convert';

UpdateimageResponse updateimageResponseFromJson(String str) =>
    UpdateimageResponse.fromJson(json.decode(str));

String updateimageResponseToJson(UpdateimageResponse data) =>
    json.encode(data.toJson());

class UpdateimageResponse {
  UpdateimageResponse({
    this.error,
    this.data,
    this.message,
  });

  bool? error;
  Data? data;
  String? message;

  factory UpdateimageResponse.fromJson(Map<String, dynamic> json) =>
      UpdateimageResponse(
        error: json["error"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "data": data?.toJson(),
        "message": message,
      };
}

class Data {
  Data({
    this.avatar,
  });

  String? avatar;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        avatar: json["avatar"],
      );

  Map<String, dynamic> toJson() => {
        "avatar": avatar,
      };
}
