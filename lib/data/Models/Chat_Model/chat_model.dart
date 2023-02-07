// To parse this JSON data, do
//
//     final chatModel = chatModelFromJson(jsonString);

import 'dart:convert';

ChatModel chatModelFromJson(String str) => ChatModel.fromJson(json.decode(str));

String chatModelToJson(ChatModel data) => json.encode(data.toJson());

class ChatModel {
  ChatModel({
    this.error,
    this.data,
    this.message,
  });

  bool? error;
  List<Datum>? data;
  String? message;

  factory ChatModel.fromJson(Map<String, dynamic> json) => ChatModel(
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
  String? createdAt;
  String? updatedAt;
  User? user;

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
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
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
        "created_at": createdAt,
        "updated_at": updatedAt,
        "user": user?.toJson(),
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
  dynamic credits;
  DateTime? confirmedAt;
  dynamic emailVerifyToken;
  String? isFeatured;
  String? createdAt;
  String? updatedAt;
  String? profileImage;
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
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
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
        "created_at": createdAt,
        "updated_at": updatedAt,
        "profile_image": profileImage,
        "address_id": addressId,
        "role_id": roleId,
        "deleted_at": deletedAt,
        "active_status": activeStatus,
      };
}

class User {
  User({
    this.id,
    this.email,
    this.emailVerifiedAt,
    this.mobileNo,
    this.profileImage,
    this.dob,
    this.activeStatus,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.firstName,
    this.lastName,
    this.username,
    this.avatarId,
    this.superUser,
    this.manageSupers,
    this.permissions,
    this.lastLogin,
    this.stripeId,
    this.pmType,
    this.pmLastFour,
    this.trialEndsAt,
    this.companyId,
    this.addressId,
    this.roleId,
    this.deactivateMessage,
    this.cityId,
    this.mobileVerificationCode,
  });

  int? id;
  String? email;
  dynamic emailVerifiedAt;
  String? mobileNo;
  dynamic profileImage;
  dynamic dob;
  String? activeStatus;
  dynamic deletedAt;
  DateTime? createdAt;
  String? updatedAt;
  String? firstName;
  String? lastName;
  String? username;
  String? avatarId;
  String? superUser;
  String? manageSupers;
  String? permissions;
  DateTime? lastLogin;
  dynamic stripeId;
  dynamic pmType;
  dynamic pmLastFour;
  dynamic trialEndsAt;
  String? companyId;
  String? addressId;
  String? roleId;
  String? deactivateMessage;
  String? cityId;
  dynamic mobileVerificationCode;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        mobileNo: json["mobile_no"],
        profileImage: json["profile_image"],
        dob: json["dob"],
        activeStatus: json["active_status"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        username: json["username"],
        avatarId: json["avatar_id"],
        superUser: json["super_user"],
        manageSupers: json["manage_supers"],
        permissions: json["permissions"],
        lastLogin: json["last_login"] == null
            ? null
            : DateTime.parse(json["last_login"]),
        stripeId: json["stripe_id"],
        pmType: json["pm_type"],
        pmLastFour: json["pm_last_four"],
        trialEndsAt: json["trial_ends_at"],
        companyId: json["company_id"],
        addressId: json["address_id"],
        roleId: json["role_id"],
        deactivateMessage: json["deactivate_message"],
        cityId: json["city_id"],
        mobileVerificationCode: json["mobile_verification_code"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "mobile_no": mobileNo,
        "profile_image": profileImage,
        "dob": dob,
        "active_status": activeStatus,
        "deleted_at": deletedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt,
        "first_name": firstName,
        "last_name": lastName,
        "username": username,
        "avatar_id": avatarId,
        "super_user": superUser,
        "manage_supers": manageSupers,
        "permissions": permissions,
        "last_login": lastLogin?.toIso8601String(),
        "stripe_id": stripeId,
        "pm_type": pmType,
        "pm_last_four": pmLastFour,
        "trial_ends_at": trialEndsAt,
        "company_id": companyId,
        "address_id": addressId,
        "role_id": roleId,
        "deactivate_message": deactivateMessage,
        "city_id": cityId,
        "mobile_verification_code": mobileVerificationCode,
      };
}
