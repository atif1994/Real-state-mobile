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
    this.popular,
    this.types,
    this.locations,
    this.areas,
  });

  List<Popular?>? popular;
  List<Popular?>? types;
  List<Location?>? locations;
  List<Area?>? areas;

  factory PropertyFilterModel.fromJson(Map<String, dynamic> json) =>
      PropertyFilterModel(
        popular: json["popular"] == null
            ? []
            : List<Popular?>.from(
                json["popular"]!.map((x) => Popular.fromJson(x))),
        types: json["types"] == null
            ? []
            : List<Popular?>.from(
                json["types"]!.map((x) => Popular.fromJson(x))),
        locations: json["locations"] == null
            ? []
            : List<Location?>.from(
                json["locations"]!.map((x) => Location.fromJson(x))),
        areas: json["areas"] == null
            ? []
            : List<Area?>.from(json["areas"]!.map((x) => Area.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "popular": popular == null
            ? []
            : List<dynamic>.from(popular!.map((x) => x!.toJson())),
        "types": types == null
            ? []
            : List<dynamic>.from(types!.map((x) => x!.toJson())),
        "locations": locations == null
            ? []
            : List<dynamic>.from(locations!.map((x) => x!.toJson())),
        "areas": areas == null
            ? []
            : List<dynamic>.from(areas!.map((x) => x!.toJson())),
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
