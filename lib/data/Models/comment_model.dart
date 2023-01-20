// To parse this JSON data, do
//
//     final newsfeedCommentt = newsfeedCommenttFromJson(jsonString);

import 'dart:convert';

NewsfeedCommentt newsfeedCommenttFromJson(String str) =>
    NewsfeedCommentt.fromJson(json.decode(str));

String newsfeedCommenttToJson(NewsfeedCommentt data) =>
    json.encode(data.toJson());

class NewsfeedCommentt {
  NewsfeedCommentt({
    this.error,
    this.data,
    this.message,
  });

  bool? error;
  dynamic data;
  String? message;

  factory NewsfeedCommentt.fromJson(Map<String, dynamic> json) =>
      NewsfeedCommentt(
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
