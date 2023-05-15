// To parse this JSON data, do
//
//     final repostproperties = repostpropertiesFromJson(jsonString);

import 'dart:convert';

Repostproperties repostpropertiesFromJson(String str) =>
    Repostproperties.fromJson(json.decode(str));

String repostpropertiesToJson(Repostproperties data) =>
    json.encode(data.toJson());

class Repostproperties {
  bool? error;
  Data? data;
  String? message;

  Repostproperties({
    this.error,
    this.data,
    this.message,
  });

  factory Repostproperties.fromJson(Map<String, dynamic> json) =>
      Repostproperties(
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
  int? id;
  String? userId;
  String? imagePath;
  String? adTitle;
  String? description;
  String? activeStatus;
  String? deletedAt;
  String? createdAt;
  String? updatedAt;
  String? location;
  String? tags;

  Data({
    this.id,
    this.userId,
    this.imagePath,
    this.adTitle,
    this.description,
    this.activeStatus,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.location,
    this.tags,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        userId: json["user_id"],
        imagePath: json["image_path"],
        adTitle: json["ad_title"],
        description: json["description"],
        activeStatus: json["active_status"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        location: json["location"],
        tags: json["tags"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "image_path": imagePath,
        "ad_title": adTitle,
        "description": description,
        "active_status": activeStatus,
        "deleted_at": deletedAt,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "location": location,
        "tags": tags,
      };
}
