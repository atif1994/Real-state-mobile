// To parse this JSON data, do
//
//     final newsfeedModel = newsfeedModelFromJson(jsonString);

import 'dart:convert';

NewsfeedModel newsfeedModelFromJson(String str) =>
    NewsfeedModel.fromJson(json.decode(str));

String newsfeedModelToJson(NewsfeedModel data) => json.encode(data.toJson());

class NewsfeedModel {
  NewsfeedModel({
    this.error,
    this.data,
    this.message,
  });

  bool? error;
  List<Datum>? data;
  dynamic message;

  factory NewsfeedModel.fromJson(Map<String, dynamic> json) => NewsfeedModel(
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
    this.isWishlist,
    this.likesOnProperties,
    this.slugable,
    this.city,
    this.country,
    this.state,
    this.category,
    this.type,
    this.currency,
    this.features,
    this.facilities,
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
  dynamic stateId;
  dynamic countryId;
  String? period;
  String? authorId;
  String? authorType;
  String? categoryId;
  String? isFeatured;
  String? moderationStatus;
  String? expireDate;
  String? autoRenew;
  String? neverExpired;
  String? latitude;
  String? longitude;
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
  int? isLiked;
  int? isWishlist;
  List<LikesOnProperty>? likesOnProperties;
  Slugable? slugable;
  City? city;
  List<dynamic>? country;
  List<dynamic>? state;
  Category? category;
  Type? type;
  Currency? currency;
  List<Feature>? features;
  List<dynamic>? facilities;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
        isWishlist: json["is_wishlist"],
        likesOnProperties: json["likes_on_properties"] == null
            ? []
            : List<LikesOnProperty>.from(json["likes_on_properties"]!
                .map((x) => LikesOnProperty.fromJson(x))),
        slugable: json["slugable"] == null
            ? null
            : Slugable.fromJson(json["slugable"]),
        city: json["city"] == null ? null : City.fromJson(json["city"]),
        country: json["country"] == null
            ? []
            : List<dynamic>.from(json["country"]!.map((x) => x)),
        state: json["state"] == null
            ? []
            : List<dynamic>.from(json["state"]!.map((x) => x)),
        category: json["category"] == null
            ? null
            : Category.fromJson(json["category"]),
        type: json["type"] == null ? null : Type.fromJson(json["type"]),
        currency: json["currency"] == null
            ? null
            : Currency.fromJson(json["currency"]),
        features: json["features"] == null
            ? []
            : List<Feature>.from(
                json["features"]!.map((x) => Feature.fromJson(x))),
        facilities: json["facilities"] == null
            ? []
            : List<dynamic>.from(json["facilities"]!.map((x) => x)),
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
        "is_wishlist": isWishlist,
        "likes_on_properties": likesOnProperties == null
            ? []
            : List<dynamic>.from(likesOnProperties!.map((x) => x.toJson())),
        "slugable": slugable?.toJson(),
        "city": city?.toJson(),
        "country":
            country == null ? [] : List<dynamic>.from(country!.map((x) => x)),
        "state": state == null ? [] : List<dynamic>.from(state!.map((x) => x)),
        "category": category?.toJson(),
        "type": type?.toJson(),
        "currency": currency?.toJson(),
        "features": features == null
            ? []
            : List<dynamic>.from(features!.map((x) => x.toJson())),
        "facilities": facilities == null
            ? []
            : List<dynamic>.from(facilities!.map((x) => x)),
      };
}

class Category {
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

  int? id;
  String? name;
  String? description;
  String? status;
  String? order;
  String? isDefault;
  String? createdAt;
  String? updatedAt;
  String? parentId;
  String? parentclass;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        status: json["status"],
        order: json["order"],
        isDefault: json["is_default"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
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
        "created_at": createdAt,
        "updated_at": updatedAt,
        "parent_id": parentId,
        "parentclass": parentclass,
      };
}

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

  int? id;
  String? name;
  String? stateId;
  String? countryId;
  dynamic recordId;
  String? order;
  String? isFeatured;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? slug;

  factory City.fromJson(Map<String, dynamic> json) => City(
        id: json["id"],
        name: json["name"],
        stateId: json["state_id"],
        countryId: json["country_id"],
        recordId: json["record_id"],
        order: json["order"],
        isFeatured: json["is_featured"],
        status: json["status"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
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
        "created_at": createdAt,
        "updated_at": updatedAt,
        "slug": slug,
      };
}

class Currency {
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

  int? id;
  String? title;
  String? symbol;
  String? isPrefixSymbol;
  String? decimals;
  String? order;
  String? isDefault;
  String? exchangeRate;
  String? createdAt;
  String? updatedAt;

  factory Currency.fromJson(Map<String, dynamic> json) => Currency(
        id: json["id"],
        title: json["title"],
        symbol: json["symbol"],
        isPrefixSymbol: json["is_prefix_symbol"],
        decimals: json["decimals"],
        order: json["order"],
        isDefault: json["is_default"],
        exchangeRate: json["exchange_rate"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
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
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}

class Feature {
  Feature({
    this.id,
    this.name,
    this.icon,
    this.status,
    this.pivot,
  });

  int? id;
  String? name;
  String? icon;
  String? status;
  Pivot? pivot;

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
  Pivot({
    this.propertyId,
    this.featureId,
  });

  String? propertyId;
  String? featureId;

  factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
        propertyId: json["property_id"],
        featureId: json["feature_id"],
      );

  Map<String, dynamic> toJson() => {
        "property_id": propertyId,
        "feature_id": featureId,
      };
}

class Images {
  Images({
    this.the1,
    this.the2,
    this.the3,
    this.the4,
    this.the5,
  });

  String? the1;
  String? the2;
  String? the3;
  String? the4;
  String? the5;

  factory Images.fromJson(Map<String, dynamic> json) => Images(
        the1: json["1"],
        the2: json["2"],
        the3: json["3"],
        the4: json["4"],
        the5: json["5"],
      );

  Map<String, dynamic> toJson() => {
        "1": the1,
        "2": the2,
        "3": the3,
        "4": the4,
        "5": the5,
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

class Slugable {
  Slugable({
    this.id,
    this.key,
    this.referenceId,
    this.referenceType,
    this.prefix,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? key;
  String? referenceId;
  String? referenceType;
  String? prefix;
  String? createdAt;
  String? updatedAt;

  factory Slugable.fromJson(Map<String, dynamic> json) => Slugable(
        id: json["id"],
        key: json["key"],
        referenceId: json["reference_id"],
        referenceType: json["reference_type"],
        prefix: json["prefix"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "key": key,
        "reference_id": referenceId,
        "reference_type": referenceType,
        "prefix": prefix,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}

class Type {
  Type({
    this.id,
    this.name,
    this.slug,
    this.order,
    this.code,
  });

  int? id;
  String? name;
  String? slug;
  String? order;
  String? code;

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
