// To parse this JSON data, do
//
//     final agentSharedInventoryResponse = agentSharedInventoryResponseFromJson(jsonString);

import 'dart:convert';

AgentSharedInventoryResponse agentSharedInventoryResponseFromJson(String str) => AgentSharedInventoryResponse.fromJson(json.decode(str));

String agentSharedInventoryResponseToJson(AgentSharedInventoryResponse data) => json.encode(data.toJson());

class AgentSharedInventoryResponse {
  bool? error;
  List<Datum>? data;
  String? message;

  AgentSharedInventoryResponse({
    this.error,
    this.data,
    this.message,
  });

  factory AgentSharedInventoryResponse.fromJson(Map<String, dynamic> json) => AgentSharedInventoryResponse(
    error: json["error"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "message": message,
  };
}

class Datum {
  String? propertyId;
  int? id;
  String? name;
  String? description;
  String? content;
  String? location;
  dynamic images;
  String? numberBedroom;
  String? numberBathroom;
  String? numberFloor;
  String? square;
  String? price;
  String? currencyId;
  String? cityId;
  String? stateId;
  dynamic countryId;
  Period? period;
  String? authorId;
  AuthorType? authorType;
  String? categoryId;
  String? isFeatured;
  ModerationStatus? moderationStatus;
  DateTime? expireDate;
  String? autoRenew;
  String? neverExpired;
  String? latitude;
  String? longitude;
  String? typeId;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic subcategoryId;
  String? plotNumber;
  String? streetNumber;
  String? sectorAndBlockName;
  String? assignedAgent;
  String? assignerId;
  String? isDeleted;
  String? isLiked;
  String? firstName;
  String? lastName;
  String? customerId;
  Name? typeName;
  Type? type;

  Datum({
    this.propertyId,
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
    this.firstName,
    this.lastName,
    this.customerId,
    this.typeName,
    this.type,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    propertyId: json["property_id"],
    id: json["id"],
    name: json["name"],
    description: json["description"],
    content: json["content"],
    location: json["location"],
    images: json["images"],
    numberBedroom: json["number_bedroom"],
    numberBathroom: json["number_bathroom"],
    numberFloor: json["number_floor"],
    square: json["square"],
    price: json["price"],
    currencyId: json["currency_id"],
    cityId: json["city_id"],
    stateId: json["state_id"],
    countryId: json["country_id"],
    period: periodValues.map[json["period"]]!,
    authorId: json["author_id"],
    authorType: authorTypeValues.map[json["author_type"]]!,
    categoryId: json["category_id"],
    isFeatured: json["is_featured"],
    moderationStatus: moderationStatusValues.map[json["moderation_status"]]!,
    expireDate: json["expire_date"] == null ? null : DateTime.parse(json["expire_date"]),
    autoRenew: json["auto_renew"],
    neverExpired: json["never_expired"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    typeId: json["type_id"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    subcategoryId: json["subcategory_id"],
    plotNumber: json["plot_number"],
    streetNumber: json["street_number"],
    sectorAndBlockName: json["sector_and_block_name"],
    assignedAgent: json["assigned_agent"],
    assignerId: json["assigner_id"],
    isDeleted: json["is_deleted"],
    isLiked: json["is_liked"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    customerId: json["customer_id"],
    typeName: nameValues.map[json["type_name"]]!,
    type: json["type"] == null ? null : Type.fromJson(json["type"]),
  );

  Map<String, dynamic> toJson() => {
    "property_id": propertyId,
    "id": id,
    "name": name,
    "description": description,
    "content": content,
    "location": location,
    "images": images,
    "number_bedroom": numberBedroom,
    "number_bathroom": numberBathroom,
    "number_floor": numberFloor,
    "square": square,
    "price": price,
    "currency_id": currencyId,
    "city_id": cityId,
    "state_id": stateId,
    "country_id": countryId,
    "period": periodValues.reverse[period],
    "author_id": authorId,
    "author_type": authorTypeValues.reverse[authorType],
    "category_id": categoryId,
    "is_featured": isFeatured,
    "moderation_status": moderationStatusValues.reverse[moderationStatus],
    "expire_date": expireDate?.toIso8601String(),
    "auto_renew": autoRenew,
    "never_expired": neverExpired,
    "latitude": latitude,
    "longitude": longitude,
    "type_id": typeId,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "subcategory_id": subcategoryId,
    "plot_number": plotNumber,
    "street_number": streetNumber,
    "sector_and_block_name": sectorAndBlockName,
    "assigned_agent": assignedAgent,
    "assigner_id": assignerId,
    "is_deleted": isDeleted,
    "is_liked": isLiked,
    "first_name": firstName,
    "last_name": lastName,
    "customer_id": customerId,
    "type_name": nameValues.reverse[typeName],
    "type": type?.toJson(),
  };
}

enum AuthorType {
  BOTBLE_ACL_MODELS_USER,
  BOTBLE_REAL_ESTATE_MODELS_ACCOUNT
}

final authorTypeValues = EnumValues({
  "Botble\\ACL\\Models\\User": AuthorType.BOTBLE_ACL_MODELS_USER,
  "Botble\\RealEstate\\Models\\Account": AuthorType.BOTBLE_REAL_ESTATE_MODELS_ACCOUNT
});

enum ModerationStatus {
  APPROVED,
  PENDING,
  REJECTED
}

final moderationStatusValues = EnumValues({
  "approved": ModerationStatus.APPROVED,
  "pending": ModerationStatus.PENDING,
  "rejected": ModerationStatus.REJECTED
});

enum Period {
  DAY,
  MONTH
}

final periodValues = EnumValues({
  "day": Period.DAY,
  "month": Period.MONTH
});

class Type {
  int? id;
  Name? name;
  Slug? slug;
  String? order;
  Code? code;

  Type({
    this.id,
    this.name,
    this.slug,
    this.order,
    this.code,
  });

  factory Type.fromJson(Map<String, dynamic> json) => Type(
    id: json["id"],
    name: nameValues.map[json["name"]]!,
    slug: slugValues.map[json["slug"]]!,
    order: json["order"],
    code: codeValues.map[json["code"]]!,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": nameValues.reverse[name],
    "slug": slugValues.reverse[slug],
    "order": order,
    "code": codeValues.reverse[code],
  };
}

enum Code {
  RENT,
  SALE
}

final codeValues = EnumValues({
  "rent": Code.RENT,
  "sale": Code.SALE
});

enum Name {
  FOR_RENT,
  FOR_SALE
}

final nameValues = EnumValues({
  "For Rent": Name.FOR_RENT,
  "For Sale": Name.FOR_SALE
});

enum Slug {
  FOR_RENT,
  FOR_SALE
}

final slugValues = EnumValues({
  "for-rent": Slug.FOR_RENT,
  "for-sale": Slug.FOR_SALE
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
