// To parse this JSON data, do
//
//     final locationResponse = locationResponseFromJson(jsonString);

import 'dart:convert';

LocationResponse? locationResponseFromJson(String str) =>
    LocationResponse.fromJson(json.decode(str));

String locationResponseToJson(LocationResponse? data) =>
    json.encode(data!.toJson());

class LocationResponse {
  LocationResponse({
    this.error,
    this.data,
    this.message,
  });

  bool? error;
  Data? data;
  dynamic message;

  factory LocationResponse.fromJson(Map<String, dynamic> json) =>
      LocationResponse(
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
    this.locations,
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
  List<dynamic>? locations;

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
        locations: json["locations"] == null
            ? []
            : List<Location?>.from(
                json["locations"]!.map((x) => Location.fromJson(x))),
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
        "locations": locations == null
            ? []
            : List<dynamic>.from(locations!.map((x) => x!.toJson())),
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
