// To parse this JSON data, do
//
//     final propertyById = propertyByIdFromJson(jsonString);

import 'dart:convert';

PropertyById propertyByIdFromJson(String str) => PropertyById.fromJson(json.decode(str));

String propertyByIdToJson(PropertyById data) => json.encode(data.toJson());

class PropertyById {
    PropertyById({
        this.error,
        this.data,
        this.message,
    });

    bool? error;
    Data? data;
    dynamic message;

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
    Data({
        this.name,
        this.description,
        this.location,
        this.images,
        this.numberBedroom,
        this.numberBathroom,
        this.square,
        this.numberFloor,
        this.price,
        this.sectorAndBlockName,
        this.streetNumber,
        this.plotNumber,
        this.typeId,
        this.categoryId,
        this.stateId,
        this.cityId,
        this.currencyId,
        this.city,
        this.country,
        this.state,
        this.category,
        this.type,
        this.currency,
        this.features,
        this.facilities,
    });

    String? name;
    String? description;
    String? location;
    List<String>? images;
    String? numberBedroom;
    String? numberBathroom;
    String? square;
    String? numberFloor;
    String? price;
    String? sectorAndBlockName;
    String? streetNumber;
    String? plotNumber;
    String? typeId;
    String? categoryId;
    dynamic stateId;
    String? cityId;
    String? currencyId;
    City? city;
    List<dynamic>? country;
    List<dynamic>? state;
    Category? category;
    Type? type;
    Currency? currency;
    List<dynamic>? features;
    List<dynamic>? facilities;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        name: json["name"],
        description: json["description"],
        location: json["location"],
        images: json["images"] == null ? [] : List<String>.from(json["images"]!.map((x) => x)),
        numberBedroom: json["number_bedroom"],
        numberBathroom: json["number_bathroom"],
        square: json["square"],
        numberFloor: json["number_floor"],
        price: json["price"],
        sectorAndBlockName: json["sector_and_block_name"],
        streetNumber: json["street_number"],
        plotNumber: json["plot_number"],
        typeId: json["type_id"],
        categoryId: json["category_id"],
        stateId: json["state_id"],
        cityId: json["city_id"],
        currencyId: json["currency_id"],
        city: json["city"] == null ? null : City.fromJson(json["city"]),
        country: json["country"] == null ? [] : List<dynamic>.from(json["country"]!.map((x) => x)),
        state: json["state"] == null ? [] : List<dynamic>.from(json["state"]!.map((x) => x)),
        category: json["category"] == null ? null : Category.fromJson(json["category"]),
        type: json["type"] == null ? null : Type.fromJson(json["type"]),
        currency: json["currency"] == null ? null : Currency.fromJson(json["currency"]),
        features: json["features"] == null ? [] : List<dynamic>.from(json["features"]!.map((x) => x)),
        facilities: json["facilities"] == null ? [] : List<dynamic>.from(json["facilities"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "location": location,
        "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
        "number_bedroom": numberBedroom,
        "number_bathroom": numberBathroom,
        "square": square,
        "number_floor": numberFloor,
        "price": price,
        "sector_and_block_name": sectorAndBlockName,
        "street_number": streetNumber,
        "plot_number": plotNumber,
        "type_id": typeId,
        "category_id": categoryId,
        "state_id": stateId,
        "city_id": cityId,
        "currency_id": currencyId,
        "city": city?.toJson(),
        "country": country == null ? [] : List<dynamic>.from(country!.map((x) => x)),
        "state": state == null ? [] : List<dynamic>.from(state!.map((x) => x)),
        "category": category?.toJson(),
        "type": type?.toJson(),
        "currency": currency?.toJson(),
        "features": features == null ? [] : List<dynamic>.from(features!.map((x) => x)),
        "facilities": facilities == null ? [] : List<dynamic>.from(facilities!.map((x) => x)),
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
