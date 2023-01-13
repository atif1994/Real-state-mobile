// To parse this JSON data, do
//
//     final propertyFilterModel = propertyFilterModelFromJson(jsonString);

import 'dart:convert';

PropertyFilterModel? propertyFilterModelFromJson(String str) =>
    PropertyFilterModel.fromJson(json.decode(str));

String propertyFilterModelToJson(PropertyFilterModel? data) =>
    json.encode(data!.toJson());

class PropertyFilterModel {
  PropertyFilterModel({
    this.error,
    this.data,
    this.message,
  });

  bool? error;
  Data? data;
  dynamic message;

  factory PropertyFilterModel.fromJson(Map<String, dynamic> json) =>
      PropertyFilterModel(
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
    this.area,
  });

  int? id;
  String? name;
  dynamic description;
  String? status;
  String? order;
  String? isDefault;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? parentId;
  String? parentclass;
  List<Area?>? area;

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
        area: json["area"] == null
            ? []
            : List<Area?>.from(json["area"]!.map((x) => Area.fromJson(x))),
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
        "area": area == null
            ? []
            : List<dynamic>.from(area!.map((x) => x!.toJson())),
      };
}

class Area {
  Area({
    this.square,
  });

  String? square;

  factory Area.fromJson(Map<String, dynamic> json) => Area(
        square: json["square"],
      );

  Map<String, dynamic> toJson() => {
        "square": square,
      };
}
