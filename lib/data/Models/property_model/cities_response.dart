// To parse this JSON data, do
//
//     final citiesResponse = citiesResponseFromJson(jsonString);

import 'dart:convert';

CitiesResponse citiesResponseFromJson(String str) =>
    CitiesResponse.fromJson(json.decode(str));

String citiesResponseToJson(CitiesResponse data) => json.encode(data.toJson());

class CitiesResponse {
  CitiesResponse({
    this.error,
    this.data,
    this.message,
  });

  bool? error;
  List<Datum>? data;
  dynamic message;

  factory CitiesResponse.fromJson(Map<String, dynamic> json) => CitiesResponse(
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
  Datum({
    this.id,
    this.name,
    this.slug,
    this.propertiesCount,
    this.metadata,
  });

  int? id;
  String? name;
  String? slug;
  String? propertiesCount;
  List<Metadatum>? metadata;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        propertiesCount: json["properties_count"],
        metadata: json["metadata"] == null
            ? []
            : List<Metadatum>.from(
                json["metadata"]!.map((x) => Metadatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "properties_count": propertiesCount,
        "metadata": metadata == null
            ? []
            : List<dynamic>.from(metadata!.map((x) => x.toJson())),
      };
}

class Metadatum {
  Metadatum({
    this.referenceId,
    this.referenceType,
    this.metaKey,
    this.metaValue,
  });

  String? referenceId;
  String? referenceType;
  String? metaKey;
  List<String>? metaValue;

  factory Metadatum.fromJson(Map<String, dynamic> json) => Metadatum(
        referenceId: json["reference_id"],
        referenceType: json["reference_type"],
        metaKey: json["meta_key"],
        metaValue: json["meta_value"] == null
            ? []
            : List<String>.from(json["meta_value"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "reference_id": referenceId,
        "reference_type": referenceType,
        "meta_key": metaKey,
        "meta_value": metaValue == null
            ? []
            : List<dynamic>.from(metaValue!.map((x) => x)),
      };
}
