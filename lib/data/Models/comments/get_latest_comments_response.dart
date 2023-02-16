// To parse this JSON data, do
//
//     final getCommentsModel = getCommentsModelFromJson(jsonString);

import 'dart:convert';

GetCommentsModel getCommentsModelFromJson(String str) =>
    GetCommentsModel.fromJson(json.decode(str));

String getCommentsModelToJson(GetCommentsModel data) =>
    json.encode(data.toJson());

class GetCommentsModel {
  GetCommentsModel({
    this.error,
    this.data,
    this.message,
  });

  bool? error;
  List<Datum>? data;
  String? message;

  factory GetCommentsModel.fromJson(Map<String, dynamic> json) =>
      GetCommentsModel(
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
    this.propertyId,
    this.userId,
    this.comment,
    this.createdAt,
    this.updatedAt,
    this.user,
  });

  int? id;
  String? propertyId;
  String? userId;
  String? comment;
  String? createdAt;
  String? updatedAt;
  User? user;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        propertyId: json["property_id"],
        userId: json["user_id"],
        comment: json["comment"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "property_id": propertyId,
        "user_id": userId,
        "comment": comment,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "user": user?.toJson(),
      };
}

class User {
  User({
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
  String? dob;
  String? phone;
  String? credits;
  String? confirmedAt;
  dynamic emailVerifyToken;
  String? isFeatured;
  String? createdAt;
  String? updatedAt;
  dynamic profileImage;
  String? addressId;
  String? roleId;
  dynamic deletedAt;
  String? activeStatus;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        username: json["username"],
        description: json["description"],
        gender: json["gender"],
        email: json["email"],
        avatarId: json["avatar_id"],
        dob: json["dob"],
        phone: json["phone"],
        //  credits: json["credits"],
        confirmedAt: json["confirmed_at"],
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
        "dob": dob,
        "phone": phone,
        "credits": credits,
        "confirmed_at": confirmedAt,
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
