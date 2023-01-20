// To parse this JSON data, do
//
//     final postLikeResponse = postLikeResponseFromJson(jsonString);

import 'dart:convert';

PostLikeResponse postLikeResponseFromJson(String str) =>
    PostLikeResponse.fromJson(json.decode(str));

String postLikeResponseToJson(PostLikeResponse data) =>
    json.encode(data.toJson());

class PostLikeResponse {
  PostLikeResponse({
    this.success,
    this.message,
    this.notdeleted,
    this.likeCount,
  });

  bool? success;
  String? message;
  bool? notdeleted;
  int? likeCount;

  factory PostLikeResponse.fromJson(Map<String, dynamic> json) =>
      PostLikeResponse(
        success: json["success"],
        message: json["message"],
        notdeleted: json["notdeleted"],
        likeCount: json["like_count"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "notdeleted": notdeleted,
        "like_count": likeCount,
      };
}
