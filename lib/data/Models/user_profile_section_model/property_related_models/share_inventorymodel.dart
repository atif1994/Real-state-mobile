// To parse this JSON data, do
//
//     final shareInventory = shareInventoryFromJson(jsonString);

import 'dart:convert';

ShareInventory shareInventoryFromJson(String str) =>
    ShareInventory.fromJson(json.decode(str));

String shareInventoryToJson(ShareInventory data) => json.encode(data.toJson());

class ShareInventory {
  bool? error;
  String? data;
  String? message;

  ShareInventory({
    this.error,
    this.data,
    this.message,
  });

  factory ShareInventory.fromJson(Map<String, dynamic> json) => ShareInventory(
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
