// // To parse this JSON data, do
// //
// //     final profileMyPropertiseResponse = profileMyPropertiseResponseFromJson(jsonString);

// import 'dart:convert';

// ProfileMyPropertiseResponse profileMyPropertiseResponseFromJson(String str) =>
//     ProfileMyPropertiseResponse.fromJson(json.decode(str));

// String profileMyPropertiseResponseToJson(ProfileMyPropertiseResponse data) =>
//     json.encode(data.toJson());

// class ProfileMyPropertiseResponse {
//   ProfileMyPropertiseResponse({
//     this.error,
//     this.data,
//     this.message,
//   });

//   bool? error;
//   List<Datum>? data;
//   dynamic message;

//   factory ProfileMyPropertiseResponse.fromJson(Map<String, dynamic> json) =>
//       ProfileMyPropertiseResponse(
//         error: json["error"],
//         data: json["data"] == null
//             ? []
//             : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
//         message: json["message"],
//       );

//   Map<String, dynamic> toJson() => {
//         "error": error,
//         "data": data == null
//             ? []
//             : List<dynamic>.from(data!.map((x) => x.toJson())),
//         "message": message,
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
//   dynamic images;
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
//   dynamic assignedAgent;
//   String? assignerId;
//   String? isDeleted;
//   City? city;
//   List<dynamic>? state;
//   Category? category;
//   Type? type;
//   Currency? currency;
//   List<Feature>? features;
//   List<Facility>? facilities;

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
//         // state: json["state"] == null
//         //     ? []
//         //     : List<dynamic>.from(json["state"]!.map((x) => x)),
//         category: json["category"] == null
//             ? null
//             : Category.fromJson(json["category"]),
//         type: json["type"],
//         currency: json["currency"] == null
//             ? null
//             : Currency.fromJson(json["currency"]),
//         features: json["features"] == null
//             ? []
//             : List<Feature>.from(
//                 json["features"]!.map((x) => Feature.fromJson(x))),
//         facilities: json["facilities"] == null
//             ? []
//             : List<Facility>.from(
//                 json["facilities"]!.map((x) => Facility.fromJson(x))),
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
//         "expire_date": expireDate?.toIso8601String(),
//         "auto_renew": autoRenew,
//         "never_expired": neverExpired,
//         "latitude": latitude,
//         "longitude": longitude,
//         "type_id": typeId,
//         "created_at": createdAt?.toIso8601String(),
//         "updated_at": updatedAt?.toIso8601String(),
//         "subcategory_id": subcategoryId,
//         "plot_number": plotNumber,
//         "street_number": streetNumber,
//         "sector_and_block_name": sectorAndBlockName,
//         "assigned_agent": assignedAgent,
//         "assigner_id": assignerId,
//         "is_deleted": isDeleted,
//         "city": city?.toJson(),
//         "state": state == null ? [] : List<dynamic>.from(state!.map((x) => x)),
//         "category": category?.toJson(),
//         "type": type?.toJson(),
//         "currency": currency?.toJson(),
//         "features": features == null
//             ? []
//             : List<dynamic>.from(features!.map((x) => x.toJson())),
//         "facilities": facilities == null
//             ? []
//             : List<dynamic>.from(facilities!.map((x) => x.toJson())),
//       };
// }

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
//         "created_at": createdAt?.toIso8601String(),
//         "updated_at": updatedAt?.toIso8601String(),
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
//         "created_at": createdAt?.toIso8601String(),
//         "updated_at": updatedAt?.toIso8601String(),
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
//         "created_at": createdAt?.toIso8601String(),
//         "updated_at": updatedAt?.toIso8601String(),
//       };
// }

// class Facility {
//   Facility({
//     this.id,
//     this.name,
//     this.icon,
//     this.status,
//     this.createdAt,
//     this.updatedAt,
//     this.pivot,
//   });

//   int? id;
//   String? name;
//   String? icon;
//   String? status;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//   FacilityPivot? pivot;

//   factory Facility.fromJson(Map<String, dynamic> json) => Facility(
//         id: json["id"],
//         name: json["name"],
//         icon: json["icon"],
//         status: json["status"],
//         createdAt: json["created_at"] == null
//             ? null
//             : DateTime.parse(json["created_at"]),
//         updatedAt: json["updated_at"] == null
//             ? null
//             : DateTime.parse(json["updated_at"]),
//         pivot: json["pivot"] == null
//             ? null
//             : FacilityPivot.fromJson(json["pivot"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "icon": icon,
//         "status": status,
//         "created_at": createdAt?.toIso8601String(),
//         "updated_at": updatedAt?.toIso8601String(),
//         "pivot": pivot?.toJson(),
//       };
// }

// class FacilityPivot {
//   FacilityPivot({
//     this.referenceId,
//     this.facilityId,
//     this.referenceType,
//     this.distance,
//   });

//   String? referenceId;
//   String? facilityId;
//   String? referenceType;
//   String? distance;

//   factory FacilityPivot.fromJson(Map<String, dynamic> json) => FacilityPivot(
//         referenceId: json["reference_id"],
//         facilityId: json["facility_id"],
//         referenceType: json["reference_type"],
//         distance: json["distance"],
//       );

//   Map<String, dynamic> toJson() => {
//         "reference_id": referenceId,
//         "facility_id": facilityId,
//         "reference_type": referenceType,
//         "distance": distance,
//       };
// }

// class Feature {
//   Feature({
//     this.id,
//     this.name,
//     this.icon,
//     this.status,
//     this.pivot,
//   });

//   int? id;
//   String? name;
//   String? icon;
//   String? status;
//   FeaturePivot? pivot;

