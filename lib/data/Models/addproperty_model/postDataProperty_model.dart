// To parse this JSON data, do
//
//     final postDataProperty = postDataPropertyFromJson(jsonString);

import 'dart:convert';

PostDataProperty postDataPropertyFromJson(String str) => PostDataProperty.fromJson(json.decode(str));

String postDataPropertyToJson(PostDataProperty data) => json.encode(data.toJson());

class PostDataProperty {
    PostDataProperty({
        this.plateform,
        this.assignerId,
        this.name,
        this.description,
        this.content,
        this.sectorAndBlockName,
        this.streetNumber,
        this.plotNumber,
        this.location,
        this.cityId,
        this.stateId,
        this.price,
        this.currencyId,
        this.square,
        this.numberFloor,
        this.numberBathroom,
        this.numberBedroom,
        this.categoryId,
        this.typeId,
        this.features,
        this.facilities,
    });

    String? plateform;
    int? assignerId;
    String? name;
    String? description;
    String? content;
    String? sectorAndBlockName;
    String? streetNumber;
    String? plotNumber;
    String? location;
    String? cityId;
    int? stateId;
    String? price;
    int? currencyId;
    String? square;
    String? numberFloor;
    int? numberBathroom;
    int? numberBedroom;
    int? categoryId;
    int? typeId;
    List<Feature>? features;
    List<Facility>? facilities;

    factory PostDataProperty.fromJson(Map<String, dynamic> json) => PostDataProperty(
        plateform: json["plateform"],
        assignerId: json["assigner_id"],
        name: json["name"],
        description: json["description"],
        content: json["content"],
        sectorAndBlockName: json["sector_and_block_name"],
        streetNumber: json["street_number"],
        plotNumber: json["plot_number"],
        location: json["location"],
        cityId: json["city_id"],
        stateId: json["state_id"],
        price: json["price"],
        currencyId: json["currency_id"],
        square: json["square"],
        numberFloor: json["number_floor"],
        numberBathroom: json["number_bathroom"],
        numberBedroom: json["number_bedroom"],
        categoryId: json["category_id"],
        typeId: json["type_id"],
        features: json["features"] == null ? [] : List<Feature>.from(json["features"]!.map((x) => Feature.fromJson(x))),
        facilities: json["facilities"] == null ? [] : List<Facility>.from(json["facilities"]!.map((x) => Facility.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "plateform": plateform,
        "assigner_id": assignerId,
        "name": name,
        "description": description,
        "content": content,
        "sector_and_block_name": sectorAndBlockName,
        "street_number": streetNumber,
        "plot_number": plotNumber,
        "location": location,
        "city_id": cityId,
        "state_id": stateId,
        "price": price,
        "currency_id": currencyId,
        "square": square,
        "number_floor": numberFloor,
        "number_bathroom": numberBathroom,
        "number_bedroom": numberBedroom,
        "category_id": categoryId,
        "type_id": typeId,
        "features": features == null ? [] : List<dynamic>.from(features!.map((x) => x.toJson())),
        "facilities": facilities == null ? [] : List<dynamic>.from(facilities!.map((x) => x.toJson())),
    };
}

class Facility {
    Facility({
        this.id,
        this.distance,
    });

    int? id;
    int? distance;

    factory Facility.fromJson(Map<String, dynamic> json) => Facility(
        id: json["id"],
        distance: json["distance"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "distance": distance,
    };
}

class Feature {
    Feature({
        this.featureId,
    });

    String? featureId;

    factory Feature.fromJson(Map<String, dynamic> json) => Feature(
        featureId: json["feature_id"],
    );

    Map<String, dynamic> toJson() => {
        "feature_id": featureId,
    };
}
