// // To parse this JSON data, do
// //
// //     final featuredPropertiseModel = featuredPropertiseModelFromJson(jsonString);

// import 'dart:convert';

// FeaturedPropertiseModel featuredPropertiseModelFromJson(String str) =>
//     FeaturedPropertiseModel.fromJson(json.decode(str));

// String featuredPropertiseModelToJson(FeaturedPropertiseModel data) =>
//     json.encode(data.toJson());

// class FeaturedPropertiseModel {
//   FeaturedPropertiseModel({
//     this.error,
//     this.data,
//     this.message,
//   });

//   bool? error;
//   Data? data;
//   dynamic message;

//   factory FeaturedPropertiseModel.fromJson(Map<String, dynamic> json) =>
//       FeaturedPropertiseModel(
//         error: json["error"],
//         data: json["data"] == null ? null : Data.fromJson(json["data"]),
//         message: json["message"],
//       );

//   Map<String, dynamic> toJson() => {
//         "error": error,
//         "data": data,
//         "message": message,
//       };
// }

// class Data {
//   Data({
//     this.currentPage,
//     this.data,
//     this.firstPageUrl,
//     this.from,
//     this.lastPage,
//     this.lastPageUrl,
//     this.links,
//     this.nextPageUrl,
//     this.path,
//     this.perPage,
//     this.prevPageUrl,
//     this.to,
//     this.total,
//   });

//   int? currentPage;
//   List<Datum>? data;
//   String? firstPageUrl;
//   int? from;
//   int? lastPage;
//   String? lastPageUrl;
//   List<Link>? links;
//   String? nextPageUrl;
//   String? path;
//   int? perPage;
//   dynamic prevPageUrl;
//   int? to;
//   int? total;

//   factory Data.fromJson(Map<String, dynamic> json) => Data(
//         currentPage: json["current_page"],
//         data: json["data"] == null
//             ? null
//             : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
//         firstPageUrl: json["first_page_url"],
//         from: json["from"],
//         lastPage: json["last_page"],
//         lastPageUrl: json["last_page_url"],
//         links: json["links"] == null
//             ? null
//             : List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
//         nextPageUrl: json["next_page_url"],
//         path: json["path"],
//         perPage: json["per_page"],
//         prevPageUrl: json["prev_page_url"],
//         to: json["to"],
//         total: json["total"],
//       );

//   Map<String, dynamic> toJson() => {
//         "current_page": currentPage,
//         "data": data,
//         "first_page_url": firstPageUrl,
//         "from": from,
//         "last_page": lastPage,
//         "last_page_url": lastPageUrl,
//         "links": links,
//         "next_page_url": nextPageUrl,
//         "path": path,
//         "per_page": perPage,
//         "prev_page_url": prevPageUrl,
//         "to": to,
//         "total": total,
//       };
// }

// class Datum {
//   Datum({
//     this.id,
//     this.name,
//     this.description,
//     this.content,
//     this.location,
//     this.images,
//     this.numberBedroom,
//     this.numberBathroom,
//     this.numberFloor,
//     this.square,
//     this.price,
//     this.currencyId,
//     this.cityId,
//     this.stateId,
//     this.countryId,
//     this.period,
//     this.authorId,
//     this.authorType,
//     this.categoryId,
//     this.isFeatured,
//     this.moderationStatus,
//     this.expireDate,
//     this.autoRenew,
//     this.neverExpired,
//     this.latitude,
//     this.longitude,
//     this.typeId,
//     this.createdAt,
//     this.updatedAt,
//     this.subcategoryId,
//     this.plotNumber,
//     this.streetNumber,
//     this.sectorAndBlockName,
//     this.assignedAgent,
//     this.assignerId,
//     this.isDeleted,
//     this.city,
//     this.country,
//     this.state,
//     this.category,
//     this.type,
//     this.currency,
//     this.features,
//     this.facilities,
//   });

