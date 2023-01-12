// To parse this JSON data, do
//
//     final typeResponse = typeResponseFromJson(jsonString);

import 'dart:convert';

TypeResponse? typeResponseFromJson(String str) =>
    TypeResponse.fromJson(json.decode(str));

String typeResponseToJson(TypeResponse? data) => json.encode(data!.toJson());

class TypeResponse {
  TypeResponse({
    this.error,
    this.data,
    this.message,
  });

  bool? error;
  Data? data;
  dynamic message;

  factory TypeResponse.fromJson(Map<String, dynamic> json) => TypeResponse(
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
    this.types,
  });

  int? id;
  String? name;
  String? description;
  Status? status;
  String? order;
  String? isDefault;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? parentId;
  String? parentclass;
  List<dynamic>? types;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        status: statusValues.map[json["status"]],
        order: json["order"],
        isDefault: json["is_default"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        parentId: json["parent_id"],
        parentclass: json["parentclass"],
        types: json["types"] == null
            ? []
            : json["types"] == null
                ? []
                : List<Data?>.from(json["types"]!.map((x) => Data.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "status": statusValues.reverse![status],
        "order": order,
        "is_default": isDefault,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "parent_id": parentId,
        "parentclass": parentclass,
        "types": types == null
            ? []
            : types == null
                ? []
                : List<dynamic>.from(types!.map((x) => x!.toJson())),
      };
}

enum Status { PUBLISHED }

final statusValues = EnumValues({"published": Status.PUBLISHED});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    reverseMap ??= map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
