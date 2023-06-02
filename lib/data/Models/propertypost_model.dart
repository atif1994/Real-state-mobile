// To parse this JSON data, do
//
//     final propertypost = propertypostFromJson(jsonString);

import 'dart:convert';

Propertypost propertypostFromJson(String str) =>
    Propertypost.fromJson(json.decode(str));

String propertypostToJson(Propertypost data) => json.encode(data.toJson());

class Propertypost {
  bool? success;
  String? message;
  List<Likelist>? likelist;
  int? isliked;
  int? likeOcunt;
  bool? notdeleted;
  Data? data;

  Propertypost({
    this.success,
    this.message,
    this.likelist,
    this.isliked,
    this.likeOcunt,
    this.notdeleted,
    this.data,
  });

  factory Propertypost.fromJson(Map<String, dynamic> json) => Propertypost(
        success: json["success"],
        message: json["message"],
        likelist: json["likelist"] == null
            ? []
            : List<Likelist>.from(
                json["likelist"]!.map((x) => Likelist.fromJson(x))),
        isliked: json["isliked"],
        likeOcunt: json["like_ocunt"],
        notdeleted: json["notdeleted"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "likelist": likelist == null
            ? []
            : List<dynamic>.from(likelist!.map((x) => x.toJson())),
        "isliked": isliked,
        "like_ocunt": likeOcunt,
        "notdeleted": notdeleted,
        "data": data?.toJson(),
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
  dynamic nextPageUrl;
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
  int? id;
  String? userId;
  String? imagePath;
  String? adTitle;
  String? description;
  String? activeStatus;
  String? deletedAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? location;
  String? tags;
  int? isLiked;
  User? user;
  List<LikesOnProperty>? likesOnProperties;

  Datum({
    this.id,
    this.userId,
    this.imagePath,
    this.adTitle,
    this.description,
    this.activeStatus,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.location,
    this.tags,
    this.isLiked,
    this.user,
    this.likesOnProperties,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        userId: json["user_id"],
        imagePath: json["image_path"],
        adTitle: json["ad_title"],
        description: json["description"],
        activeStatus: json["active_status"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        location: json["location"],
        tags: json["tags"],
        isLiked: json["is_liked"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        likesOnProperties: json["likes_on_properties"] == null
            ? []
            : List<LikesOnProperty>.from(json["likes_on_properties"]!
                .map((x) => LikesOnProperty.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "image_path": imagePath,
        "ad_title": adTitle,
        "description": description,
        "active_status": activeStatus,
        "deleted_at": deletedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "location": location,
        "tags": tags,
        "is_liked": isLiked,
        "user": user?.toJson(),
        "likes_on_properties": likesOnProperties == null
            ? []
            : List<dynamic>.from(likesOnProperties!.map((x) => x.toJson())),
      };
}

class LikesOnProperty {
  bool? isliked;

  LikesOnProperty({
    this.isliked,
  });

  factory LikesOnProperty.fromJson(Map<String, dynamic> json) =>
      LikesOnProperty(
        isliked: json["isliked"],
      );

  Map<String, dynamic> toJson() => {
        "isliked": isliked,
      };
}

class User {
  int? id;
  String? email;
  dynamic emailVerifiedAt;
  String? mobileNo;
  String? profileImage;
  dynamic dob;
  String? activeStatus;
  dynamic deletedAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? firstName;
  String? lastName;
  String? username;
  String? avatarId;
  String? superUser;
  String? manageSupers;
  dynamic permissions;
  DateTime? lastLogin;
  dynamic stripeId;
  dynamic pmType;
  dynamic pmLastFour;
  dynamic trialEndsAt;
  String? companyId;
  String? addressId;
  String? roleId;
  String? deactivateMessage;
  String? cityId;
  dynamic mobileVerificationCode;
  String? referralCode;
  String? referrerId;
  String? referalScore;

  User({
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

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        mobileNo: json["mobile_no"],
        profileImage: json["profile_image"],
        dob: json["dob"],
        activeStatus: json["active_status"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        firstName: json["first_name"],
        lastName: json["last_name"],
        username: json["username"],
        avatarId: json["avatar_id"],
        superUser: json["super_user"],
        manageSupers: json["manage_supers"],
        permissions: json["permissions"],
        lastLogin: json["last_login"] == null
            ? null
            : DateTime.parse(json["last_login"]),
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
        "dob": dob,
        "active_status": activeStatus,
        "deleted_at": deletedAt,
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

class PermissionsClass {
  bool? consultIndex;
  bool? consultCreate;
  bool? consultEdit;
  bool? consultsIndex;
  bool? consultsEdit;
  bool? mediaIndex;
  bool? filesIndex;
  bool? filesCreate;
  bool? propertyIndex;
  bool? propertyCreate;
  bool? propertyEdit;
  bool? propertyDestroy;
  bool? propertyFeatureIndex;
  bool? propertyFeatureCreate;
  bool? propertyFeatureEdit;
  String? superuser;
  String? manageSupers;

  PermissionsClass({
    this.consultIndex,
    this.consultCreate,
    this.consultEdit,
    this.consultsIndex,
    this.consultsEdit,
    this.mediaIndex,
    this.filesIndex,
    this.filesCreate,
    this.propertyIndex,
    this.propertyCreate,
    this.propertyEdit,
    this.propertyDestroy,
    this.propertyFeatureIndex,
    this.propertyFeatureCreate,
    this.propertyFeatureEdit,
    this.superuser,
    this.manageSupers,
  });

  factory PermissionsClass.fromJson(Map<String, dynamic> json) =>
      PermissionsClass(
        consultIndex: json["consult.index"],
        consultCreate: json["consult.create"],
        consultEdit: json["consult.edit"],
        consultsIndex: json["consults.index"],
        consultsEdit: json["consults.edit"],
        mediaIndex: json["media.index"],
        filesIndex: json["files.index"],
        filesCreate: json["files.create"],
        propertyIndex: json["property.index"],
        propertyCreate: json["property.create"],
        propertyEdit: json["property.edit"],
        propertyDestroy: json["property.destroy"],
        propertyFeatureIndex: json["property_feature.index"],
        propertyFeatureCreate: json["property_feature.create"],
        propertyFeatureEdit: json["property_feature.edit"],
        superuser: json["superuser"],
        manageSupers: json["manage_supers"],
      );

  Map<String, dynamic> toJson() => {
        "consult.index": consultIndex,
        "consult.create": consultCreate,
        "consult.edit": consultEdit,
        "consults.index": consultsIndex,
        "consults.edit": consultsEdit,
        "media.index": mediaIndex,
        "files.index": filesIndex,
        "files.create": filesCreate,
        "property.index": propertyIndex,
        "property.create": propertyCreate,
        "property.edit": propertyEdit,
        "property.destroy": propertyDestroy,
        "property_feature.index": propertyFeatureIndex,
        "property_feature.create": propertyFeatureCreate,
        "property_feature.edit": propertyFeatureEdit,
        "superuser": superuser,
        "manage_supers": manageSupers,
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

class Likelist {
  int? id;

  Likelist({
    this.id,
  });

  factory Likelist.fromJson(Map<String, dynamic> json) => Likelist(
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
      };
}
