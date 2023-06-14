// To parse this JSON data, do
//
//     final revokeControlResponse = revokeControlResponseFromJson(jsonString);

import 'dart:convert';

RevokeControlResponse revokeControlResponseFromJson(String str) =>
    RevokeControlResponse.fromJson(json.decode(str));

String revokeControlResponseToJson(RevokeControlResponse data) =>
    json.encode(data.toJson());

class RevokeControlResponse {
  bool? error;
  Data? data;
  String? message;

  RevokeControlResponse({
    this.error,
    this.data,
    this.message,
  });

  factory RevokeControlResponse.fromJson(Map<String, dynamic> json) =>
      RevokeControlResponse(
        error: json["error"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "data": data?.toJson(),
        "message": message,
      };
}

class Data {
  int? id;
  String? customerId;
  String? agentId;
  String? propertyId;
  DateTime? createdAt;
  DateTime? updatedAt;

  Data({
    this.id,
    this.customerId,
    this.agentId,
    this.propertyId,
    this.createdAt,
    this.updatedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        customerId: json["customer_id"],
        agentId: json["agent_id"],
        propertyId: json["property_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "customer_id": customerId,
        "agent_id": agentId,
        "property_id": propertyId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
