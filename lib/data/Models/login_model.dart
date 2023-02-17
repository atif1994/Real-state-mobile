// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);
<<<<<<< HEAD
=======

>>>>>>> db9c9bf85ad7a7f81d9bde185344f65e23224438
import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));
<<<<<<< HEAD
=======

>>>>>>> db9c9bf85ad7a7f81d9bde185344f65e23224438
String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    this.success,
    this.message,
    this.data,
  });
<<<<<<< HEAD
  bool? success;
  String? message;
  Data? data;
=======

  bool? success;
  String? message;
  Data? data;

>>>>>>> db9c9bf85ad7a7f81d9bde185344f65e23224438
  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );
<<<<<<< HEAD
=======

>>>>>>> db9c9bf85ad7a7f81d9bde185344f65e23224438
  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data?.toJson(),
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
    this.city,
    this.address,
    this.avatar,
  });
<<<<<<< HEAD
=======

>>>>>>> db9c9bf85ad7a7f81d9bde185344f65e23224438
  int? id;
  String? firstName;
  String? lastName;
  String? username;
<<<<<<< HEAD
  String? description;
  String? gender;
  String? email;
  dynamic avatarId;
  DateTime? dob;
  String? phone;
  int? credits;
  DateTime? confirmedAt;
  dynamic emailVerifyToken;
  String? isFeatured;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic profileImage;
  String? addressId;
  dynamic roleId;
=======
  dynamic description;
  dynamic gender;
  String? email;
  String? avatarId;
  dynamic dob;
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
>>>>>>> db9c9bf85ad7a7f81d9bde185344f65e23224438
  dynamic deletedAt;
  String? activeStatus;
  City? city;
  Address? address;
<<<<<<< HEAD
  List<dynamic>? avatar;
=======
  Avatar? avatar;

>>>>>>> db9c9bf85ad7a7f81d9bde185344f65e23224438
  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        username: json["username"],
        description: json["description"],
        gender: json["gender"],
        email: json["email"],
        avatarId: json["avatar_id"],
<<<<<<< HEAD
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
=======
        dob: json["dob"],
        phone: json["phone"],
        credits: json["credits"],
        confirmedAt: json["confirmed_at"],
        emailVerifyToken: json["email_verify_token"],
        isFeatured: json["is_featured"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
>>>>>>> db9c9bf85ad7a7f81d9bde185344f65e23224438
        profileImage: json["profile_image"],
        addressId: json["address_id"],
        roleId: json["role_id"],
        deletedAt: json["deleted_at"],
        activeStatus: json["active_status"],
        city: json["city"] == null ? null : City.fromJson(json["city"]),
        address:
            json["address"] == null ? null : Address.fromJson(json["address"]),
<<<<<<< HEAD
        avatar: json["avatar"] == null
            ? []
            : List<dynamic>.from(json["avatar"]!.map((x) => x)),
      );
=======
        avatar: json["avatar"] == null ? null : Avatar.fromJson(json["avatar"]),
      );

>>>>>>> db9c9bf85ad7a7f81d9bde185344f65e23224438
  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "username": username,
        "description": description,
        "gender": gender,
        "email": email,
        "avatar_id": avatarId,
<<<<<<< HEAD
        "dob": dob?.toIso8601String(),
        "phone": phone,
        "credits": credits,
        "confirmed_at": confirmedAt?.toIso8601String(),
        "email_verify_token": emailVerifyToken,
        "is_featured": isFeatured,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
=======
        "dob": dob,
        "phone": phone,
        "credits": credits,
        "confirmed_at": confirmedAt,
        "email_verify_token": emailVerifyToken,
        "is_featured": isFeatured,
        "created_at": createdAt,
        "updated_at": updatedAt,
>>>>>>> db9c9bf85ad7a7f81d9bde185344f65e23224438
        "profile_image": profileImage,
        "address_id": addressId,
        "role_id": roleId,
        "deleted_at": deletedAt,
        "active_status": activeStatus,
        "city": city?.toJson(),
        "address": address?.toJson(),
<<<<<<< HEAD
        "avatar":
            avatar == null ? [] : List<dynamic>.from(avatar!.map((x) => x)),
=======
        "avatar": avatar?.toJson(),
>>>>>>> db9c9bf85ad7a7f81d9bde185344f65e23224438
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
<<<<<<< HEAD
  int? id;
  String? userId;
=======

  int? id;
  dynamic userId;
>>>>>>> db9c9bf85ad7a7f81d9bde185344f65e23224438
  String? city;
  String? state;
  String? province;
  String? country;
<<<<<<< HEAD
  DateTime? createdAt;
  DateTime? updatedAt;
  String? accountId;
=======
  String? createdAt;
  String? updatedAt;
  String? accountId;

>>>>>>> db9c9bf85ad7a7f81d9bde185344f65e23224438
  factory Address.fromJson(Map<String, dynamic> json) => Address(
        id: json["id"],
        userId: json["user_id"],
        city: json["city"],
        state: json["state"],
        province: json["province"],
        country: json["country"],
<<<<<<< HEAD
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        accountId: json["account_id"],
      );
=======
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        accountId: json["account_id"],
      );

>>>>>>> db9c9bf85ad7a7f81d9bde185344f65e23224438
  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "city": city,
        "state": state,
        "province": province,
        "country": country,
<<<<<<< HEAD
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
=======
        "created_at": createdAt,
        "updated_at": updatedAt,
>>>>>>> db9c9bf85ad7a7f81d9bde185344f65e23224438
        "account_id": accountId,
      };
}

<<<<<<< HEAD
=======
class Avatar {
  Avatar({
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
  dynamic options;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;

  factory Avatar.fromJson(Map<String, dynamic> json) => Avatar(
        id: json["id"],
        userId: json["user_id"],
        name: json["name"],
        folderId: json["folder_id"],
        mimeType: json["mime_type"],
        size: json["size"],
        url: json["url"],
        options: json["options"],
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
        "options": options,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "deleted_at": deletedAt,
      };
}

>>>>>>> db9c9bf85ad7a7f81d9bde185344f65e23224438
class City {
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
<<<<<<< HEAD
=======

>>>>>>> db9c9bf85ad7a7f81d9bde185344f65e23224438
  int? id;
  String? name;
  String? stateId;
  String? countryId;
  dynamic recordId;
  String? order;
  String? isFeatured;
  String? status;
<<<<<<< HEAD
  DateTime? createdAt;
  DateTime? updatedAt;
  String? slug;
=======
  String? createdAt;
  String? updatedAt;
  String? slug;

>>>>>>> db9c9bf85ad7a7f81d9bde185344f65e23224438
  factory City.fromJson(Map<String, dynamic> json) => City(
        id: json["id"],
        name: json["name"],
        stateId: json["state_id"],
        countryId: json["country_id"],
        recordId: json["record_id"],
        order: json["order"],
        isFeatured: json["is_featured"],
        status: json["status"],
<<<<<<< HEAD
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        slug: json["slug"],
      );
=======
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        slug: json["slug"],
      );

>>>>>>> db9c9bf85ad7a7f81d9bde185344f65e23224438
  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "state_id": stateId,
        "country_id": countryId,
        "record_id": recordId,
        "order": order,
        "is_featured": isFeatured,
        "status": status,
<<<<<<< HEAD
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
=======
        "created_at": createdAt,
        "updated_at": updatedAt,
>>>>>>> db9c9bf85ad7a7f81d9bde185344f65e23224438
        "slug": slug,
      };
}