//   int? id;
//   String? name;
//   String? description;
//   String? content;
//   String? location;
//   String? images;
//   String? numberBedroom;
//   String? numberBathroom;
//   String? numberFloor;
//   String? square;
//   String? price;
//   String? currencyId;
//   String? cityId;
//   dynamic stateId;
//   dynamic countryId;
//   String? period;
//   String? authorId;
//   String? authorType;
//   String? categoryId;
//   String? isFeatured;
//   String? moderationStatus;
//   DateTime? expireDate;
//   String? autoRenew;
//   String? neverExpired;
//   String? latitude;
//   String? longitude;
//   String? typeId;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//   dynamic subcategoryId;
//   String? plotNumber;
//   String? streetNumber;
//   String? sectorAndBlockName;
//   String? assignedAgent;
//   String? assignerId;
//   String? isDeleted;
//   City? city;
//   List<dynamic>? country;
//   List<dynamic>? state;
//   Category? category;
//   Type? type;
//   Currency? currency;
//   List<Feature>? features;
//   List<dynamic>? facilities;

//   factory Datum.fromJson(Map<String, dynamic> json) => Datum(
//         id: json["id"],
//         name: json["name"],
//         description: json["description"],
//         content: json["content"],
//         location: json["location"],
//         images: json["images"],
//         numberBedroom: json["number_bedroom"],
//         numberBathroom: json["number_bathroom"],
//         numberFloor: json["number_floor"],
//         square: json["square"],
//         price: json["price"],
//         currencyId: json["currency_id"],
//         cityId: json["city_id"],
//         stateId: json["state_id"],
//         countryId: json["country_id"],
//         period: json["period"],
//         authorId: json["author_id"],
//         authorType: json["author_type"],
//         categoryId: json["category_id"],
//         isFeatured: json["is_featured"],
//         moderationStatus: json["moderation_status"],
//         expireDate: json["expire_date"] == null
//             ? null
//             : DateTime.parse(json["expire_date"]),
//         autoRenew: json["auto_renew"],
//         neverExpired: json["never_expired"],
//         latitude: json["latitude"],
//         longitude: json["longitude"],
//         typeId: json["type_id"],
//         createdAt: json["created_at"] == null
//             ? null
//             : DateTime.parse(json["created_at"]),
//         updatedAt: json["updated_at"] == null
//             ? null
//             : DateTime.parse(json["updated_at"]),
//         subcategoryId: json["subcategory_id"],
//         plotNumber: json["plot_number"],
//         streetNumber: json["street_number"],
//         sectorAndBlockName: json["sector_and_block_name"],
//         assignedAgent: json["assigned_agent"],
//         assignerId: json["assigner_id"],
//         isDeleted: json["is_deleted"],
//         city: json["city"] == null ? null : City.fromJson(json["city"]),
//         country: json["country"] == null
//             ? null
//             : List<dynamic>.from(json["country"].map((x) => x)),
//         state: json["state"] == null
//             ? null
//             : List<dynamic>.from(json["state"].map((x) => x)),
//         category: json["category"] == null
//             ? null
//             : Category.fromJson(json["category"]),
//         type: json["type"] == null ? null : Type.fromJson(json["type"]),
//         currency: json["currency"] == null
//             ? null
//             : Currency.fromJson(json["currency"]),
//         features: json["features"] == null
//             ? null
//             : List<Feature>.from(
//                 json["features"].map((x) => Feature.fromJson(x))),
//         facilities: json["facilities"] == null
//             ? null
//             : List<dynamic>.from(json["facilities"].map((x) => x)),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "description": description,
//         "content": content,
//         "location": location,
//         "images": images,
//         "number_bedroom": numberBedroom,
//         "number_bathroom": numberBathroom,
//         "number_floor": numberFloor,
//         "square": square,
//         "price": price,
//         "currency_id": currencyId,
//         "city_id": cityId,
//         "state_id": stateId,
//         "country_id": countryId,
//         "period": period,
//         "author_id": authorId,
//         "author_type": authorType,
//         "category_id": categoryId,
//         "is_featured": isFeatured,
//         "moderation_status": moderationStatus,
//         "expire_date": expireDate,
//         "auto_renew": autoRenew,
//         "never_expired": neverExpired,
//         "latitude": latitude,
//         "longitude": longitude,
//         "type_id": typeId,
//         "created_at": createdAt,
//         "updated_at": updatedAt,
//         "subcategory_id": subcategoryId,
//         "plot_number": plotNumber,
//         "street_number": streetNumber,
//         "sector_and_block_name": sectorAndBlockName,
//         "assigned_agent": assignedAgent,
//         "assigner_id": assignerId,
//         "is_deleted": isDeleted,
//         "city": city,
//         "country": country,
//         "state": state,
//         "category": category,
//         "type": type,
//         "currency": currency,
//         "features": features,
//         "facilities": facilities,
//       };
// }

