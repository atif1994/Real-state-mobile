// To parse this JSON data, do
//
//     final getUserProfileResponse = getUserProfileResponseFromJson(jsonString);

import 'dart:convert';

GetUserProfileResponse getUserProfileResponseFromJson(String str) =>
    GetUserProfileResponse.fromJson(json.decode(str));

String getUserProfileResponseToJson(GetUserProfileResponse data) =>
    json.encode(data.toJson());

class GetUserProfileResponse {
  GetUserProfileResponse({
    this.error,
    this.data,
    this.message,
  });

  bool? error;
  Data? data;
  dynamic message;

  factory GetUserProfileResponse.fromJson(Map<String, dynamic> json) =>
      GetUserProfileResponse(
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
    this.name,
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.avatar,
    this.dob,
    this.gender,
    this.description,
    this.addressId,
    this.address,
    this.credits,
  });

  int? id;
  String? name;
  String? username;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? avatar;
  DateTime? dob;
  String? gender;
  String? description;
  String? addressId;
  Address? address;
  String? credits;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        username: json["username"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        phone: json["phone"],
        avatar: json["avatar"],
        dob: json["dob"] == null ? null : DateTime.parse(json["dob"]),
        gender: json["gender"],
        description: json["description"],
        addressId: json["address_id"],
        address:
            json["address"] == null ? null : Address.fromJson(json["address"]),
        credits: json["credits"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "username": username,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "phone": phone,
        "avatar": avatar,
        "dob": dob?.toIso8601String(),
        "gender": gender,
        "description": description,
        "address_id": addressId,
        "address": address?.toJson(),
        "credits": credits,
      };
}

class Address {
  Address({
    this.city,
    this.state,
    this.province,
    this.country,
  });

  String? city;
  String? state;
  String? province;
  String? country;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        city: json["city"],
        state: json["state"],
        province: json["province"],
        country: json["country"],
      );

  Map<String, dynamic> toJson() => {
        "city": city,
        "state": state,
        "province": province,
        "country": country,
      };
}
