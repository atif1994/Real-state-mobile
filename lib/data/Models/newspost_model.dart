// To parse this JSON data, do
//
//     final newspost = newspostFromJson(jsonString);

import 'dart:convert';

Newspost? newspostFromJson(String str) => Newspost.fromJson(json.decode(str));

String newspostToJson(Newspost? data) => json.encode(data!.toJson());

class Newspost {
  Newspost({
    this.data,
    this.links,
    this.meta,
    this.error,
    this.message,
  });

  List<Datum?>? data;
  Links? links;
  Meta? meta;
  bool? error;
  dynamic message;

  factory Newspost.fromJson(Map<String, dynamic> json) => Newspost(
        data: json["data"] == null
            ? []
            : List<Datum?>.from(json["data"]!.map((x) => Datum.fromJson(x))),
        links: Links.fromJson(json["links"]),
        meta: Meta.fromJson(json["meta"]),
        error: json["error"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x!.toJson())),
        "links": links!.toJson(),
        "meta": meta!.toJson(),
        "error": error,
        "message": message,
      };
}

class Datum {
  Datum({
    this.id,
    this.name,
    this.slug,
    this.description,
    this.image,
    this.categories,
    this.tags,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? name;
  String? slug;
  String? description;
  String? image;
  List<Category?>? categories;
  List<dynamic>? tags;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        description: json["description"],
        image: json["image"],
        categories: json["categories"] == null
            ? []
            : List<Category?>.from(
                json["categories"]!.map((x) => Category.fromJson(x))),
        tags: json["tags"] == null
            ? []
            : List<dynamic>.from(json["tags"]!.map((x) => x)),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "description": description,
        "image": image,
        "categories": categories == null
            ? []
            : List<dynamic>.from(categories!.map((x) => x!.toJson())),
        "tags": tags == null ? [] : List<dynamic>.from(tags!.map((x) => x)),
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

class Category {
  Category({
    this.id,
    this.name,
    this.slug,
    this.description,
  });

  int? id;
  Name? name;
  String? slug;
  dynamic description;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: nameValues.map[json["name"]],
        slug: json["slug"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": nameValues.reverse![name],
        "slug": slug,
        "description": description,
      };
}

enum Name { LATEST_NEWS, HOUSE_ARCHITECTURE, HOUSE_DESIGN, BUILDING_MATERIALS }

final nameValues = EnumValues({
  "Building materials": Name.BUILDING_MATERIALS,
  "House architecture": Name.HOUSE_ARCHITECTURE,
  "House design": Name.HOUSE_DESIGN,
  "Latest news": Name.LATEST_NEWS
});

class Links {
  Links({
    this.first,
    this.last,
    this.prev,
    this.next,
  });

  String? first;
  String? last;
  dynamic prev;
  String? next;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        first: json["first"],
        last: json["last"],
        prev: json["prev"],
        next: json["next"],
      );

  Map<String, dynamic> toJson() => {
        "first": first,
        "last": last,
        "prev": prev,
        "next": next,
      };
}

class Meta {
  Meta({
    this.currentPage,
    this.from,
    this.lastPage,
    this.links,
    this.path,
    this.perPage,
    this.to,
    this.total,
  });

  int? currentPage;
  int? from;
  int? lastPage;
  List<Link?>? links;
  String? path;
  int? perPage;
  int? to;
  int? total;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        currentPage: json["current_page"],
        from: json["from"],
        lastPage: json["last_page"],
        links: json["links"] == null
            ? []
            : List<Link?>.from(json["links"]!.map((x) => Link.fromJson(x))),
        path: json["path"],
        perPage: json["per_page"],
        to: json["to"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "from": from,
        "last_page": lastPage,
        "links": links == null
            ? []
            : List<dynamic>.from(links!.map((x) => x!.toJson())),
        "path": path,
        "per_page": perPage,
        "to": to,
        "total": total,
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
