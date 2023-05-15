// To parse this JSON data, do
//
//     final aboutagent = aboutagentFromJson(jsonString);

import 'dart:convert';

Aboutagent aboutagentFromJson(String str) =>
    Aboutagent.fromJson(json.decode(str));

String aboutagentToJson(Aboutagent data) => json.encode(data.toJson());

class Aboutagent {
  bool? success;
  String? message;
  Data? data;

  Aboutagent({
    this.success,
    this.message,
    this.data,
  });

  factory Aboutagent.fromJson(Map<String, dynamic> json) => Aboutagent(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data?.toJson(),
      };
}

class Data {
  int? id;
  String? email;
  dynamic emailVerifiedAt;
  String? mobileNo;
  dynamic profileImage;
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
  String? permissions;
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
  Company? company;
  Role? role;

  Data({
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
    this.company,
    this.role,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
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
        company:
            json["company"] == null ? null : Company.fromJson(json["company"]),
        role: json["role"] == null ? null : Role.fromJson(json["role"]),
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
        "company": company?.toJson(),
        "role": role?.toJson(),
      };
}

class Company {
  int? id;
  String? ownerName;
  String? companyName;
  String? companyLogo;
  String? officeAddress;
  String? createdAt;
  String? updatedAt;
  String? companyOwnerId;
  String? deletedAt;

  Company({
    this.id,
    this.ownerName,
    this.companyName,
    this.companyLogo,
    this.officeAddress,
    this.createdAt,
    this.updatedAt,
    this.companyOwnerId,
    this.deletedAt,
  });

  factory Company.fromJson(Map<String, dynamic> json) => Company(
        id: json["id"],
        ownerName: json["owner_name"],
        companyName: json["company_name"],
        companyLogo: json["company_logo"],
        officeAddress: json["office_address"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        companyOwnerId: json["company_owner_id"],
        deletedAt: json["deleted_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "owner_name": ownerName,
        "company_name": companyName,
        "company_logo": companyLogo,
        "office_address": officeAddress,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "company_owner_id": companyOwnerId,
        "deleted_at": deletedAt,
      };
}

class Role {
  int? id;
  String? slug;
  String? name;
  Permissions? permissions;
  String? description;
  String? isDefault;
  String? createdBy;
  String? updatedBy;
  String? createdAt;
  String? updatedAt;

  Role({
    this.id,
    this.slug,
    this.name,
    this.permissions,
    this.description,
    this.isDefault,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
  });

  factory Role.fromJson(Map<String, dynamic> json) => Role(
        id: json["id"],
        slug: json["slug"],
        name: json["name"],
        permissions: json["permissions"] == null
            ? null
            : Permissions.fromJson(json["permissions"]),
        description: json["description"],
        isDefault: json["is_default"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "slug": slug,
        "name": name,
        "permissions": permissions?.toJson(),
        "description": description,
        "is_default": isDefault,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}

class Permissions {
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

  Permissions({
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
  });

  factory Permissions.fromJson(Map<String, dynamic> json) => Permissions(
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
      };
}
