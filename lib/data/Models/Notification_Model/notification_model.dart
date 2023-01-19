// To parse this JSON data, do
//
//     final notificationModel = notificationModelFromJson(jsonString);

import 'dart:convert';

NotificationModel? notificationModelFromJson(String str) =>
    NotificationModel.fromJson(json.decode(str));

String notificationModelToJson(NotificationModel? data) =>
    json.encode(data!.toJson());

class NotificationModel {
  NotificationModel({
    this.error,
    this.data,
    this.message,
  });

  bool? error;
  List<Datum?>? data;
  String? message;

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      NotificationModel(
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
    this.id,
    this.type,
    this.status,
    this.description,
    this.recieverId,
    this.senderId,
    this.createdAt,
    this.updatedAt,
    this.data,
  });

  int? id;
  String? type;
  String? status;
  String? description;
  String? recieverId;
  String? senderId;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? data;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        type: json["type"],
        status: json["status"],
        description: json["description"],
        recieverId: json["reciever_id"],
        senderId: json["sender_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": typeValues.reverse![type],
        "status": status,
        "description": descriptionValues.reverse![description],
        "reciever_id": recieverId,
        "sender_id": senderId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "data": data,
      };
}

enum Description { NEW_COMPANY_OWNER_REGISTERED }

final descriptionValues = EnumValues(
    {"New Company Owner registered": Description.NEW_COMPANY_OWNER_REGISTERED});

enum Type { NEW_COMPANY_OWNER }

final typeValues = EnumValues({"New Company Owner": Type.NEW_COMPANY_OWNER});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    reverseMap ??= map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
