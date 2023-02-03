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
  List<Datum>? data;
  String? message;
  factory SendChatModel.fromJson(Map<String, dynamic> json) => SendChatModel(
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
    this.message,
    this.customer,
    this.agent,
    this.conversationId,
    this.status,
    this.image,
    this.senderId,
    this.createdAt,
    this.updatedAt,
    this.user,
  });
  int? id;
  String? message;
  Customer? customer;
  String? agent;
  String? conversationId;
  String? status;
  dynamic image;
  String? senderId;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic user;
  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        message: json["message"],
        customer: json["customer"] == null
            ? null
            : Customer.fromJson(json["customer"]),
        agent: json["agent"],
        conversationId: json["conversation_id"],
        status: json["status"],
        image: json["image"],
        senderId: json["sender_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        user: json["user"],
      );
  Map<String, dynamic> toJson() => {
        "id": id,
        "message": message,
        "customer": customer?.toJson(),
        "agent": agent,
        "conversation_id": conversationId,
        "status": status,
        "image": image,
        "sender_id": senderId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "user": user,
      };
}

class Customer {
  Customer({
    this.id,
    this.firstName,
    this.lastName,
    this.username,
    this.description,
    this.gender,
    this.email,
    this.avatarId,
    this.dob,
    this.phone,
    this.credits,
    this.confirmedAt,
    this.emailVerifyToken,
    this.isFeatured,
    this.createdAt,
    this.updatedAt,
    this.profileImage,
    this.addressId,
    this.roleId,
    this.deletedAt,
    this.activeStatus,
  });
  int? id;
  String? firstName;
  String? lastName;
  String? username;
  String? description;
  String? gender;
  String? email;
  String? avatarId;
  DateTime? dob;
  String? phone;
  String? credits;
  DateTime? confirmedAt;
  dynamic emailVerifyToken;
  String? isFeatured;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic profileImage;
  String? addressId;
  String? roleId;
  dynamic deletedAt;
  String? activeStatus;
  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        username: json["username"],
        description: json["description"],
        gender: json["gender"],
        email: json["email"],
        avatarId: json["avatar_id"],
        dob: json["dob"] == null ? null : DateTime.parse(json["dob"]),
        phone: json["phone"],
        credits: json["credits"],
        confirmedAt: json["confirmed_at"] == null
            ? null
            : DateTime.parse(json["confirmed_at"]),
        emailVerifyToken: json["email_verify_token"],
        isFeatured: json["is_featured"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        profileImage: json["profile_image"],
        addressId: json["address_id"],
        roleId: json["role_id"],
        deletedAt: json["deleted_at"],
        activeStatus: json["active_status"],
      );
  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "username": username,
        "description": description,
        "gender": gender,
        "email": email,
        "avatar_id": avatarId,
        "dob": dob?.toIso8601String(),
        "phone": phone,
        "credits": credits,
        "confirmed_at": confirmedAt?.toIso8601String(),
        "email_verify_token": emailVerifyToken,
        "is_featured": isFeatured,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "profile_image": profileImage,
        "address_id": addressId,
        "role_id": roleId,
        "deleted_at": deletedAt,
        "active_status": activeStatus,
      };
}
