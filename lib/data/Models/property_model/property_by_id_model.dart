// To parse this JSON data, do
//
//     final propertyById = propertyByIdFromJson(jsonString);

import 'dart:convert';

PropertyById propertyByIdFromJson(String str) => PropertyById.fromJson(json.decode(str));

String propertyByIdToJson(PropertyById data) => json.encode(data.toJson());

class PropertyById {
  bool? error;
  Data? data;
  dynamic message;

  PropertyById({
    this.error,
    this.data,
    this.message,
  });

  factory PropertyById.fromJson(Map<String, dynamic> json) => PropertyById(
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
  int? id;
  String? name;
  String? description;
  String? content;
  String? location;
  List<String>? images;
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
  DateTime? expireDate;
  String? autoRenew;
  dynamic neverExpired;
  dynamic latitude;
  dynamic longitude;
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
  City? city;
  List<dynamic>? country;
  State? state;
  Category? category;
  Type? type;
  Currency? currency;
  List<Feature>? features;
  List<dynamic>? facilities;

  Data({
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
    this.city,
    this.country,
    this.state,
    this.category,
    this.type,
    this.currency,
    this.features,
    this.facilities,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    content: json["content"],
    location: json["location"],
    images: json["images"] == null ? [] : List<String>.from(json["images"]!.map((x) => x)),
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
    city: json["city"] == null ? null : City.fromJson(json["city"]),
    country: json["country"] == null ? [] : List<dynamic>.from(json["country"]!.map((x) => x)),
    state: json["state"] == null ? null : State.fromJson(json["state"]),
    category: json["category"] == null ? null : Category.fromJson(json["category"]),
    type: json["type"] == null ? null : Type.fromJson(json["type"]),
    currency: json["currency"] == null ? null : Currency.fromJson(json["currency"]),
    features: json["features"] == null ? [] : List<Feature>.from(json["features"]!.map((x) => Feature.fromJson(x))),
    facilities: json["facilities"] == null ? [] : List<dynamic>.from(json["facilities"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "content": content,
    "location": location,
    "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
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
    "city": city?.toJson(),
    "country": country == null ? [] : List<dynamic>.from(country!.map((x) => x)),
    "state": state?.toJson(),
    "category": category?.toJson(),
    "type": type?.toJson(),
    "currency": currency?.toJson(),
    "features": features == null ? [] : List<dynamic>.from(features!.map((x) => x.toJson())),
    "facilities": facilities == null ? [] : List<dynamic>.from(facilities!.map((x) => x)),
  };
}

class Category {
  int? id;
  String? name;
  dynamic description;
  String? status;
  String? order;
  String? isDefault;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? parentId;
  String? parentclass;

  Category({
    this.id,
    this.name,
    this.description,
    this.status,
    this.order,
    this.isDefault,
    this.createdAt,
    this.updatedAt,
    this.parentId,
    this.parentclass,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    status: json["status"],
    order: json["order"],
    isDefault: json["is_default"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    parentId: json["parent_id"],
    parentclass: json["parentclass"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "status": status,
    "order": order,
    "is_default": isDefault,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "parent_id": parentId,
    "parentclass": parentclass,
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

class Currency {
  int? id;
  String? title;
  String? symbol;
  String? isPrefixSymbol;
  String? decimals;
  String? order;
  String? isDefault;
  String? exchangeRate;
  DateTime? createdAt;
  DateTime? updatedAt;

  Currency({
    this.id,
    this.title,
    this.symbol,
    this.isPrefixSymbol,
    this.decimals,
    this.order,
    this.isDefault,
    this.exchangeRate,
    this.createdAt,
    this.updatedAt,
  });

  factory Currency.fromJson(Map<String, dynamic> json) => Currency(
    id: json["id"],
    title: json["title"],
    symbol: json["symbol"],
    isPrefixSymbol: json["is_prefix_symbol"],
    decimals: json["decimals"],
    order: json["order"],
    isDefault: json["is_default"],
    exchangeRate: json["exchange_rate"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "symbol": symbol,
    "is_prefix_symbol": isPrefixSymbol,
    "decimals": decimals,
    "order": order,
    "is_default": isDefault,
    "exchange_rate": exchangeRate,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}

class Feature {
  int? id;
  String? name;
  dynamic icon;
  String? status;
  Pivot? pivot;

  Feature({
    this.id,
    this.name,
    this.icon,
    this.status,
    this.pivot,
  });

  factory Feature.fromJson(Map<String, dynamic> json) => Feature(
    id: json["id"],
    name: json["name"],
    icon: json["icon"],
    status: json["status"],
    pivot: json["pivot"] == null ? null : Pivot.fromJson(json["pivot"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "icon": icon,
    "status": status,
    "pivot": pivot?.toJson(),
  };
}

class Pivot {
  String? propertyId;
  String? featureId;

  Pivot({
    this.propertyId,
    this.featureId,
  });

  factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
    propertyId: json["property_id"],
    featureId: json["feature_id"],
  );

  Map<String, dynamic> toJson() => {
    "property_id": propertyId,
    "feature_id": featureId,
  };
}

class State {
  int? id;
  String? name;
  String? abbreviation;
  String? countryId;
  String? order;
  String? isFeatured;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  State({
    this.id,
    this.name,
    this.abbreviation,
    this.countryId,
    this.order,
    this.isFeatured,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory State.fromJson(Map<String, dynamic> json) => State(
    id: json["id"],
    name: json["name"],
    abbreviation: json["abbreviation"],
    countryId: json["country_id"],
    order: json["order"],
    isFeatured: json["is_featured"],
    status: json["status"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "abbreviation": abbreviation,
    "country_id": countryId,
    "order": order,
    "is_featured": isFeatured,
    "status": status,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}

class Type {
  int? id;
  String? name;
  String? slug;
  String? order;
  String? code;

  Type({
    this.id,
    this.name,
    this.slug,
    this.order,
    this.code,
  });

  factory Type.fromJson(Map<String, dynamic> json) => Type(
    id: json["id"],
    name: json["name"],
    slug: json["slug"],
    order: json["order"],
    code: json["code"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "slug": slug,
    "order": order,
    "code": code,
  };
}
