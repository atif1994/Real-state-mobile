// To parse this JSON data, do
//
//     final dealerpage = dealerpageFromJson(jsonString);

import 'dart:convert';

Dealerpage dealerpageFromJson(String str) =>
    Dealerpage.fromJson(json.decode(str));

String dealerpageToJson(Dealerpage data) => json.encode(data.toJson());

class Dealerpage {
  bool? error;
  List<Datum>? data;
  String? message;

  Dealerpage({
    this.error,
    this.data,
    this.message,
  });

  factory Dealerpage.fromJson(Map<String, dynamic> json) => Dealerpage(
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
  int? id;
  String? userId;
  String? imagePath;
  String? adTitle;
  String? description;
  String? activeStatus;
  DateTime? deletedAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? location;
  String? tags;
  User? user;

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
    this.user,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        userId: json["user_id"],
        imagePath: json["image_path"],
        adTitle: json["ad_title"],
        description: json["description"],
        activeStatus: json["active_status"],
        deletedAt: json["deleted_at"] == null
            ? null
            : DateTime.parse(json["deleted_at"]),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        location: json["location"],
        tags: json["tags"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "image_path": imagePath,
        "ad_title": adTitle,
        "description": description,
        "active_status": activeStatus,
        "deleted_at": deletedAt?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "location": location,
        "tags": tags,
        "user": user?.toJson(),
      };
}

class User {
  int? id;
  String? email;
  dynamic emailVerifiedAt;
  String? mobileNo;
  String? profileImage;
  DateTime? dob;
  String? activeStatus;
  dynamic deletedAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? firstName;
  String? lastName;
  String? username;
  dynamic avatarId;
  String? superUser;
  String? manageSupers;
  Permissions? permissions;
  DateTime? lastLogin;
  dynamic stripeId;
  dynamic pmType;
  dynamic pmLastFour;
  dynamic trialEndsAt;
  String? companyId;
  String? addressId;
  String? roleId;
  dynamic deactivateMessage;
  dynamic cityId;
  dynamic mobileVerificationCode;
  String? referralCode;
  dynamic referrerId;
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
        dob: json["dob"] == null ? null : DateTime.parse(json["dob"]),
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
        permissions: json["permissions"] == null
            ? null
            : Permissions.fromJson(json["permissions"]),
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
        "dob":
            "${dob!.year.toString().padLeft(4, '0')}-${dob!.month.toString().padLeft(2, '0')}-${dob!.day.toString().padLeft(2, '0')}",
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
        "permissions": permissions?.toJson(),
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

class Permissions {
  bool? agentIndex;
  bool? agentEdit;
  bool? agentDestroy;
  bool? agentCreate;
  bool? analyticsGeneral;
  bool? analyticsPage;
  bool? analyticsBrowser;
  bool? analyticsReferrer;
  bool? pluginsBlog;
  bool? postsIndex;
  bool? postsCreate;
  bool? postsEdit;
  bool? postsDestroy;
  bool? categoriesIndex;
  bool? categoriesCreate;
  bool? categoriesEdit;
  bool? categoriesDestroy;
  bool? tagsIndex;
  bool? tagsCreate;
  bool? tagsEdit;
  bool? tagsDestroy;
  bool? propertyCategoryIndex;
  bool? propertyCategoryCreate;
  bool? propertyCategoryEdit;
  bool? propertyCategoryDestroy;
  bool? companyIndex;
  bool? companyEdit;
  bool? companyDestroy;
  bool? companyCreate;
  bool? consultIndex;
  bool? consultCreate;
  bool? consultEdit;
  bool? consultDestroy;
  bool? consultsIndex;
  bool? consultsEdit;
  bool? consultsDestroy;
  bool? facilityIndex;
  bool? facilityCreate;
  bool? facilityEdit;
  bool? facilityDestroy;
  bool? mediaIndex;
  bool? filesIndex;
  bool? filesCreate;
  bool? filesEdit;
  bool? filesTrash;
  bool? filesDestroy;
  bool? foldersIndex;
  bool? foldersCreate;
  bool? foldersEdit;
  bool? foldersTrash;
  bool? foldersDestroy;
  bool? propertyIndex;
  bool? propertyCreate;
  bool? propertyEdit;
  bool? propertyDestroy;
  bool? propertyFeatureIndex;
  bool? propertyFeatureCreate;
  bool? propertyFeatureEdit;
  bool? propertyFeatureDestroy;
  bool? propertyTypeIndex;
  bool? propertyTypeCreate;
  bool? propertyTypeEdit;
  bool? propertyTypeDestroy;
  String? superuser;
  String? manageSupers;

