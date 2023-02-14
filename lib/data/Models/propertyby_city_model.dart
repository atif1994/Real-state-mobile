// To parse this JSON data, do
//
//     final propertyByCityModel = propertyByCityModelFromJson(jsonString);

import 'dart:convert';

PropertyByCityModel propertyByCityModelFromJson(String str) =>
    PropertyByCityModel.fromJson(json.decode(str));

String propertyByCityModelToJson(PropertyByCityModel data) =>
    json.encode(data.toJson());

class PropertyByCityModel {
  PropertyByCityModel({
    this.error,
    this.data,
    this.message,
  });

  bool? error;
  Data? data;
  dynamic message;

  PropertyByCityModel copyWith({
    bool? error,
    Data? data,
    dynamic message,
  }) =>
      PropertyByCityModel(
        error: error ?? this.error,
        data: data ?? this.data,
        message: message ?? this.message,
      );

  factory PropertyByCityModel.fromJson(Map<String, dynamic> json) =>
      PropertyByCityModel(
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

  Data copyWith({
    int? currentPage,
    List<Datum>? data,
    String? firstPageUrl,
    int? from,
    int? lastPage,
    String? lastPageUrl,
    List<Link>? links,
    String? nextPageUrl,
    String? path,
    int? perPage,
    dynamic prevPageUrl,
    int? to,
    int? total,
  }) =>
      Data(
        currentPage: currentPage ?? this.currentPage,
        data: data ?? this.data,
        firstPageUrl: firstPageUrl ?? this.firstPageUrl,
        from: from ?? this.from,
        lastPage: lastPage ?? this.lastPage,
        lastPageUrl: lastPageUrl ?? this.lastPageUrl,
        links: links ?? this.links,
        nextPageUrl: nextPageUrl ?? this.nextPageUrl,
        path: path ?? this.path,
        perPage: perPage ?? this.perPage,
        prevPageUrl: prevPageUrl ?? this.prevPageUrl,
        to: to ?? this.to,
        total: total ?? this.total,
      );

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
  List<LikesOnProperty>? likesOnProperties;
  City? city;
  List<dynamic>? country;
  List<dynamic>? state;
  Category? category;
  Type? type;
  Currency? currency;
  List<Feature>? features;
  List<dynamic>? facilities;

  Datum copyWith({
    int? id,
    String? name,
    String? description,
    String? content,
    String? location,
    dynamic images,
    String? numberBedroom,
    String? numberBathroom,
    String? numberFloor,
    String? square,
    String? price,
    String? currencyId,
    String? cityId,
    dynamic stateId,
    dynamic countryId,
    String? period,
    String? authorId,
    String? authorType,
    String? categoryId,
    String? isFeatured,
    String? moderationStatus,
    String? expireDate,
    String? autoRenew,
    String? neverExpired,
    dynamic latitude,
    dynamic longitude,
    String? typeId,
    String? createdAt,
    String? updatedAt,
    dynamic subcategoryId,
    String? plotNumber,
    String? streetNumber,
    String? sectorAndBlockName,
    dynamic assignedAgent,
    String? assignerId,
    String? isDeleted,
    List<LikesOnProperty>? likesOnProperties,
    City? city,
    List<dynamic>? country,
    List<dynamic>? state,
    Category? category,
    Type? type,
    Currency? currency,
    List<Feature>? features,
    List<dynamic>? facilities,
  }) =>
      Datum(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        content: content ?? this.content,
        location: location ?? this.location,
        images: images ?? this.images,
        numberBedroom: numberBedroom ?? this.numberBedroom,
        numberBathroom: numberBathroom ?? this.numberBathroom,
        numberFloor: numberFloor ?? this.numberFloor,
        square: square ?? this.square,
        price: price ?? this.price,
        currencyId: currencyId ?? this.currencyId,
        cityId: cityId ?? this.cityId,
        stateId: stateId ?? this.stateId,
        countryId: countryId ?? this.countryId,
        period: period ?? this.period,
        authorId: authorId ?? this.authorId,
        authorType: authorType ?? this.authorType,
        categoryId: categoryId ?? this.categoryId,
        isFeatured: isFeatured ?? this.isFeatured,
        moderationStatus: moderationStatus ?? this.moderationStatus,
        expireDate: expireDate ?? this.expireDate,
        autoRenew: autoRenew ?? this.autoRenew,
        neverExpired: neverExpired ?? this.neverExpired,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        typeId: typeId ?? this.typeId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        subcategoryId: subcategoryId ?? this.subcategoryId,
        plotNumber: plotNumber ?? this.plotNumber,
        streetNumber: streetNumber ?? this.streetNumber,
        sectorAndBlockName: sectorAndBlockName ?? this.sectorAndBlockName,
        assignedAgent: assignedAgent ?? this.assignedAgent,
        assignerId: assignerId ?? this.assignerId,
        isDeleted: isDeleted ?? this.isDeleted,
        likesOnProperties: likesOnProperties ?? this.likesOnProperties,
        city: city ?? this.city,
        country: country ?? this.country,
        state: state ?? this.state,
        category: category ?? this.category,
        type: type ?? this.type,
        currency: currency ?? this.currency,
        features: features ?? this.features,
        facilities: facilities ?? this.facilities,
      );

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
        likesOnProperties: json["likes_on_properties"] == null
            ? []
            : List<LikesOnProperty>.from(json["likes_on_properties"]!
                .map((x) => LikesOnProperty.fromJson(x))),
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
        "likes_on_properties": likesOnProperties == null
            ? []
            : List<dynamic>.from(likesOnProperties!.map((x) => x.toJson())),
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

  Category copyWith({
    int? id,
    String? name,
    String? description,
    String? status,
    String? order,
    String? isDefault,
    String? createdAt,
    String? updatedAt,
    String? parentId,
    String? parentclass,
  }) =>
      Category(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        status: status ?? this.status,
        order: order ?? this.order,
        isDefault: isDefault ?? this.isDefault,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        parentId: parentId ?? this.parentId,
        parentclass: parentclass ?? this.parentclass,
      );

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

  City copyWith({
    int? id,
    String? name,
    String? stateId,
    String? countryId,
    dynamic recordId,
    String? order,
    String? isFeatured,
    String? status,
    String? createdAt,
    String? updatedAt,
    String? slug,
  }) =>
      City(
        id: id ?? this.id,
        name: name ?? this.name,
        stateId: stateId ?? this.stateId,
        countryId: countryId ?? this.countryId,
        recordId: recordId ?? this.recordId,
        order: order ?? this.order,
        isFeatured: isFeatured ?? this.isFeatured,
        status: status ?? this.status,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        slug: slug ?? this.slug,
      );

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

  Currency copyWith({
    int? id,
    String? title,
    String? symbol,
    String? isPrefixSymbol,
    String? decimals,
    String? order,
    String? isDefault,
    String? exchangeRate,
    String? createdAt,
    String? updatedAt,
  }) =>
      Currency(
        id: id ?? this.id,
        title: title ?? this.title,
        symbol: symbol ?? this.symbol,
        isPrefixSymbol: isPrefixSymbol ?? this.isPrefixSymbol,
        decimals: decimals ?? this.decimals,
        order: order ?? this.order,
        isDefault: isDefault ?? this.isDefault,
        exchangeRate: exchangeRate ?? this.exchangeRate,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

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

  Feature copyWith({
    int? id,
    String? name,
    String? icon,
    String? status,
    Pivot? pivot,
  }) =>
      Feature(
        id: id ?? this.id,
        name: name ?? this.name,
        icon: icon ?? this.icon,
        status: status ?? this.status,
        pivot: pivot ?? this.pivot,
      );

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

  Pivot copyWith({
    String? propertyId,
    String? featureId,
  }) =>
      Pivot(
        propertyId: propertyId ?? this.propertyId,
        featureId: featureId ?? this.featureId,
      );

  factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
        propertyId: json["property_id"],
        featureId: json["feature_id"],
      );

  Map<String, dynamic> toJson() => {
        "property_id": propertyId,
        "feature_id": featureId,
      };
}

class ImagesClass {
  ImagesClass({
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

  ImagesClass copyWith({
    String? the1,
    String? the2,
    String? the3,
    String? the4,
    String? the5,
  }) =>
      ImagesClass(
        the1: the1 ?? this.the1,
        the2: the2 ?? this.the2,
        the3: the3 ?? this.the3,
        the4: the4 ?? this.the4,
        the5: the5 ?? this.the5,
      );

  factory ImagesClass.fromJson(Map<String, dynamic> json) => ImagesClass(
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

  LikesOnProperty copyWith({
    bool? isliked,
  }) =>
      LikesOnProperty(
        isliked: isliked ?? this.isliked,
      );

  factory LikesOnProperty.fromJson(Map<String, dynamic> json) =>
      LikesOnProperty(
        isliked: json["isliked"],
      );

  Map<String, dynamic> toJson() => {
        "isliked": isliked,
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

  Type copyWith({
    int? id,
    String? name,
    String? slug,
    String? order,
    String? code,
  }) =>
      Type(
        id: id ?? this.id,
        name: name ?? this.name,
        slug: slug ?? this.slug,
        order: order ?? this.order,
        code: code ?? this.code,
      );

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

class Link {
  Link({
    this.url,
    this.label,
    this.active,
  });

  String? url;
  String? label;
  bool? active;

  Link copyWith({
    String? url,
    String? label,
    bool? active,
  }) =>
      Link(
        url: url ?? this.url,
        label: label ?? this.label,
        active: active ?? this.active,
      );

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
