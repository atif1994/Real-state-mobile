// To parse this JSON data, do
//
//     final likeModel = likeModelFromJson(jsonString);

import 'dart:convert';

LikeModel likeModelFromJson(String str) => LikeModel.fromJson(json.decode(str));

String likeModelToJson(LikeModel data) => json.encode(data.toJson());

class LikeModel {
  LikeModel({
    this.success,
    this.message,
    this.isliked,
    this.likelist,
    this.likeOcunt,
    this.notdeleted,
    this.property,
  });

  bool? success;
  String? message;
  int? isliked;
  List<Likelist>? likelist;
  int? likeOcunt;
  bool? notdeleted;
  List<Property>? property;

  factory LikeModel.fromJson(Map<String, dynamic> json) => LikeModel(
        success: json["success"],
        message: json["message"],
        isliked: json["isliked"],
        likelist: json["likelist"] == null
            ? []
            : List<Likelist>.from(
                json["likelist"]!.map((x) => Likelist.fromJson(x))),
        likeOcunt: json["like_ocunt"],
        notdeleted: json["notdeleted"],
        property: json["property"] == null
            ? []
            : List<Property>.from(
                json["property"]!.map((x) => Property.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "isliked": isliked,
        "likelist": likelist == null
            ? []
            : List<dynamic>.from(likelist!.map((x) => x.toJson())),
        "like_ocunt": likeOcunt,
        "notdeleted": notdeleted,
        "property": property == null
            ? []
            : List<dynamic>.from(property!.map((x) => x.toJson())),
      };
}

class Likelist {
  Likelist({
    this.propertyId,
  });

  String? propertyId;

  factory Likelist.fromJson(Map<String, dynamic> json) => Likelist(
        propertyId: json["property_id"],
      );

  Map<String, dynamic> toJson() => {
        "property_id": propertyId,
      };
}

class Property {
  Property({
    this.id,
    this.name,
    this.description,
    this.content,
    this.location,
    this.images,
    this.numberBedroom,
    this.numberBathroom,
    this.numberFloor,
    this.square,
    this.price,
    this.currencyId,
    this.cityId,
    this.stateId,
    this.countryId,
    this.period,
    this.authorId,
    this.authorType,
    this.categoryId,
    this.isFeatured,
    this.moderationStatus,
    this.expireDate,
    this.autoRenew,
    this.neverExpired,
    this.latitude,
    this.longitude,
    this.typeId,
    this.createdAt,
    this.updatedAt,
    this.subcategoryId,
    this.plotNumber,
    this.streetNumber,
    this.sectorAndBlockName,
    this.assignedAgent,
    this.assignerId,
    this.isDeleted,
    this.isLiked,
    this.likesOnProperties,
  });

  int? id;
  String? name;
  String? description;
  String? content;
  String? location;
  Images? images;
  String? numberBedroom;
  String? numberBathroom;
  String? numberFloor;
  String? square;
  String? price;
  String? currencyId;
  String? cityId;
  String? stateId;
  dynamic countryId;
  String? period;
  String? authorId;
  String? authorType;
  String? categoryId;
  String? isFeatured;
  String? moderationStatus;
  String? expireDate;
  String? autoRenew;
  dynamic neverExpired;
  dynamic latitude;
  dynamic longitude;
  String? typeId;
  String? createdAt;
  String? updatedAt;
  dynamic subcategoryId;
  String? plotNumber;
  String? streetNumber;
  String? sectorAndBlockName;
  String? assignedAgent;
  String? assignerId;
  String? isDeleted;
  String? isLiked;
  List<LikesOnProperty>? likesOnProperties;

  factory Property.fromJson(Map<String, dynamic> json) => Property(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        content: json["content"],
        location: json["location"],
        images: json["images"] == null ? null : Images.fromJson(json["images"]),
        numberBedroom: json["number_bedroom"],
        numberBathroom: json["number_bathroom"],
        numberFloor: json["number_floor"],
        square: json["square"],
        price: json["price"],
        currencyId: json["currency_id"],
        cityId: json["city_id"],
        stateId: json["state_id"],
        countryId: json["country_id"],
        period: json["period"],
        authorId: json["author_id"],
        authorType: json["author_type"],
        categoryId: json["category_id"],
        isFeatured: json["is_featured"],
        moderationStatus: json["moderation_status"],
        expireDate: json["expire_date"],
        autoRenew: json["auto_renew"],
        neverExpired: json["never_expired"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        typeId: json["type_id"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        subcategoryId: json["subcategory_id"],
        plotNumber: json["plot_number"],
        streetNumber: json["street_number"],
        sectorAndBlockName: json["sector_and_block_name"],
        assignedAgent: json["assigned_agent"],
        assignerId: json["assigner_id"],
        isDeleted: json["is_deleted"],
        isLiked: json["is_liked"],
        likesOnProperties: json["likes_on_properties"] == null
            ? []
            : List<LikesOnProperty>.from(json["likes_on_properties"]!
                .map((x) => LikesOnProperty.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "content": content,
        "location": location,
        "images": images?.toJson(),
        "number_bedroom": numberBedroom,
        "number_bathroom": numberBathroom,
        "number_floor": numberFloor,
        "square": square,
        "price": price,
        "currency_id": currencyId,
        "city_id": cityId,
        "state_id": stateId,
        "country_id": countryId,
        "period": period,
        "author_id": authorId,
        "author_type": authorType,
        "category_id": categoryId,
        "is_featured": isFeatured,
        "moderation_status": moderationStatus,
        "expire_date": expireDate,
        "auto_renew": autoRenew,
        "never_expired": neverExpired,
        "latitude": latitude,
        "longitude": longitude,
        "type_id": typeId,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "subcategory_id": subcategoryId,
        "plot_number": plotNumber,
        "street_number": streetNumber,
        "sector_and_block_name": sectorAndBlockName,
        "assigned_agent": assignedAgent,
        "assigner_id": assignerId,
        "is_deleted": isDeleted,
        "is_liked": isLiked,
        "likes_on_properties": likesOnProperties == null
            ? []
            : List<dynamic>.from(likesOnProperties!.map((x) => x.toJson())),
      };
}

class Images {
  Images({
    this.the1,
    this.the2,
  });

  String? the1;
  String? the2;

  factory Images.fromJson(Map<String, dynamic> json) => Images(
        the1: json["1"],
        the2: json["2"],
      );

  Map<String, dynamic> toJson() => {
        "1": the1,
        "2": the2,
      };
}

class LikesOnProperty {
  LikesOnProperty({
    this.isliked,
  });

  bool? isliked;

  factory LikesOnProperty.fromJson(Map<String, dynamic> json) =>
      LikesOnProperty(
        isliked: json["isliked"],
      );

  Map<String, dynamic> toJson() => {
        "isliked": isliked,
      };
}
