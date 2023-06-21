// To parse this JSON data, do
//
//     final getFeaturesResponse = getFeaturesResponseFromJson(jsonString);

import 'dart:convert';

GetFeaturesResponse getFeaturesResponseFromJson(String str) =>
    GetFeaturesResponse.fromJson(json.decode(str));

String getFeaturesResponseToJson(GetFeaturesResponse data) =>
    json.encode(data.toJson());

class GetFeaturesResponse {
  bool? error;
  List<Datum>? data;
  dynamic message;

  GetFeaturesResponse({
    this.error,
    this.data,
    this.message,
  });

  factory GetFeaturesResponse.fromJson(Map<String, dynamic> json) =>
      GetFeaturesResponse(
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

  Datum({
    this.id,
    this.name,
    this.icon,
    this.status,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        icon: json["icon"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "icon": icon,
        "status": status,
      };
}
