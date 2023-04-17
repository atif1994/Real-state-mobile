// To parse this JSON data, do
//
//     final dealerResponse = dealerResponseFromJson(jsonString);

import 'dart:convert';

DealerResponse dealerResponseFromJson(String str) =>
    DealerResponse.fromJson(json.decode(str));

String dealerResponseToJson(DealerResponse data) => json.encode(data.toJson());

class DealerResponse {
  DealerResponse({
    this.error,
    this.data,
    this.message,
  });

  bool? error;
  Data? data;
  String? message;

  factory DealerResponse.fromJson(Map<String, dynamic> json) => DealerResponse(
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
    this.userId,
    this.adTitle,
    this.description,
    this.location,
    this.tags,
    this.imagePath,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  int? userId;
  String? adTitle;
  String? description;
  String? location;
  String? tags;
  String? imagePath;
  String? updatedAt;
  String? createdAt;
  int? id;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        userId: json["user_id"],
        adTitle: json["ad_title"],
        description: json["description"],
        location: json["location"],
        tags: json["tags"],
        imagePath: json["image_path"],
        updatedAt: json["updated_at"],
        createdAt: json["created_at"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "ad_title": adTitle,
        "description": description,
        "location": location,
        "tags": tags,
        "image_path": imagePath,
        "updated_at": updatedAt,
        "created_at": createdAt,
        "id": id,
      };
}