// // enum AuthorType { BOTBLE_REAL_ESTATE_MODELS_ACCOUNT }

// // final authorTypeValues = EnumValues({
// //   "Botble\\RealEstate\\Models\\Account":
// //       AuthorType.BOTBLE_REAL_ESTATE_MODELS_ACCOUNT
// // });

// class Category {
//   Category({
//     this.id,
//     this.name,
//     this.description,
//     this.status,
//     this.order,
//     this.isDefault,
//     this.createdAt,
//     this.updatedAt,
//     this.parentId,
//     this.parentclass,
//   });

//   int? id;
//   String? name;
//   String? description;
//   String? status;
//   String? order;
//   String? isDefault;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//   String? parentId;
//   String? parentclass;

//   factory Category.fromJson(Map<String, dynamic> json) => Category(
//         id: json["id"],
//         name: json["name"],
//         description: json["description"],
//         status: json["status"],
//         order: json["order"],
//         isDefault: json["is_default"],
//         createdAt: json["created_at"] == null
//             ? null
//             : DateTime.parse(json["created_at"]),
//         updatedAt: json["updated_at"] == null
//             ? null
//             : DateTime.parse(json["updated_at"]),
//         parentId: json["parent_id"],
//         parentclass: json["parentclass"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "description": description,
//         "status": status,
//         "order": order,
//         "is_default": isDefault,
//         "created_at": createdAt,
//         "updated_at": updatedAt,
//         "parent_id": parentId,
//         "parentclass": parentclass,
//       };
// }

// class City {
//   City({
//     this.id,
//     this.name,
//     this.stateId,
//     this.countryId,
//     this.recordId,
//     this.order,
//     this.isFeatured,
//     this.status,
//     this.createdAt,
//     this.updatedAt,
//     this.slug,
//   });

//   int? id;
//   String? name;
//   String? stateId;
//   String? countryId;
//   dynamic recordId;
//   String? order;
//   String? isFeatured;
//   String? status;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//   String? slug;

//   factory City.fromJson(Map<String, dynamic> json) => City(
//         id: json["id"],
//         name: json["name"],
//         stateId: json["state_id"],
//         countryId: json["country_id"],
//         recordId: json["record_id"],
//         order: json["order"],
//         isFeatured: json["is_featured"],
//         status: json["status"],
//         createdAt: json["created_at"] == null
//             ? null
//             : DateTime.parse(json["created_at"]),
//         updatedAt: json["updated_at"] == null
//             ? null
//             : DateTime.parse(json["updated_at"]),
//         slug: json["slug"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "state_id": stateId,
//         "country_id": countryId,
//         "record_id": recordId,
//         "order": order,
//         "is_featured": isFeatured,
//         "status": status,
//         "created_at": createdAt,
//         "updated_at": updatedAt,
//         "slug": slug,
//       };
// }

// class Currency {
//   Currency({
//     this.id,
//     this.title,
//     this.symbol,
//     this.isPrefixSymbol,
//     this.decimals,
//     this.order,
//     this.isDefault,
//     this.exchangeRate,
//     this.createdAt,
//     this.updatedAt,
//   });

//   int? id;
//   String? title;
//   String? symbol;
//   String? isPrefixSymbol;
//   String? decimals;
//   String? order;
//   String? isDefault;
//   String? exchangeRate;
//   DateTime? createdAt;
//   DateTime? updatedAt;