//   factory Feature.fromJson(Map<String, dynamic> json) => Feature(
//         id: json["id"],
//         name: json["name"],
//         icon: json["icon"],
//         status: json["status"],
//         pivot:
//             json["pivot"] == null ? null : FeaturePivot.fromJson(json["pivot"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "icon": icon,
//         "status": status,
//         "pivot": pivot?.toJson(),
//       };
// }

// class FeaturePivot {
//   FeaturePivot({
//     this.propertyId,
//     this.featureId,
//   });

//   String? propertyId;
//   String? featureId;

//   factory FeaturePivot.fromJson(Map<String, dynamic> json) => FeaturePivot(
//         propertyId: json["property_id"],
//         featureId: json["feature_id"],
//       );

//   Map<String, dynamic> toJson() => {
//         "property_id": propertyId,
//         "feature_id": featureId,
//       };
// }

// class ImagesClass {
//   ImagesClass({
//     this.the1,
//   });

//   String? the1;

//   factory ImagesClass.fromJson(Map<String, dynamic> json) => ImagesClass(
//         the1: json["1"],
//       );

//   Map<String, dynamic> toJson() => {
//         "1": the1,
//       };
// }

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

// To parse this JSON data, do
//
//     final profileMyPropertiseResponse = profileMyPropertiseResponseFromJson(jsonString);

import 'dart:convert';

ProfileMyPropertiseResponse profileMyPropertiseResponseFromJson(String str) =>
    ProfileMyPropertiseResponse.fromJson(json.decode(str));

String profileMyPropertiseResponseToJson(ProfileMyPropertiseResponse data) =>
    json.encode(data.toJson());

class ProfileMyPropertiseResponse {
  ProfileMyPropertiseResponse({
    this.error,
    this.data,
    this.message,
  });

  bool? error;
  List<Datum>? data;
  dynamic message;

  factory ProfileMyPropertiseResponse.fromJson(Map<String, dynamic> json) =>
      ProfileMyPropertiseResponse(
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
    this.city,
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
  String? expireDate;
  String? autoRenew;
  String? neverExpired;
  dynamic latitude;
  dynamic longitude;
  String? typeId;
  String? createdAt;
  String? updatedAt;
  dynamic subcategoryId;
  String? plotNumber;
  String? streetNumber;
  String? sectorAndBlockName;
  dynamic assignedAgent;
  String? assignerId;
  String? isDeleted;
  String? isLiked;
  City? city;
  dynamic state;
  Category? category;
  dynamic type;
  Currency? currency;
  List<dynamic>? features;
  List<Facility>? facilities;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        content: json["content"],
        location: json["location"],
        images: json["images"] == null
            ? []
            : List<String>.from(json["images"]!.map((x) => x)),
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
        city: json["city"] == null ? null : City.fromJson(json["city"]),
        state: json["state"],
        category: json["category"] == null
            ? null
            : Category.fromJson(json["category"]),
        type: json["type"],
        currency: json["currency"] == null
            ? null
            : Currency.fromJson(json["currency"]),
        features: json["features"] == null
            ? []
            : List<dynamic>.from(json["features"]!.map((x) => x)),
        facilities: json["facilities"] == null
            ? []
            : List<Facility>.from(
                json["facilities"]!.map((x) => Facility.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "content": content,
        "location": location,
        "images":
            images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
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
        "city": city?.toJson(),
        "state": state,
        "category": category?.toJson(),
        "type": type,
        "currency": currency?.toJson(),
        "features":
            features == null ? [] : List<dynamic>.from(features!.map((x) => x)),
        "facilities": facilities == null
            ? []
            : List<dynamic>.from(facilities!.map((x) => x.toJson())),
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
  dynamic description;
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

class Facility {
  Facility({
    this.id,
    this.name,
    this.icon,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.pivot,
  });

  int? id;
  String? name;
  String? icon;
  String? status;
  String? createdAt;
  String? updatedAt;
  Pivot? pivot;

  factory Facility.fromJson(Map<String, dynamic> json) => Facility(
        id: json["id"],
        name: json["name"],
        icon: json["icon"],
        status: json["status"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        pivot: json["pivot"] == null ? null : Pivot.fromJson(json["pivot"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "icon": icon,
        "status": status,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "pivot": pivot?.toJson(),
      };
}

class Pivot {
  Pivot({
    this.referenceId,
    this.facilityId,
    this.referenceType,
    this.distance,
  });

  String? referenceId;
  String? facilityId;
  String? referenceType;
  String? distance;

  factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
        referenceId: json["reference_id"],
        facilityId: json["facility_id"],
        referenceType: json["reference_type"],
        distance: json["distance"],
      );

  Map<String, dynamic> toJson() => {
        "reference_id": referenceId,
        "facility_id": facilityId,
        "reference_type": referenceType,
        "distance": distance,
      };
}

class StateClass {
  StateClass({
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

  int? id;
  String? name;
  String? abbreviation;
  String? countryId;
  String? order;
  String? isFeatured;
  String? status;
  String? createdAt;
  String? updatedAt;

  factory StateClass.fromJson(Map<String, dynamic> json) => StateClass(
        id: json["id"],
        name: json["name"],
        abbreviation: json["abbreviation"],
        countryId: json["country_id"],
        order: json["order"],
        isFeatured: json["is_featured"],
        status: json["status"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "abbreviation": abbreviation,
        "country_id": countryId,
        "order": order,
        "is_featured": isFeatured,
        "status": status,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}

class TypeClass {
  TypeClass({
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

  factory TypeClass.fromJson(Map<String, dynamic> json) => TypeClass(
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
