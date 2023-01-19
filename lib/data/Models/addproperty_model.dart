// To parse this JSON data, do
//
//     final addPropertyModel = addPropertyModelFromJson(jsonString);

import 'dart:convert';

AddPropertyModel addPropertyModelFromJson(String str) =>
    AddPropertyModel.fromJson(json.decode(str));

String addPropertyModelToJson(AddPropertyModel data) =>
    json.encode(data.toJson());

class AddPropertyModel {
  AddPropertyModel({
    this.error,
    this.data,
    this.message,
  });

  bool? error;
  Data? data;
  String? message;

  factory AddPropertyModel.fromJson(Map<String, dynamic> json) =>
      AddPropertyModel(
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
    this.assignerId,
    this.name,
    this.description,
    this.content,
    this.sectorAndBlockName,
    this.streetNumber,
    this.plotNumber,
    this.location,
    this.cityId,
    this.stateId,
    this.price,
    this.currencyId,
    this.square,
    this.numberFloor,
    this.numberBathroom,
    this.numberBedroom,
    this.categoryId,
    this.typeId,
    this.expireDate,
    this.authorId,
    this.authorType,
    this.updatedAt,
    this.createdAt,
    this.id,
    this.assignedAgent,
    this.author,
  });

  int? assignerId;
  String? name;
  String? description;
  String? content;
  String? sectorAndBlockName;
  String? streetNumber;
  String? plotNumber;
  String? location;
  String? cityId;
  int? stateId;
  String? price;
  int? currencyId;
  String? square;
  String? numberFloor;
  int? numberBathroom;
  int? numberBedroom;
  int? categoryId;
  int? typeId;
  DateTime? expireDate;
  int? authorId;
  String? authorType;
  DateTime? updatedAt;
  DateTime? createdAt;
  int? id;
  dynamic assignedAgent;
  Author? author;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        assignerId: json["assigner_id"],
        name: json["name"],
        description: json["description"],
        content: json["content"],
        sectorAndBlockName: json["sector_and_block_name"],
        streetNumber: json["street_number"],
        plotNumber: json["plot_number"],
        location: json["location"],
        cityId: json["city_id"],
        stateId: json["state_id"],
        price: json["price"],
        currencyId: json["currency_id"],
        square: json["square"],
        numberFloor: json["number_floor"],
        numberBathroom: json["number_bathroom"],
        numberBedroom: json["number_bedroom"],
        categoryId: json["category_id"],
        typeId: json["type_id"],
        expireDate: json["expire_date"] == null
            ? null
            : DateTime.parse(json["expire_date"]),
        authorId: json["author_id"],
        authorType: json["author_type"],
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        id: json["id"],
        assignedAgent: json["assigned_agent"],
        author: json["author"] == null ? null : Author.fromJson(json["author"]),
      );

  Map<String, dynamic> toJson() => {
        "assigner_id": assignerId,
        "name": name,
        "description": description,
        "content": content,
        "sector_and_block_name": sectorAndBlockName,
        "street_number": streetNumber,
        "plot_number": plotNumber,
        "location": location,
        "city_id": cityId,
        "state_id": stateId,
        "price": price,
        "currency_id": currencyId,
        "square": square,
        "number_floor": numberFloor,
        "number_bathroom": numberBathroom,
        "number_bedroom": numberBedroom,
        "category_id": categoryId,
        "type_id": typeId,
        "expire_date": expireDate?.toIso8601String(),
        "author_id": authorId,
        "author_type": authorType,
        "updated_at": updatedAt?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "id": id,
        "assigned_agent": assignedAgent,
        "author": author?.toJson(),
      };
}

class Author {
  Author({
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

  factory Author.fromJson(Map<String, dynamic> json) => Author(
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
      };
}
