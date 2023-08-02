// To parse this JSON data, do
//
//     final newsfeedModel = newsfeedModelFromJson(jsonString);

import 'dart:convert';

NewsfeedModel newsfeedModelFromJson(String str) => NewsfeedModel.fromJson(json.decode(str));

String newsfeedModelToJson(NewsfeedModel data) => json.encode(data.toJson());

class NewsfeedModel {
  bool? error;
  Data? data;
  dynamic message;

  NewsfeedModel({
    this.error,
    this.data,
    this.message,
  });

  factory NewsfeedModel.fromJson(Map<String, dynamic> json) => NewsfeedModel(
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

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    currentPage: json["current_page"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    firstPageUrl: json["first_page_url"],
    from: json["from"],
    lastPage: json["last_page"],
    lastPageUrl: json["last_page_url"],
    links: json["links"] == null ? [] : List<Link>.from(json["links"]!.map((x) => Link.fromJson(x))),
    nextPageUrl: json["next_page_url"],
    path: json["path"],
    perPage: json["per_page"],
    prevPageUrl: json["prev_page_url"],
    to: json["to"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "current_page": currentPage,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "first_page_url": firstPageUrl,
    "from": from,
    "last_page": lastPage,
    "last_page_url": lastPageUrl,
    "links": links == null ? [] : List<dynamic>.from(links!.map((x) => x.toJson())),
    "next_page_url": nextPageUrl,
    "path": path,
    "per_page": perPage,
    "prev_page_url": prevPageUrl,
    "to": to,
    "total": total,
  };
}

class Datum {
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
  List<String>? propertyImages;
  int? isWishlist;
  Slugable? slugable;
  City? city;
  List<dynamic>? country;
  dynamic state;
  dynamic category;
  Agent? agent;
  dynamic type;
  Currency? currency;
  List<Feature>? features;
  List<Facility>? facilities;

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
    this.propertyImages,
    this.isWishlist,
    this.slugable,
    this.city,
    this.country,
    this.state,
    this.category,
    this.agent,
    this.type,
    this.currency,
    this.features,
    this.facilities,
  });

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
    propertyImages: json["property_images"] == null ? [] : List<String>.from(json["property_images"]!.map((x) => x)),
    isWishlist: json["is_wishlist"],
    slugable: json["slugable"] == null ? null : Slugable.fromJson(json["slugable"]),
    city: json["city"] == null ? null : City.fromJson(json["city"]),
    country: json["country"] == null ? [] : List<dynamic>.from(json["country"]!.map((x) => x)),
    state: json["state"],
    category: json["category"],
    agent: json["agent"] == null ? null : Agent.fromJson(json["agent"]),
    type: json["type"],
    currency: json["currency"] == null ? null : Currency.fromJson(json["currency"]),
    features: json["features"] == null ? [] : List<Feature>.from(json["features"]!.map((x) => Feature.fromJson(x))),
    facilities: json["facilities"] == null ? [] : List<Facility>.from(json["facilities"]!.map((x) => Facility.fromJson(x))),
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
    "property_images": propertyImages == null ? [] : List<dynamic>.from(propertyImages!.map((x) => x)),
    "is_wishlist": isWishlist,
    "slugable": slugable?.toJson(),
    "city": city?.toJson(),
    "country": country == null ? [] : List<dynamic>.from(country!.map((x) => x)),
    "state": state,
    "category": category,
    "agent": agent?.toJson(),
    "type": type,
    "currency": currency?.toJson(),
    "features": features == null ? [] : List<dynamic>.from(features!.map((x) => x.toJson())),
    "facilities": facilities == null ? [] : List<dynamic>.from(facilities!.map((x) => x.toJson())),
  };
}

class Agent {
  int? id;
  String? email;
  dynamic emailVerifiedAt;
  String? mobileNo;
  String? profileImage;
  DateTime? dob;
  String? activeStatus;
  DateTime? deletedAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? firstName;
  String? lastName;
  String? username;
  String? avatarId;
  String? superUser;
  String? manageSupers;
  String? permissions;
  DateTime? lastLogin;
  dynamic stripeId;
  dynamic pmType;
  dynamic pmLastFour;
  dynamic trialEndsAt;
  String? companyId;
  String? addressId;
  String? roleId;
  dynamic deactivateMessage;
  String? cityId;
  dynamic mobileVerificationCode;
  String? referralCode;
  String? referrerId;
  String? referalScore;

