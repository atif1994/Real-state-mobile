// To parse this JSON data, do
//
//     final referral = referralFromJson(jsonString);

import 'dart:convert';

Referral referralFromJson(String str) => Referral.fromJson(json.decode(str));

String referralToJson(Referral data) => json.encode(data.toJson());

class Referral {
  Referral({
    this.error,
    this.data,
    this.message,
  });

  bool? error;
  List<Datum>? data;
  String? message;

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
  Datum({
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
    this.avatar,
  });

  int? id;
  String? email;
  dynamic emailVerifiedAt;
  String? mobileNo;
  String? profileImage;
  dynamic dob;
  String? activeStatus;
  dynamic deletedAt;
  String? createdAt;
  String? updatedAt;
  String? firstName;
  String? lastName;
  String? username;
  String? avatarId;
  String? superUser;
  String? manageSupers;
  dynamic permissions;
  String? lastLogin;
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
  String? referralCode;
  String? referrerId;
  dynamic avatar;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        mobileNo: json["mobile_no"],
        profileImage: json["profile_image"],
        dob: json["dob"],
        activeStatus: json["active_status"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        username: json["username"],
        avatarId: json["avatar_id"],
        superUser: json["super_user"],
        manageSupers: json["manage_supers"],
        permissions: json["permissions"],
        lastLogin: json["last_login"],
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
        avatar: json["avatar"],
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
        "created_at": createdAt,
        "updated_at": updatedAt,
        "first_name": firstName,
        "last_name": lastName,
        "username": username,
        "avatar_id": avatarId,
        "super_user": superUser,
        "manage_supers": manageSupers,
        "permissions": permissions,
        "last_login": lastLogin,
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
        "avatar": avatar,
      };
}

class AvatarClass {
  AvatarClass({
    this.id,
    this.userId,
    this.name,
    this.folderId,
    this.mimeType,
    this.size,
    this.url,
    this.options,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  int? id;
  String? userId;
  String? name;
  String? folderId;
  String? mimeType;
  String? size;
  String? url;
  List<dynamic>? options;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;

  factory AvatarClass.fromJson(Map<String, dynamic> json) => AvatarClass(
        id: json["id"],
        userId: json["user_id"],
        name: json["name"],
        folderId: json["folder_id"],
        mimeType: json["mime_type"],
        size: json["size"],
        url: json["url"],
        options: json["options"] == null
            ? []
            : List<dynamic>.from(json["options"]!.map((x) => x)),
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        deletedAt: json["deleted_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "name": name,
        "folder_id": folderId,
        "mime_type": mimeType,
        "size": size,
        "url": url,
        "options":
            options == null ? [] : List<dynamic>.from(options!.map((x) => x)),
        "created_at": createdAt,
        "updated_at": updatedAt,
        "deleted_at": deletedAt,
      };
}

class PermissionsClass {
  PermissionsClass({
    this.consultIndex,
    this.consultCreate,
    this.consultEdit,
    this.consultsIndex,
    this.consultsEdit,
    this.mediaIndex,
    this.filesIndex,
    this.filesCreate,
    this.propertyIndex,
    this.propertyCreate,
    this.propertyEdit,
    this.propertyDestroy,
    this.propertyFeatureIndex,
    this.propertyFeatureCreate,
    this.propertyFeatureEdit,
    this.superuser,
    this.manageSupers,
  });

  bool? consultIndex;
  bool? consultCreate;
  bool? consultEdit;
  bool? consultsIndex;
  bool? consultsEdit;
  bool? mediaIndex;
  bool? filesIndex;
  bool? filesCreate;
  bool? propertyIndex;
  bool? propertyCreate;
  bool? propertyEdit;
  bool? propertyDestroy;
  bool? propertyFeatureIndex;
  bool? propertyFeatureCreate;
  bool? propertyFeatureEdit;
  String? superuser;
  String? manageSupers;

  factory PermissionsClass.fromJson(Map<String, dynamic> json) =>
      PermissionsClass(
        consultIndex: json["consult.index"],
        consultCreate: json["consult.create"],
        consultEdit: json["consult.edit"],
        consultsIndex: json["consults.index"],
        consultsEdit: json["consults.edit"],
        mediaIndex: json["media.index"],
        filesIndex: json["files.index"],
        filesCreate: json["files.create"],
        propertyIndex: json["property.index"],
        propertyCreate: json["property.create"],
        propertyEdit: json["property.edit"],
        propertyDestroy: json["property.destroy"],
        propertyFeatureIndex: json["property_feature.index"],
        propertyFeatureCreate: json["property_feature.create"],
        propertyFeatureEdit: json["property_feature.edit"],
        superuser: json["superuser"],
        manageSupers: json["manage_supers"],
      );

  Map<String, dynamic> toJson() => {
        "consult.index": consultIndex,
        "consult.create": consultCreate,
        "consult.edit": consultEdit,
        "consults.index": consultsIndex,
        "consults.edit": consultsEdit,
        "media.index": mediaIndex,
        "files.index": filesIndex,
        "files.create": filesCreate,
        "property.index": propertyIndex,
        "property.create": propertyCreate,
        "property.edit": propertyEdit,
        "property.destroy": propertyDestroy,
        "property_feature.index": propertyFeatureIndex,
        "property_feature.create": propertyFeatureCreate,
        "property_feature.edit": propertyFeatureEdit,
        "superuser": superuser,
        "manage_supers": manageSupers,
      };
}
