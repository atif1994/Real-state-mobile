// To parse this JSON data, do
//
//     final getFacilitiesResponse = getFacilitiesResponseFromJson(jsonString);

import 'dart:convert';

GetFacilitiesResponse getFacilitiesResponseFromJson(String str) =>
    GetFacilitiesResponse.fromJson(json.decode(str));

String getFacilitiesResponseToJson(GetFacilitiesResponse data) =>
    json.encode(data.toJson());

class GetFacilitiesResponse {
  bool? error;
  List<Datum>? data;
  dynamic message;

  GetFacilitiesResponse({
    this.error,
    this.data,
    this.message,
  });

  factory GetFacilitiesResponse.fromJson(Map<String, dynamic> json) =>
      GetFacilitiesResponse(
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
  String? icon;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  Datum({
    this.id,
    this.name,
    this.icon,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        icon: json["icon"],
        status: json["status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "icon": icon,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