//   factory Currency.fromJson(Map<String, dynamic> json) => Currency(
//         id: json["id"],
//         title: json["title"],
//         symbol: json["symbol"],
//         isPrefixSymbol: json["is_prefix_symbol"],
//         decimals: json["decimals"],
//         order: json["order"],
//         isDefault: json["is_default"],
//         exchangeRate: json["exchange_rate"],
//         createdAt: json["created_at"] == null
//             ? null
//             : DateTime.parse(json["created_at"]),
//         updatedAt: json["updated_at"] == null
//             ? null
//             : DateTime.parse(json["updated_at"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "title": title,
//         "symbol": symbol,
//         "is_prefix_symbol": isPrefixSymbol,
//         "decimals": decimals,
//         "order": order,
//         "is_default": isDefault,
//         "exchange_rate": exchangeRate,
//         "created_at": createdAt,
//         "updated_at": updatedAt,
//       };
// }

// // enum Symbol { RS, EMPTY }

// // final symbolValues = EnumValues({"\u0024": Symbol.EMPTY, "Rs": Symbol.RS});

// // enum Title { PKR, USD }

// // final titleValues = EnumValues({"PKR": Title.PKR, "USD": Title.USD});

// class Feature {
//   Feature({
//     this.id,
//     this.name,
//     this.icon,
//     this.status,
//     // this.pivot,
//   });

//   int? id;
//   String? name;
//   String? icon;
//   String? status;
//   //Pivot? pivot;

//   factory Feature.fromJson(Map<String, dynamic> json) => Feature(
//         id: json["id"],
//         name: json["name"],
//         icon: json["icon"],
//         status: json["status"],
//         //   pivot: json["pivot"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "icon": icon,
//         "status": status,
//         //    "pivot": pivot,
//       };
// }

// class Pivot {
//   Pivot({
//     this.propertyId,
//     this.featureId,
//   });

//   String? propertyId;
//   String? featureId;

//   factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
//         propertyId: json["property_id"],
//         featureId: json["feature_id"],
//       );

//   Map<String, dynamic> toJson() => {
//         "property_id": propertyId,
//         "feature_id": featureId,
//       };
// }

// // enum ModerationStatus { APPROVED }

// // final moderationStatusValues =
// //     EnumValues({"approved": ModerationStatus.APPROVED});

// // enum Period { MONTH, DAY }

// // final periodValues = EnumValues({"day": Period.DAY, "month": Period.MONTH});

// class Type {
//   Type({
//     this.id,
//     this.name,
//     this.slug,
//     this.order,
//     this.code,
//   });

//   int? id;
//   String? name;
//   String? slug;
//   String? order;
//   String? code;

//   factory Type.fromJson(Map<String, dynamic> json) => Type(
//         id: json["id"],
//         name: json["name"],
//         slug: json["slug"],
//         order: json["order"],
//         code: json["code"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "slug": slug,
//         "order": order,
//         "code": code,
//       };
// }

// class Link {
//   Link({
//     this.url,
//     this.label,
//     this.active,
//   });

//   String? url;
//   String? label;
//   bool? active;

//   factory Link.fromJson(Map<String, dynamic> json) => Link(
//         url: json["url"],
//         label: json["label"],
//         active: json["active"],
//       );

//   Map<String, dynamic> toJson() => {
//         "url": url,
//         "label": label,
//         "active": active,
//       };
// }

// // class EnumValues<T> {
// //   Map<String, T> map;
// //   Map<T, String> reverseMap;

// //   EnumValues(this.map);

// //   Map<T, String> get reverse {
// //     reverseMap ??= map.map((k, v) => MapEntry(v, k));
// //     return reverseMap;
// //   }
// // }

// To parse this JSON data, do
//
//     final featuredPropertiseModel = featuredPropertiseModelFromJson(jsonString);

import 'dart:convert';

FeaturedPropertiseModel? featuredPropertiseModelFromJson(String str) =>
    FeaturedPropertiseModel.fromJson(json.decode(str));

String featuredPropertiseModelToJson(FeaturedPropertiseModel? data) =>
    json.encode(data!.toJson());

class FeaturedPropertiseModel {
  FeaturedPropertiseModel({
    this.error,
    this.data,
    this.message,
  });

  bool? error;
  Data? data;
  dynamic message;

