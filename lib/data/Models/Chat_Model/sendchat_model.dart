// To parse this JSON data, do
//
//     final sendChatModel = sendChatModelFromJson(jsonString);

import 'dart:convert';

SendChatModel sendChatModelFromJson(String str) =>
    SendChatModel.fromJson(json.decode(str));

String sendChatModelToJson(SendChatModel data) => json.encode(data.toJson());

class SendChatModel {
  SendChatModel({
    this.error,
    this.data,
    this.message,
  });

  bool? error;
  Data? data;
  String? message;

  factory SendChatModel.fromJson(Map<String, dynamic> json) => SendChatModel(
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
  Data({
    this.message,
    this.customer,
    this.agent,
    this.senderId,
    this.conversationId,
    this.status,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  String? message;
  int? customer;
  int? agent;
  int? senderId;
  int? conversationId;
  int? status;
  DateTime? updatedAt;
  DateTime? createdAt;
  int? id;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        message: json["message"],
        customer: json["customer"],
        agent: json["agent"],
        senderId: json["sender_id"],
        conversationId: json["conversation_id"],
        status: json["status"],
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "customer": customer,
        "agent": agent,
        "sender_id": senderId,
        "conversation_id": conversationId,
        "status": status,
        "updated_at": updatedAt?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "id": id,
      };
}
