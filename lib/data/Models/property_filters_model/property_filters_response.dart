

import 'dart:convert';

PropertiseFiltersResponse? propertiseFiltersResponseFromJson(String str) =>
    PropertiseFiltersResponse.fromJson(json.decode(str));

String propertiseFiltersResponseToJson(PropertiseFiltersResponse? data) =>
    json.encode(data!.toJson());

class PropertiseFiltersResponse {
  PropertiseFiltersResponse({
    this.error,
    this.data,
    this.message,
  });

  bool? error;
  Data? data;
  dynamic message;

  factory PropertiseFiltersResponse.fromJson(Map<String, dynamic> json) =>
      PropertiseFiltersResponse(
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
    this.types,
    this.locations,
    this.area,
  });

  int? id;
  String? name;
  dynamic description;
  Status? status;
  String? order;
  String? isDefault;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? parentId;
  String? parentclass;
  List<dynamic>? popular;
  List<dynamic>? types;
  List<dynamic>? locations;
  List<dynamic>? area;

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
        popular: json["popular"],);

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
        "popular": popular ,};
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

class Location {
  Location({
    this.sectorAndBlockName,
  });

  String? sectorAndBlockName;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        sectorAndBlockName: json["sector_and_block_name"],
      );

  Map<String, dynamic> toJson() => {
        "sector_and_block_name": sectorAndBlockName,
      };
}

class Popular {
  Popular({
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

  factory Popular.fromJson(Map<String, dynamic> json) => Popular(
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

///////////////////////////popular Model
///