  Permissions({
    this.agentIndex,
    this.agentEdit,
    this.agentDestroy,
    this.agentCreate,
    this.analyticsGeneral,
    this.analyticsPage,
    this.analyticsBrowser,
    this.analyticsReferrer,
    this.pluginsBlog,
    this.postsIndex,
    this.postsCreate,
    this.postsEdit,
    this.postsDestroy,
    this.categoriesIndex,
    this.categoriesCreate,
    this.categoriesEdit,
    this.categoriesDestroy,
    this.tagsIndex,
    this.tagsCreate,
    this.tagsEdit,
    this.tagsDestroy,
    this.propertyCategoryIndex,
    this.propertyCategoryCreate,
    this.propertyCategoryEdit,
    this.propertyCategoryDestroy,
    this.companyIndex,
    this.companyEdit,
    this.companyDestroy,
    this.companyCreate,
    this.consultIndex,
    this.consultCreate,
    this.consultEdit,
    this.consultDestroy,
    this.consultsIndex,
    this.consultsEdit,
    this.consultsDestroy,
    this.facilityIndex,
    this.facilityCreate,
    this.facilityEdit,
    this.facilityDestroy,
    this.mediaIndex,
    this.filesIndex,
    this.filesCreate,
    this.filesEdit,
    this.filesTrash,
    this.filesDestroy,
    this.foldersIndex,
    this.foldersCreate,
    this.foldersEdit,
    this.foldersTrash,
    this.foldersDestroy,
    this.propertyIndex,
    this.propertyCreate,
    this.propertyEdit,
    this.propertyDestroy,
    this.propertyFeatureIndex,
    this.propertyFeatureCreate,
    this.propertyFeatureEdit,
    this.propertyFeatureDestroy,
    this.propertyTypeIndex,
    this.propertyTypeCreate,
    this.propertyTypeEdit,
    this.propertyTypeDestroy,
    this.superuser,
    this.manageSupers,
  });

  factory Permissions.fromJson(Map<String, dynamic> json) => Permissions(
        agentIndex: json["Agent.index"],
        agentEdit: json["Agent.edit"],
        agentDestroy: json["Agent.destroy"],
        agentCreate: json["Agent.create"],
        analyticsGeneral: json["analytics.general"],
        analyticsPage: json["analytics.page"],
        analyticsBrowser: json["analytics.browser"],
        analyticsReferrer: json["analytics.referrer"],
        pluginsBlog: json["plugins.blog"],
        postsIndex: json["posts.index"],
        postsCreate: json["posts.create"],
        postsEdit: json["posts.edit"],
        postsDestroy: json["posts.destroy"],
        categoriesIndex: json["categories.index"],
        categoriesCreate: json["categories.create"],
        categoriesEdit: json["categories.edit"],
        categoriesDestroy: json["categories.destroy"],
        tagsIndex: json["tags.index"],
        tagsCreate: json["tags.create"],
        tagsEdit: json["tags.edit"],
        tagsDestroy: json["tags.destroy"],
        propertyCategoryIndex: json["property_category.index"],
        propertyCategoryCreate: json["property_category.create"],
        propertyCategoryEdit: json["property_category.edit"],
        propertyCategoryDestroy: json["property_category.destroy"],
        companyIndex: json["company.index"],
        companyEdit: json["company.edit"],
        companyDestroy: json["company.destroy"],
        companyCreate: json["company.create"],
        consultIndex: json["consult.index"],
        consultCreate: json["consult.create"],
        consultEdit: json["consult.edit"],
        consultDestroy: json["consult.destroy"],
        consultsIndex: json["consults.index"],
        consultsEdit: json["consults.edit"],
        consultsDestroy: json["consults.destroy"],
        facilityIndex: json["facility.index"],
        facilityCreate: json["facility.create"],
        facilityEdit: json["facility.edit"],
        facilityDestroy: json["facility.destroy"],
        mediaIndex: json["media.index"],
        filesIndex: json["files.index"],
        filesCreate: json["files.create"],
        filesEdit: json["files.edit"],
        filesTrash: json["files.trash"],
        filesDestroy: json["files.destroy"],
        foldersIndex: json["folders.index"],
        foldersCreate: json["folders.create"],
        foldersEdit: json["folders.edit"],
        foldersTrash: json["folders.trash"],
        foldersDestroy: json["folders.destroy"],
        propertyIndex: json["property.index"],
        propertyCreate: json["property.create"],
        propertyEdit: json["property.edit"],
        propertyDestroy: json["property.destroy"],
        propertyFeatureIndex: json["property_feature.index"],
        propertyFeatureCreate: json["property_feature.create"],
        propertyFeatureEdit: json["property_feature.edit"],
        propertyFeatureDestroy: json["property_feature.destroy"],
        propertyTypeIndex: json["property_type.index"],
        propertyTypeCreate: json["property_type.create"],
        propertyTypeEdit: json["property_type.edit"],
        propertyTypeDestroy: json["property_type.destroy"],
        superuser: json["superuser"],
        manageSupers: json["manage_supers"],
      );

