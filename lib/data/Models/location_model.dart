// To parse this JSON data, do
//
//     final locationModel = locationModelFromJson(jsonString);

import 'dart:convert';

LocationModel? locationModelFromJson(String str) =>
    LocationModel.fromJson(json.decode(str));

String locationModelToJson(LocationModel? data) => json.encode(data!.toJson());

class LocationModel {
  LocationModel({
    this.error,
    this.data,
    this.message,
  });

  bool? error;
  List<Datum?>? data;
  String? message;

  factory LocationModel.fromJson(Map<String, dynamic> json) => LocationModel(
        error: json["error"],
        data: json["data"] == null
            ? []
            : List<Datum?>.from(json["data"]!.map((x) => Datum.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x!.toJson())),
        "message": message,
      };
}

class Datum {
  Datum({
    this.sectorAndBlockName,
  });

  String? sectorAndBlockName;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        sectorAndBlockName: json["sector_and_block_name"],
      );

  Map<String, dynamic> toJson() => {
        "sector_and_block_name": sectorAndBlockName,
      };
}