  factory FeaturedPropertiseModel.fromJson(Map<String, dynamic> json) =>
      FeaturedPropertiseModel(
        error: json["error"],
        data: Data.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "data": data!.toJson(),
        "message": message,
      };
}

class Data {
  Data({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.links,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  int? currentPage;
  List<Datum?>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Link?>? links;
  String? nextPageUrl;
  String? path;
  int? perPage;
  dynamic prevPageUrl;
  int? to;
  int? total;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        currentPage: json["current_page"],
        data: json["data"] == null
            ? []
            : List<Datum?>.from(json["data"]!.map((x) => Datum.fromJson(x))),
        firstPageUrl: json["first_page_url"],
        from: json["from"],
        lastPage: json["last_page"],
        lastPageUrl: json["last_page_url"],
        links: json["links"] == null
            ? []
            : List<Link?>.from(json["links"]!.map((x) => Link.fromJson(x))),
        nextPageUrl: json["next_page_url"],
        path: json["path"],
        perPage: json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x!.toJson())),
        "first_page_url": firstPageUrl,
        "from": from,
        "last_page": lastPage,
        "last_page_url": lastPageUrl,
        "links": links == null
            ? []
            : List<dynamic>.from(links!.map((x) => x!.toJson())),
        "next_page_url": nextPageUrl,
        "path": path,
        "per_page": perPage,
        "prev_page_url": prevPageUrl,
        "to": to,
        "total": total,
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
  dynamic images;
  String? numberBedroom;
  String? numberBathroom;
  String? numberFloor;
  String? square;
  String? price;
  String? currencyId;
  String? cityId;
  dynamic stateId;
  dynamic countryId;
  Period? period;
  String? authorId;
  AuthorType? authorType;
  String? categoryId;
  String? isFeatured;
  ModerationStatus? moderationStatus;
  String? expireDate;
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
  City? city;
  List<dynamic>? country;
  List<dynamic>? state;
  Category? category;
  Type? type;
  Currency? currency;
  List<Feature?>? features;
  List<dynamic>? facilities;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
        period: periodValues.map[json["period"]],
        authorId: json["author_id"],
        authorType: authorTypeValues.map[json["author_type"]],
        categoryId: json["category_id"],
        isFeatured: json["is_featured"],
        moderationStatus: moderationStatusValues.map[json["moderation_status"]],
        expireDate: json["expire_date"],
        autoRenew: json["auto_renew"],
        neverExpired: json["never_expired"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        typeId: json["type_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        subcategoryId: json["subcategory_id"],
        plotNumber: json["plot_number"],
        streetNumber: json["street_number"],
        sectorAndBlockName: json["sector_and_block_name"],
        assignedAgent: json["assigned_agent"],
        assignerId: json["assigner_id"],
        isDeleted: json["is_deleted"],
        city: City.fromJson(json["city"]),
        country: json["country"] == null
            ? []
            : List<dynamic>.from(json["country"]!.map((x) => x)),
        state: json["state"] == null
            ? []
            : List<dynamic>.from(json["state"]!.map((x) => x)),
        category: Category.fromJson(json["category"]),
        type: Type.fromJson(json["type"]),
        currency: Currency.fromJson(json["currency"]),
        features: json["features"] == null
            ? []
            : List<Feature?>.from(
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
        "period": periodValues.reverse![period],
        "author_id": authorId,
        "author_type": authorTypeValues.reverse![authorType],
        "category_id": categoryId,
        "is_featured": isFeatured,
        "moderation_status": moderationStatusValues.reverse![moderationStatus],
        "expire_date": expireDate,
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
        "city": city!.toJson(),
        "country":
            country == null ? [] : List<dynamic>.from(country!.map((x) => x)),
        "state": state == null ? [] : List<dynamic>.from(state!.map((x) => x)),
        "category": category!.toJson(),
        "type": type!.toJson(),
        "currency": currency!.toJson(),
        "features": features == null
            ? []
            : List<dynamic>.from(features!.map((x) => x!.toJson())),
        "facilities": facilities == null
            ? []
            : List<dynamic>.from(facilities!.map((x) => x)),
      };
}

enum AuthorType { BOTBLE_REAL_ESTATE_MODELS_ACCOUNT }

final authorTypeValues = EnumValues({
  "Botble\\RealEstate\\Models\\Account":
      AuthorType.BOTBLE_REAL_ESTATE_MODELS_ACCOUNT
});

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
  Status? status;
  String? order;
  String? isDefault;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? parentId;
  String? parentclass;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        status: statusValues.map[json["status"]],
        order: json["order"],
        isDefault: json["is_default"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        parentId: json["parent_id"],
        parentclass: json["parentclass"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "status": statusValues.reverse![status],
        "order": order,
        "is_default": isDefault,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "parent_id": parentId,
        "parentclass": parentclass,
      };
}

enum Status { PUBLISHED }

final statusValues = EnumValues({"published": Status.PUBLISHED});

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
  Status? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? slug;

  factory City.fromJson(Map<String, dynamic> json) => City(
        id: json["id"],
        name: json["name"],
        stateId: json["state_id"],
        countryId: json["country_id"],
        recordId: json["record_id"],
        order: json["order"],
        isFeatured: json["is_featured"],
        status: statusValues.map[json["status"]],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
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
        "status": statusValues.reverse![status],
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
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
  Title? title;
  Symbol? symbol;
  String? isPrefixSymbol;
  String? decimals;
  String? order;
  String? isDefault;
  String? exchangeRate;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Currency.fromJson(Map<String, dynamic> json) => Currency(
        id: json["id"],
        title: titleValues.map[json["title"]],
        symbol: symbolValues.map[json["symbol"]],
        isPrefixSymbol: json["is_prefix_symbol"],
        decimals: json["decimals"],
        order: json["order"],
        isDefault: json["is_default"],
        exchangeRate: json["exchange_rate"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": titleValues.reverse![title],
        "symbol": symbolValues.reverse![symbol],
        "is_prefix_symbol": isPrefixSymbol,
        "decimals": decimals,
        "order": order,
        "is_default": isDefault,
        "exchange_rate": exchangeRate,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

enum Symbol { RS, EMPTY }

final symbolValues = EnumValues({"\u0024": Symbol.EMPTY, "Rs": Symbol.RS});

enum Title { PKR, USD }

final titleValues = EnumValues({"PKR": Title.PKR, "USD": Title.USD});

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
  Status? status;
  Pivot? pivot;

  factory Feature.fromJson(Map<String, dynamic> json) => Feature(
        id: json["id"],
        name: json["name"],
        icon: json["icon"],
        status: statusValues.map[json["status"]],
        pivot: Pivot.fromJson(json["pivot"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "icon": icon,
        "status": statusValues.reverse![status],
        "pivot": pivot!.toJson(),
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

enum ModerationStatus { APPROVED }

final moderationStatusValues =
    EnumValues({"approved": ModerationStatus.APPROVED});

enum Period { MONTH, DAY }

final periodValues = EnumValues({"day": Period.DAY, "month": Period.MONTH});

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
  Slug? slug;
  String? order;
  Code? code;

  factory Type.fromJson(Map<String, dynamic> json) => Type(
        id: json["id"],
        name: json["name"],
        slug: slugValues.map[json["slug"]],
        order: json["order"],
        code: codeValues.map[json["code"]],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": nameValues.reverse![name],
        "slug": slugValues.reverse![slug],
        "order": order,
        "code": codeValues.reverse![code],
      };
}

enum Code { SALE, RENT }

final codeValues = EnumValues({"rent": Code.RENT, "sale": Code.SALE});

enum Name { FOR_SALE, FOR_RENT }

final nameValues =
    EnumValues({"For Rent": Name.FOR_RENT, "For Sale": Name.FOR_SALE});

enum Slug { FOR_SALE, FOR_RENT }

final slugValues =
    EnumValues({"for-rent": Slug.FOR_RENT, "for-sale": Slug.FOR_SALE});

class Link {
  Link({
    this.url,
    this.label,
    this.active,
  });

  String? url;
  String? label;
  bool? active;

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        url: json["url"],
        label: json["label"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "label": label,
        "active": active,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    reverseMap ??= map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
