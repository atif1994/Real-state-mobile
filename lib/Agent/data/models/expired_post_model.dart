// To parse this JSON data, do
//
//     final expiredproperties = expiredpropertiesFromJson(jsonString);

import 'dart:convert';

Expiredproperties expiredpropertiesFromJson(String str) =>
    Expiredproperties.fromJson(json.decode(str));

String expiredpropertiesToJson(Expiredproperties data) =>
    json.encode(data.toJson());

class Expiredproperties {
  bool? error;
  List<Datum>? data;
  String? message;

  Expiredproperties({
    this.error,
    this.data,
    this.message,
  });

  factory Expiredproperties.fromJson(Map<String, dynamic> json) =>
      Expiredproperties(
        error: json["error"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "message": message,
      };
}

class Datum {
  String? id;
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

  Datum({
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

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
