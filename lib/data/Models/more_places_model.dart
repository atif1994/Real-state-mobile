// To parse this JSON data, do
//
//     final allPropertiesResponse = allPropertiesResponseFromJson(jsonString);

import 'dart:convert';

AllPropertiesResponse allPropertiesResponseFromJson(String str) =>
    AllPropertiesResponse.fromJson(json.decode(str));

String allPropertiesResponseToJson(AllPropertiesResponse data) =>
    json.encode(data.toJson());

class AllPropertiesResponse {
  AllPropertiesResponse({
    this.error,
    this.data,
    this.message,
  });

  bool? error;
  Data? data;
  dynamic message;

  factory AllPropertiesResponse.fromJson(Map<String, dynamic> json) =>
      AllPropertiesResponse(
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
  List<Datum>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Link>? links;
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
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
        firstPageUrl: json["first_page_url"],
        from: json["from"],
        lastPage: json["last_page"],
        lastPageUrl: json["last_page_url"],
        links: json["links"] == null
            ? []
            : List<Link>.from(json["links"]!.map((x) => Link.fromJson(x))),
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
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "first_page_url": firstPageUrl,
        "from": from,
        "last_page": lastPage,
        "last_page_url": lastPageUrl,
        "links": links == null
            ? []
            : List<dynamic>.from(links!.map((x) => x.toJson())),
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
    this.likesOnProperties,
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
  Content? content;
  Location? location;
  List<dynamic>? images;
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
  SectorAndBlockName? sectorAndBlockName;
  dynamic assignedAgent;
  String? assignerId;
  String? isDeleted;
  List<LikesOnProperty>? likesOnProperties;
  City? city;
  List<dynamic>? country;
  dynamic state;
  Category? category;
  Type? type;
  Currency? currency;
  List<Feature>? features;
  List<Facility>? facilities;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        content: contentValues.map[json["content"]]!,
        location: locationValues.map[json["location"]]!,
        images: json["images"] == null
            ? []
            : List<dynamic>.from(json["images"]!.map((x) => x)),
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
        moderationStatus:
            moderationStatusValues.map[json["moderation_status"]]!,
        expireDate: json["expire_date"] == null
            ? null
            : DateTime.parse(json["expire_date"]),
        autoRenew: json["auto_renew"],
        neverExpired: json["never_expired"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        typeId: json["type_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        subcategoryId: json["subcategory_id"],
        plotNumber: json["plot_number"],
        streetNumber: json["street_number"],
        sectorAndBlockName:
            sectorAndBlockNameValues.map[json["sector_and_block_name"]]!,
        assignedAgent: json["assigned_agent"],
        assignerId: json["assigner_id"],
        isDeleted: json["is_deleted"],
        likesOnProperties: json["likes_on_properties"] == null
            ? []
            : List<LikesOnProperty>.from(json["likes_on_properties"]!
                .map((x) => LikesOnProperty.fromJson(x))),
        city: json["city"] == null ? null : City.fromJson(json["city"]),
        country: json["country"] == null
            ? []
            : List<dynamic>.from(json["country"]!.map((x) => x)),
        state: json["state"],
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
            : List<Facility>.from(
                json["facilities"]!.map((x) => Facility.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "content": contentValues.reverse[content],
        "location": locationValues.reverse[location],
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
        "sector_and_block_name":
            sectorAndBlockNameValues.reverse[sectorAndBlockName],
        "assigned_agent": assignedAgent,
        "assigner_id": assignerId,
        "is_deleted": isDeleted,
        "likes_on_properties": likesOnProperties == null
            ? []
            : List<dynamic>.from(likesOnProperties!.map((x) => x.toJson())),
        "city": city?.toJson(),
        "country":
            country == null ? [] : List<dynamic>.from(country!.map((x) => x)),
        "state": state,
        "category": category?.toJson(),
        "type": type?.toJson(),
        "currency": currency?.toJson(),
        "features": features == null
            ? []
            : List<dynamic>.from(features!.map((x) => x.toJson())),
        "facilities": facilities == null
            ? []
            : List<dynamic>.from(facilities!.map((x) => x.toJson())),
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
  CategoryName? name;
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
        name: categoryNameValues.map[json["name"]]!,
        description: json["description"],
        status: statusValues.map[json["status"]]!,
        order: json["order"],
        isDefault: json["is_default"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        parentId: json["parent_id"],
        parentclass: json["parentclass"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": categoryNameValues.reverse[name],
        "description": description,
        "status": statusValues.reverse[status],
        "order": order,
        "is_default": isDefault,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "parent_id": parentId,
        "parentclass": parentclass,
      };
}

enum CategoryName { VILLA, OFFICE, HOUSE }

final categoryNameValues = EnumValues({
  "House": CategoryName.HOUSE,
  "Office": CategoryName.OFFICE,
  "Villa": CategoryName.VILLA
});

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
  CityName? name;
  String? stateId;
  String? countryId;
  dynamic recordId;
  String? order;
  String? isFeatured;
  Status? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  CitySlug? slug;

  factory City.fromJson(Map<String, dynamic> json) => City(
        id: json["id"],
        name: cityNameValues.map[json["name"]]!,
        stateId: json["state_id"],
        countryId: json["country_id"],
        recordId: json["record_id"],
        order: json["order"],
        isFeatured: json["is_featured"],
        status: statusValues.map[json["status"]]!,
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        slug: citySlugValues.map[json["slug"]]!,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": cityNameValues.reverse[name],
        "state_id": stateId,
        "country_id": countryId,
        "record_id": recordId,
        "order": order,
        "is_featured": isFeatured,
        "status": statusValues.reverse[status],
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "slug": citySlugValues.reverse[slug],
      };
}

enum CityName { LAHORE, KARACHI, ISLAMABAD }

final cityNameValues = EnumValues({
  "Islamabad": CityName.ISLAMABAD,
  "Karachi": CityName.KARACHI,
  "Lahore": CityName.LAHORE
});

enum CitySlug { LHR, KHI, LSB }

final citySlugValues =
    EnumValues({"khi": CitySlug.KHI, "lhr": CitySlug.LHR, "lsb": CitySlug.LSB});

enum Content { P_PZDKGSDFKOB_MS_DLMFSL_P, P_YUGJHGJHG_P, TESTING_FROM_MOBILE }

final contentValues = EnumValues({
  "<p>pzdkgsdfkob'ms'dlmfsl</p>": Content.P_PZDKGSDFKOB_MS_DLMFSL_P,
  "<p>yugjhgjhg</p>": Content.P_YUGJHGJHG_P,
  "testing from mobile": Content.TESTING_FROM_MOBILE
});

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
        title: titleValues.map[json["title"]]!,
        symbol: symbolValues.map[json["symbol"]]!,
        isPrefixSymbol: json["is_prefix_symbol"],
        decimals: json["decimals"],
        order: json["order"],
        isDefault: json["is_default"],
        exchangeRate: json["exchange_rate"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": titleValues.reverse[title],
        "symbol": symbolValues.reverse[symbol],
        "is_prefix_symbol": isPrefixSymbol,
        "decimals": decimals,
        "order": order,
        "is_default": isDefault,
        "exchange_rate": exchangeRate,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

enum Symbol { EMPTY, RS }

final symbolValues = EnumValues({"\u0024": Symbol.EMPTY, "Rs": Symbol.RS});

enum Title { USD, PKR }

final titleValues = EnumValues({"PKR": Title.PKR, "USD": Title.USD});

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
  Status? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  FacilityPivot? pivot;

  factory Facility.fromJson(Map<String, dynamic> json) => Facility(
        id: json["id"],
        name: json["name"],
        icon: json["icon"],
        status: statusValues.map[json["status"]]!,
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        pivot: json["pivot"] == null
            ? null
            : FacilityPivot.fromJson(json["pivot"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "icon": icon,
        "status": statusValues.reverse[status],
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "pivot": pivot?.toJson(),
      };
}

class FacilityPivot {
  FacilityPivot({
    this.referenceId,
    this.facilityId,
    this.referenceType,
    this.distance,
  });

  String? referenceId;
  String? facilityId;
  String? referenceType;
  String? distance;

  factory FacilityPivot.fromJson(Map<String, dynamic> json) => FacilityPivot(
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

class Feature {
  Feature({
    this.id,
    this.name,
    this.icon,
    this.status,
    this.pivot,
  });

  int? id;
  FeatureName? name;
  Icon? icon;
  Status? status;
  FeaturePivot? pivot;

  factory Feature.fromJson(Map<String, dynamic> json) => Feature(
        id: json["id"],
        name: featureNameValues.map[json["name"]]!,
        icon: iconValues.map[json["icon"]]!,
        status: statusValues.map[json["status"]]!,
        pivot:
            json["pivot"] == null ? null : FeaturePivot.fromJson(json["pivot"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": featureNameValues.reverse[name],
        "icon": iconValues.reverse[icon],
        "status": statusValues.reverse[status],
        "pivot": pivot?.toJson(),
      };
}

enum Icon { FAS_FA_USER_SECRET, FA_FA_WAREHOUSE }

final iconValues = EnumValues({
  "fas fa-user-secret": Icon.FAS_FA_USER_SECRET,
  "fa fa-warehouse": Icon.FA_FA_WAREHOUSE
});

enum FeatureName { SECURITY_STAFF, BALCONY }

final featureNameValues = EnumValues({
  "Balcony": FeatureName.BALCONY,
  "Security Staff": FeatureName.SECURITY_STAFF
});

class FeaturePivot {
  FeaturePivot({
    this.propertyId,
    this.featureId,
  });

  String? propertyId;
  String? featureId;

  factory FeaturePivot.fromJson(Map<String, dynamic> json) => FeaturePivot(
        propertyId: json["property_id"],
        featureId: json["feature_id"],
      );

  Map<String, dynamic> toJson() => {
        "property_id": propertyId,
        "feature_id": featureId,
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

enum Location { VOLUPTATES_SINT_ENIM, OMNIS_INCIDUNT_ENIM, RAWALPINDI }

final locationValues = EnumValues({
  "Omnis incidunt enim": Location.OMNIS_INCIDUNT_ENIM,
  "rawalpindi": Location.RAWALPINDI,
  "Voluptates sint enim": Location.VOLUPTATES_SINT_ENIM
});

enum ModerationStatus { PENDING }

final moderationStatusValues =
    EnumValues({"pending": ModerationStatus.PENDING});

enum Period { DAY, MONTH }

final periodValues = EnumValues({"day": Period.DAY, "month": Period.MONTH});

enum SectorAndBlockName { VEDA_DUNN, XAVIERA_LYONS, BLOCK_EI }

final sectorAndBlockNameValues = EnumValues({
  "block ei": SectorAndBlockName.BLOCK_EI,
  "Veda Dunn": SectorAndBlockName.VEDA_DUNN,
  "Xaviera Lyons": SectorAndBlockName.XAVIERA_LYONS
});

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
  Status? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory StateClass.fromJson(Map<String, dynamic> json) => StateClass(
        id: json["id"],
        name: json["name"],
        abbreviation: json["abbreviation"],
        countryId: json["country_id"],
        order: json["order"],
        isFeatured: json["is_featured"],
        status: statusValues.map[json["status"]]!,
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "abbreviation": abbreviation,
        "country_id": countryId,
        "order": order,
        "is_featured": isFeatured,
        "status": statusValues.reverse[status],
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
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
  TypeSlug? slug;
  String? order;
  Code? code;

  factory Type.fromJson(Map<String, dynamic> json) => Type(
        id: json["id"],
        name: json["name"]!,
        slug: typeSlugValues.map[json["slug"]]!,
        order: json["order"],
        code: codeValues.map[json["code"]]!,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": typeNameValues.reverse[name],
        "slug": typeSlugValues.reverse[slug],
        "order": order,
        "code": codeValues.reverse[code],
      };
}

enum Code { SALE, INVEST }

final codeValues = EnumValues({"invest": Code.INVEST, "sale": Code.SALE});

enum TypeName { FOR_SALE, FOR_INVEST }

final typeNameValues = EnumValues(
    {"For Invest": TypeName.FOR_INVEST, "For Sale": TypeName.FOR_SALE});

enum TypeSlug { FOR_SALE, FOR_INVEST }

final typeSlugValues = EnumValues(
    {"for-invest": TypeSlug.FOR_INVEST, "for-sale": TypeSlug.FOR_SALE});

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
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