  Agent({
    this.id,
    this.email,
    this.emailVerifiedAt,
    this.mobileNo,
    this.profileImage,
    this.dob,
    this.activeStatus,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.firstName,
    this.lastName,
    this.username,
    this.avatarId,
    this.superUser,
    this.manageSupers,
    this.permissions,
    this.lastLogin,
    this.stripeId,
    this.pmType,
    this.pmLastFour,
    this.trialEndsAt,
    this.companyId,
    this.addressId,
    this.roleId,
    this.deactivateMessage,
    this.cityId,
    this.mobileVerificationCode,
    this.referralCode,
    this.referrerId,
    this.referalScore,
  });

  factory Agent.fromJson(Map<String, dynamic> json) => Agent(
    id: json["id"],
    email: json["email"],
    emailVerifiedAt: json["email_verified_at"],
    mobileNo: json["mobile_no"],
    profileImage: json["profile_image"],
    dob: json["dob"] == null ? null : DateTime.parse(json["dob"]),
    activeStatus: json["active_status"],
    deletedAt: json["deleted_at"] == null ? null : DateTime.parse(json["deleted_at"]),
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    firstName: json["first_name"],
    lastName: json["last_name"],
    username: json["username"],
    avatarId: json["avatar_id"],
    superUser: json["super_user"],
    manageSupers: json["manage_supers"],
    permissions: json["permissions"],
    lastLogin: json["last_login"] == null ? null : DateTime.parse(json["last_login"]),
    stripeId: json["stripe_id"],
    pmType: json["pm_type"],
    pmLastFour: json["pm_last_four"],
    trialEndsAt: json["trial_ends_at"],
    companyId: json["company_id"],
    addressId: json["address_id"],
    roleId: json["role_id"],
    deactivateMessage: json["deactivate_message"],
    cityId: json["city_id"],
    mobileVerificationCode: json["mobile_verification_code"],
    referralCode: json["referral_code"],
    referrerId: json["referrer_id"],
    referalScore: json["referal_score"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "email": email,
    "email_verified_at": emailVerifiedAt,
    "mobile_no": mobileNo,
    "profile_image": profileImage,
    "dob": "${dob!.year.toString().padLeft(4, '0')}-${dob!.month.toString().padLeft(2, '0')}-${dob!.day.toString().padLeft(2, '0')}",
    "active_status": activeStatus,
    "deleted_at": deletedAt?.toIso8601String(),
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "first_name": firstName,
    "last_name": lastName,
    "username": username,
    "avatar_id": avatarId,
    "super_user": superUser,
    "manage_supers": manageSupers,
    "permissions": permissions,
    "last_login": lastLogin?.toIso8601String(),
    "stripe_id": stripeId,
    "pm_type": pmType,
    "pm_last_four": pmLastFour,
    "trial_ends_at": trialEndsAt,
    "company_id": companyId,
    "address_id": addressId,
    "role_id": roleId,
    "deactivate_message": deactivateMessage,
    "city_id": cityId,
    "mobile_verification_code": mobileVerificationCode,
    "referral_code": referralCode,
    "referrer_id": referrerId,
    "referal_score": referalScore,
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

class CategoryClass {
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

  CategoryClass({
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

  factory CategoryClass.fromJson(Map<String, dynamic> json) => CategoryClass(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    status: statusValues.map[json["status"]]!,
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
    "status": statusValues.reverse[status],
    "order": order,
    "is_default": isDefault,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "parent_id": parentId,
    "parentclass": parentclass,
  };
}

enum Status {
  PUBLISHED
}

final statusValues = EnumValues({
  "published": Status.PUBLISHED
});

class City {
  int? id;
  Name? name;
  String? stateId;
  String? countryId;
  dynamic recordId;
  String? order;
  String? isFeatured;
  Status? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  Slug? slug;

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
    name: nameValues.map[json["name"]]!,
    stateId: json["state_id"],
    countryId: json["country_id"],
    recordId: json["record_id"],
    order: json["order"],
    isFeatured: json["is_featured"],
    status: statusValues.map[json["status"]]!,
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    slug: slugValues.map[json["slug"]]!,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": nameValues.reverse[name],
    "state_id": stateId,
    "country_id": countryId,
    "record_id": recordId,
    "order": order,
    "is_featured": isFeatured,
    "status": statusValues.reverse[status],
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "slug": slugValues.reverse[slug],
  };
}

enum Name {
  ISLAMABAD,
  LAHORE,
  RAWALPINDI
}

final nameValues = EnumValues({
  "Islamabad": Name.ISLAMABAD,
  "Lahore": Name.LAHORE,
  "Rawalpindi": Name.RAWALPINDI
});

enum Slug {
  LHR,
  LSB,
  RWP
}

final slugValues = EnumValues({
  "lhr": Slug.LHR,
  "lsb": Slug.LSB,
  "rwp": Slug.RWP
});

class Currency {
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
    title: titleValues.map[json["title"]]!,
    symbol: symbolValues.map[json["symbol"]]!,
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

enum Symbol {
  EMPTY,
  RS
}

final symbolValues = EnumValues({
  "\u0024": Symbol.EMPTY,
  "Rs": Symbol.RS
});

enum Title {
  PKR,
  USD
}

final titleValues = EnumValues({
  "PKR": Title.PKR,
  "USD": Title.USD
});

class Facility {
  int? id;
  String? name;
  String? icon;
  Status? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  FacilityPivot? pivot;

  Facility({
    this.id,
    this.name,
    this.icon,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.pivot,
  });

  factory Facility.fromJson(Map<String, dynamic> json) => Facility(
    id: json["id"],
    name: json["name"],
    icon: json["icon"],
    status: statusValues.map[json["status"]]!,
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    pivot: json["pivot"] == null ? null : FacilityPivot.fromJson(json["pivot"]),
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
  String? referenceId;
  String? facilityId;
  String? referenceType;
  String? distance;

  FacilityPivot({
    this.referenceId,
    this.facilityId,
    this.referenceType,
    this.distance,
  });

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
  int? id;
  String? name;
  String? icon;
  Status? status;
  FeaturePivot? pivot;

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
    status: statusValues.map[json["status"]]!,
    pivot: json["pivot"] == null ? null : FeaturePivot.fromJson(json["pivot"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "icon": icon,
    "status": statusValues.reverse[status],
    "pivot": pivot?.toJson(),
  };
}

class FeaturePivot {
  String? propertyId;
  String? featureId;

  FeaturePivot({
    this.propertyId,
    this.featureId,
  });

  factory FeaturePivot.fromJson(Map<String, dynamic> json) => FeaturePivot(
    propertyId: json["property_id"],
    featureId: json["feature_id"],
  );

  Map<String, dynamic> toJson() => {
    "property_id": propertyId,
    "feature_id": featureId,
  };
}

enum ModerationStatus {
  APPROVED
}

final moderationStatusValues = EnumValues({
  "approved": ModerationStatus.APPROVED
});

enum Period {
  DAY,
  MONTH
}

final periodValues = EnumValues({
  "day": Period.DAY,
  "month": Period.MONTH
});

class Slugable {
  int? id;
  String? key;
  String? referenceId;
  String? referenceType;
  String? prefix;
  DateTime? createdAt;
  DateTime? updatedAt;

  Slugable({
    this.id,
    this.key,
    this.referenceId,
    this.referenceType,
    this.prefix,
    this.createdAt,
    this.updatedAt,
  });

  factory Slugable.fromJson(Map<String, dynamic> json) => Slugable(
    id: json["id"],
    key: json["key"],
    referenceId: json["reference_id"],
    referenceType: json["reference_type"],
    prefix: json["prefix"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "key": key,
    "reference_id": referenceId,
    "reference_type": referenceType,
    "prefix": prefix,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}

class StateClass {
  int? id;
  String? name;
  String? abbreviation;
  String? countryId;
  String? order;
  String? isFeatured;
  Status? status;
  DateTime? createdAt;
  DateTime? updatedAt;

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

  factory StateClass.fromJson(Map<String, dynamic> json) => StateClass(
    id: json["id"],
    name: json["name"],
    abbreviation: json["abbreviation"],
    countryId: json["country_id"],
    order: json["order"],
    isFeatured: json["is_featured"],
    status: statusValues.map[json["status"]]!,
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
    "status": statusValues.reverse[status],
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}

class TypeClass {
  int? id;
  String? name;
  String? slug;
  String? order;
  String? code;

  TypeClass({
    this.id,
    this.name,
    this.slug,
    this.order,
    this.code,
  });

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

class Link {
  String? url;
  String? label;
  bool? active;

  Link({
    this.url,
    this.label,
    this.active,
  });

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
