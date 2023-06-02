// To parse this JSON data, do
//
//     final likeModel = likeModelFromJson(jsonString);

import 'dart:convert';

LikeModel likeModelFromJson(String str) => LikeModel.fromJson(json.decode(str));

String likeModelToJson(LikeModel data) => json.encode(data.toJson());

class LikeModel {
  bool? success;
  String? message;
  List<Likelist>? likelist;
  int? isliked;
  int? likeOcunt;
  bool? notdeleted;
  List<Property>? property;

  LikeModel({
    this.success,
    this.message,
    this.likelist,
    this.isliked,
    this.likeOcunt,
    this.notdeleted,
    this.property,
  });

  factory LikeModel.fromJson(Map<String, dynamic> json) => LikeModel(
        success: json["success"],
        message: json["message"],
        likelist: json["likelist"] == null
            ? []
            : List<Likelist>.from(
                json["likelist"]!.map((x) => Likelist.fromJson(x))),
        isliked: json["isliked"],
        likeOcunt: json["like_ocunt"],
        notdeleted: json["notdeleted"],
        property: json["property"] == null
            ? []
            : List<Property>.from(
                json["property"]!.map((x) => Property.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "likelist": likelist == null
            ? []
            : List<dynamic>.from(likelist!.map((x) => x.toJson())),
        "isliked": isliked,
        "like_ocunt": likeOcunt,
        "notdeleted": notdeleted,
        "property": property == null
            ? []
            : List<dynamic>.from(property!.map((x) => x.toJson())),
      };
}

class Likelist {
  int? id;

  Likelist({
    this.id,
  });

  factory Likelist.fromJson(Map<String, dynamic> json) => Likelist(
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
      };
}

class Property {
  int? id;
  String? userId;
  String? imagePath;
  String? adTitle;
  String? description;
  String? activeStatus;
  String? deletedAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic location;
  dynamic tags;
  List<LikesOnProperty>? likesOnProperties;

  Property({
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
    this.likesOnProperties,
  });

  factory Property.fromJson(Map<String, dynamic> json) => Property(
        id: json["id"],
        userId: json["user_id"],
        imagePath: json["image_path"],
        adTitle: json["ad_title"],
        description: json["description"],
        activeStatus: json["active_status"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        location: json["location"],
        tags: json["tags"],
        likesOnProperties: json["likes_on_properties"] == null
            ? []
            : List<LikesOnProperty>.from(json["likes_on_properties"]!
                .map((x) => LikesOnProperty.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "image_path": imagePath,
        "ad_title": adTitle,
        "description": description,
        "active_status": activeStatus,
        "deleted_at": deletedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "location": location,
        "tags": tags,
        "likes_on_properties": likesOnProperties == null
            ? []
            : List<dynamic>.from(likesOnProperties!.map((x) => x.toJson())),
      };
}

class LikesOnProperty {
  bool? isliked;

  LikesOnProperty({
    this.isliked,
  });

  factory LikesOnProperty.fromJson(Map<String, dynamic> json) =>
      LikesOnProperty(
        isliked: json["isliked"],
      );

  Map<String, dynamic> toJson() => {
        "isliked": isliked,
      };
}
