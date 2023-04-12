// To parse this JSON data, do
//
//     final propertypost = propertypostFromJson(jsonString);

import 'dart:convert';

Propertypost propertypostFromJson(String str) =>
    Propertypost.fromJson(json.decode(str));

String propertypostToJson(Propertypost data) => json.encode(data.toJson());

class Propertypost {
  Propertypost({
    this.error,
    this.data,
    this.message,
  });

  bool? error;
  List<Datum>? data;
  String? message;

  factory Propertypost.fromJson(Map<String, dynamic> json) => Propertypost(
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
    this.userId,
    this.imagePath,
    this.adTitle,
    this.description,
    this.activeStatus,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.location,
    this.tags,
    this.user,
  });

  int? id;
  String? userId;
  String? imagePath;
  String? adTitle;
  String? description;
  String? activeStatus;
  String? deletedAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? location;
  dynamic tags;
  User? user;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        userId: json["user_id"],
        imagePath: json["image_path"],
        adTitle: json["ad_title"],
        description: json["description"],
        activeStatus: json["active_status"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        location: json["location"],
        tags: json["tags"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "image_path": imagePath,
        "ad_title": adTitle,
        "description": description,
        "active_status": activeStatus,
        "deleted_at": deletedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "location": location,
        "tags": tags,
        "user": user?.toJson(),
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
    this.referralCode,
    this.referrerId,
  });

  int? id;
  String? email;
  dynamic emailVerifiedAt;
  String? mobileNo;
  String? profileImage;
  DateTime? dob;
  String? activeStatus;
  dynamic deletedAt;
  DateTime? createdAt;
  DateTime? updatedAt;
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
  dynamic cityId;
  dynamic mobileVerificationCode;
  String? referralCode;
  dynamic referrerId;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        mobileNo: json["mobile_no"],
        profileImage: json["profile_image"],
        dob: json["dob"] == null ? null : DateTime.parse(json["dob"]),
        activeStatus: json["active_status"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
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
        referralCode: json["referral_code"],
        referrerId: json["referrer_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "mobile_no": mobileNo,
        "profile_image": profileImage,
        "dob":
            "${dob!.year.toString().padLeft(4, '0')}-${dob!.month.toString().padLeft(2, '0')}-${dob!.day.toString().padLeft(2, '0')}",
        "active_status": activeStatus,
        "deleted_at": deletedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
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
        "referral_code": referralCode,
        "referrer_id": referrerId,
      };
}
