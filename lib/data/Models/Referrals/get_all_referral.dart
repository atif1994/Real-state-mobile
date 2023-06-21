// To parse this JSON data, do
//
//     final referral = referralFromJson(jsonString);

import 'dart:convert';

Referral referralFromJson(String str) => Referral.fromJson(json.decode(str));

String referralToJson(Referral data) => json.encode(data.toJson());

class Referral {
  bool? error;
  List<Datum>? data;
  String? message;

  Referral({
    this.error,
    this.data,
    this.message,
  });

  factory Referral.fromJson(Map<String, dynamic> json) => Referral(
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
  String? referralCode;
  String? email;
  List<ReferredUser>? referredUsers;
  List<dynamic>? avatar;

  Datum({
    this.id,
    this.referralCode,
    this.email,
    this.referredUsers,
    this.avatar,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        referralCode: json["referral_code"],
        email: json["email"],
        referredUsers: json["referred_users"] == null
            ? []
            : List<ReferredUser>.from(
                json["referred_users"]!.map((x) => ReferredUser.fromJson(x))),
        avatar: json["avatar"] == null
            ? []
            : List<dynamic>.from(json["avatar"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "referral_code": referralCode,
        "email": email,
        "referred_users": referredUsers == null
            ? []
            : List<dynamic>.from(referredUsers!.map((x) => x.toJson())),
        "avatar":
            avatar == null ? [] : List<dynamic>.from(avatar!.map((x) => x)),
      };
}

class ReferredUser {
  int? id;
  String? email;
  dynamic emailVerifiedAt;
  String? mobileNo;
  String? profileImage;
  dynamic dob;
  String? activeStatus;
  dynamic deletedAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? firstName;
  String? lastName;
  String? username;
  dynamic avatarId;
  String? superUser;
  String? manageSupers;
  String? permissions;
  DateTime? lastLogin;
  dynamic stripeId;
  dynamic pmType;
  dynamic pmLastFour;
  dynamic trialEndsAt;
  dynamic companyId;
  dynamic addressId;
  String? roleId;
  dynamic deactivateMessage;
  dynamic cityId;
  dynamic mobileVerificationCode;
  String? referralCode;
  String? referrerId;
  String? referalScore;

  ReferredUser({
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
    this.referalScore,
  });

  factory ReferredUser.fromJson(Map<String, dynamic> json) => ReferredUser(
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
        referalScore: json["referal_score"],
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
        "referal_score": referalScore,
      };
}