  Map<String, dynamic> toJson() => {
        "Agent.index": agentIndex,
        "Agent.edit": agentEdit,
        "Agent.destroy": agentDestroy,
        "Agent.create": agentCreate,
        "analytics.general": analyticsGeneral,
        "analytics.page": analyticsPage,
        "analytics.browser": analyticsBrowser,
        "analytics.referrer": analyticsReferrer,
        "plugins.blog": pluginsBlog,
        "posts.index": postsIndex,
        "posts.create": postsCreate,
        "posts.edit": postsEdit,
        "posts.destroy": postsDestroy,
        "categories.index": categoriesIndex,
        "categories.create": categoriesCreate,
        "categories.edit": categoriesEdit,
        "categories.destroy": categoriesDestroy,
        "tags.index": tagsIndex,
        "tags.create": tagsCreate,
        "tags.edit": tagsEdit,
        "tags.destroy": tagsDestroy,
        "property_category.index": propertyCategoryIndex,
        "property_category.create": propertyCategoryCreate,
        "property_category.edit": propertyCategoryEdit,
        "property_category.destroy": propertyCategoryDestroy,
        "company.index": companyIndex,
        "company.edit": companyEdit,
        "company.destroy": companyDestroy,
        "company.create": companyCreate,
        "consult.index": consultIndex,
        "consult.create": consultCreate,
        "consult.edit": consultEdit,
        "consult.destroy": consultDestroy,
        "consults.index": consultsIndex,
        "consults.edit": consultsEdit,
        "consults.destroy": consultsDestroy,
        "facility.index": facilityIndex,
        "facility.create": facilityCreate,
        "facility.edit": facilityEdit,
        "facility.destroy": facilityDestroy,
        "media.index": mediaIndex,
        "files.index": filesIndex,
        "files.create": filesCreate,
        "files.edit": filesEdit,
        "files.trash": filesTrash,
        "files.destroy": filesDestroy,
        "folders.index": foldersIndex,
        "folders.create": foldersCreate,
        "folders.edit": foldersEdit,
        "folders.trash": foldersTrash,
        "folders.destroy": foldersDestroy,
        "property.index": propertyIndex,
        "property.create": propertyCreate,
        "property.edit": propertyEdit,
        "property.destroy": propertyDestroy,
        "property_feature.index": propertyFeatureIndex,
        "property_feature.create": propertyFeatureCreate,
        "property_feature.edit": propertyFeatureEdit,
        "property_feature.destroy": propertyFeatureDestroy,
        "property_type.index": propertyTypeIndex,
        "property_type.create": propertyTypeCreate,
        "property_type.edit": propertyTypeEdit,
        "property_type.destroy": propertyTypeDestroy,
        "superuser": superuser,
        "manage_supers": manageSupers,
      };
}
