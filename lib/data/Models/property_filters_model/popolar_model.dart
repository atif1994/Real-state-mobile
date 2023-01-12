// To parse this JSON data, do
//
//     final popularResponse = popularResponseFromJson(jsonString);

import 'dart:convert';

PopularResponse? popularResponseFromJson(String str) =>
    PopularResponse.fromJson(json.decode(str));

String popularResponseToJson(PopularResponse? data) =>
    json.encode(data!.toJson());

class PopularResponse {
  PopularResponse({
    this.error,
    this.data,
    this.message,
  });

  bool? error;
  Data? data;
  dynamic message;

  factory PopularResponse.fromJson(Map<String, dynamic> json) =>
      PopularResponse(
        error: json["error"],
        data: Data.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "data": data!.toJson(),
        "message": message,
      };
}

class Data {
  Data({
    this.id,
    this.name,
    this.description,
    this.status,
    this.order,
    this.isDefault,
    this.createdAt,
    this.updatedAt,
    this.parentId,
    this.parentclass,
    this.popular,
  });

  int? id;
  String? name;
  String? description;
  String? status;
  String? order;
  String? isDefault;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? parentId;
  String? parentclass;
  List<dynamic>? popular;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        status: json["status"],
        order: json["order"],
        isDefault: json["is_default"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        parentId: json["parent_id"],
        parentclass: json["parentclass"],
        popular: json["popular"] == null
            ? []
            : json["popular"] == null
                ? []
                : List<Data?>.from(
                    json["popular"]!.map((x) => Data.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "status": status,
        "order": order,
        "is_default": isDefault,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "parent_id": parentId,
        "parentclass": parentclass,
        "popular": popular == null
            ? []
            : popular == null
                ? []
                : List<dynamic>.from(popular!.map((x) => x!.toJson())),
      };
}
