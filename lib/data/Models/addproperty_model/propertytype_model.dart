// To parse this JSON data, do
//
//     final propertyTypesResponse = propertyTypesResponseFromJson(jsonString);

import 'dart:convert';

PropertyTypesResponse propertyTypesResponseFromJson(String str) =>
    PropertyTypesResponse.fromJson(json.decode(str));

String propertyTypesResponseToJson(PropertyTypesResponse data) =>
    json.encode(data.toJson());

class PropertyTypesResponse {
  bool? error;
  List<Datum>? data;
  dynamic message;

  PropertyTypesResponse({
    this.error,
    this.data,
    this.message,
  });

  factory PropertyTypesResponse.fromJson(Map<String, dynamic> json) =>
      PropertyTypesResponse(
        error: json["error"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "message": message,
      };
}

class Datum {
  int? id;
  String? name;
  String? slug;
  String? order;
  String? code;

  Datum({
    this.id,
    this.name,
    this.slug,
    this.order,
    this.code,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        order: json["order"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "order": order,
        "code": code,
      };
}
