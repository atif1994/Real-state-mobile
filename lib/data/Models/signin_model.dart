// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  bool? success;
  String? message;
  String? role;
  Data? data;

  LoginModel({
    this.success,
    this.message,
    this.role,
    this.data,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    success: json["success"],
    message: json["message"],
    role: json["role"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "role": role,
    "data": data?.toJson(),
  };
}

class Data {
  int? id;
  String? firstName;
  String? lastName;
  String? username;
  dynamic description;
  dynamic gender;
  String? email;
  dynamic avatarId;
  dynamic dob;
  String? phone;
  int? credits;
  dynamic confirmedAt;
  String? emailVerifyToken;
  String? isFeatured;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic profileImage;
  String? addressId;
  dynamic roleId;
  dynamic deletedAt;
  String? activeStatus;
  String? isOnline;
  String? mobileNo;
  City? city;
  Address? address;
  Avatar? avatar;

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
    this.isOnline,
    this.mobileNo,
    this.city,
    this.address,
    this.avatar,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
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
    credits: json["credits"],
    confirmedAt: json["confirmed_at"],
    emailVerifyToken: json["email_verify_token"],
    isFeatured: json["is_featured"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    profileImage: json["profile_image"],
    addressId: json["address_id"],
    roleId: json["role_id"],
    deletedAt: json["deleted_at"],
    activeStatus: json["active_status"],
    isOnline: json["is_online"],
    mobileNo: json["mobile_no"],
    city: json["city"] == null ? null : City.fromJson(json["city"]),
    address: json["address"] == null ? null : Address.fromJson(json["address"]),
    avatar: json["avatar"] == null ? null : Avatar.fromJson(json["avatar"]),
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
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "profile_image": profileImage,
    "address_id": addressId,
    "role_id": roleId,
    "deleted_at": deletedAt,
    "active_status": activeStatus,
    "is_online": isOnline,
    "mobile_no": mobileNo,
    "city": city?.toJson(),
    "address": address?.toJson(),
    "avatar": avatar?.toJson(),
  };
}

class Address {
  int? id;
  dynamic userId;
  String? city;
  dynamic state;
  dynamic province;
  String? country;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? accountId;

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

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    id: json["id"],
    userId: json["user_id"],
    city: json["city"],
    state: json["state"],
    province: json["province"],
    country: json["country"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
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

class Avatar {
  String? url;

  Avatar({
    this.url,
  });

  factory Avatar.fromJson(Map<String, dynamic> json) => Avatar(
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "url": url,
  };
}

class City {
  int? id;
  String? name;
  String? stateId;
  String? countryId;
  dynamic recordId;
  String? order;
  String? isFeatured;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? slug;

  City({
    this.id,
    this.name,
    this.stateId,
    this.countryId,
    this.recordId,
    this.order,
    this.isFeatured,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.slug,
  });

  factory City.fromJson(Map<String, dynamic> json) => City(
    id: json["id"],
    name: json["name"],
    stateId: json["state_id"],
    countryId: json["country_id"],
    recordId: json["record_id"],
    order: json["order"],
    isFeatured: json["is_featured"],
    status: json["status"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    slug: json["slug"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "state_id": stateId,
    "country_id": countryId,
    "record_id": recordId,
    "order": order,
    "is_featured": isFeatured,
    "status": status,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "slug": slug,
  };
}
