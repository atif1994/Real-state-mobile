// To parse this JSON data, do
//
//     final updateprofile = updateprofileFromJson(jsonString);

import 'dart:convert';

Updateprofile updateprofileFromJson(String str) =>
    Updateprofile.fromJson(json.decode(str));

String updateprofileToJson(Updateprofile data) => json.encode(data.toJson());

class Updateprofile {
  Updateprofile({
    this.error,
    this.data,
    this.message,
  });

  bool? error;
  Data? data;
  String? message;

  factory Updateprofile.fromJson(Map<String, dynamic> json) => Updateprofile(
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
    this.address,
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
  Address? address;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
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
        address:
            json["address"] == null ? null : Address.fromJson(json["address"]),
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
        "address": address?.toJson(),
      };
}

class Address {
  Address({
    this.id,
    this.userId,
    this.city,
    this.state,
    this.province,
    this.country,
    this.createdAt,
    this.updatedAt,
    this.accountId,
  });

  int? id;
  String? userId;
  String? city;
  String? state;
  String? province;
  String? country;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic accountId;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        id: json["id"],
        userId: json["user_id"],
        city: json["city"],
        state: json["state"],
        province: json["province"],
        country: json["country"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        accountId: json["account_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "city": city,
        "state": state,
        "province": province,
        "country": country,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "account_id": accountId,
      };
}
