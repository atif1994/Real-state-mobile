// To parse this JSON data, do
//
//     final conversation = conversationFromJson(jsonString);

import 'dart:convert';

Conversation conversationFromJson(String str) =>
    Conversation.fromJson(json.decode(str));

String conversationToJson(Conversation data) => json.encode(data.toJson());

class Conversation {
  Conversation({
    this.error,
    this.data,
    this.message,
  });

  bool? error;
  List<Datum>? data;
  String? message;

  factory Conversation.fromJson(Map<String, dynamic> json) => Conversation(
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
    this.customer,
    this.agent,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.chats,
    this.sendercustomer,
    this.recieveragent,
  });

  int? id;
  String? customer;
  String? agent;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<Chat>? chats;
  Sendercustomer? sendercustomer;
  Recieveragent? recieveragent;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        customer: json["customer"],
        agent: json["agent"],
        status: json["status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        chats: json["chats"] == null
            ? []
            : List<Chat>.from(json["chats"]!.map((x) => Chat.fromJson(x))),
        sendercustomer: json["sendercustomer"] == null
            ? null
            : Sendercustomer.fromJson(json["sendercustomer"]),
        recieveragent: json["recieveragent"] == null
            ? null
            : Recieveragent.fromJson(json["recieveragent"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "customer": customer,
        "agent": agent,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "chats": chats == null
            ? []
            : List<dynamic>.from(chats!.map((x) => x.toJson())),
        "sendercustomer": sendercustomer?.toJson(),
        "recieveragent": recieveragent?.toJson(),
      };
}

class Chat {
  Chat({
    this.id,
    this.message,
    this.customer,
    this.agent,
    this.conversationId,
    this.status,
    this.image,
    this.senderId,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? message;
  String? customer;
  String? agent;
  String? conversationId;
  String? status;
  dynamic image;
  String? senderId;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Chat.fromJson(Map<String, dynamic> json) => Chat(
        id: json["id"],
        message: json["message"],
        customer: json["customer"],
        agent: json["agent"],
        conversationId: json["conversation_id"],
        status: json["status"],
        image: json["image"],
        senderId: json["sender_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "message": message,
        "customer": customer,
        "agent": agent,
        "conversation_id": conversationId,
        "status": status,
        "image": image,
        "sender_id": senderId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

class Recieveragent {
  Recieveragent({
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
  });

  int? id;
  String? email;
  dynamic emailVerifiedAt;
  String? mobileNo;
  dynamic profileImage;
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
  Permissions? permissions;
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

  factory Recieveragent.fromJson(Map<String, dynamic> json) => Recieveragent(
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
      };
}

class Permissions {
  Permissions({
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

  factory Permissions.fromJson(Map<String, dynamic> json) => Permissions(
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

class Sendercustomer {
  Sendercustomer({
    this.id,
    this.firstName,
    this.lastName,
    this.username,
    this.description,
    this.gender,
    this.email,
    this.avatarId,
    this.dob,
    this.phone,
    this.credits,
    this.confirmedAt,
    this.emailVerifyToken,
    this.isFeatured,
    this.createdAt,
    this.updatedAt,
    this.profileImage,
    this.addressId,
    this.roleId,
    this.deletedAt,
    this.activeStatus,
  });

  int? id;
  String? firstName;
  String? lastName;
  String? username;
  dynamic description;
  dynamic gender;
  String? email;
  String? avatarId;
  dynamic dob;
  String? phone;
  String? credits;
  dynamic confirmedAt;
  dynamic emailVerifyToken;
  String? isFeatured;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic profileImage;
  dynamic addressId;
  String? roleId;
  dynamic deletedAt;
  String? activeStatus;

  factory Sendercustomer.fromJson(Map<String, dynamic> json) => Sendercustomer(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        username: json["username"],
        description: json["description"],
        gender: json["gender"],
        email: json["email"],
        avatarId: json["avatar_id"],
        dob: json["dob"],
        phone: json["phone"],
        credits: json["credits"],
        confirmedAt: json["confirmed_at"],
        emailVerifyToken: json["email_verify_token"],
        isFeatured: json["is_featured"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        profileImage: json["profile_image"],
        addressId: json["address_id"],
        roleId: json["role_id"],
        deletedAt: json["deleted_at"],
        activeStatus: json["active_status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "username": username,
        "description": description,
        "gender": gender,
        "email": email,
        "avatar_id": avatarId,
        "dob": dob,
        "phone": phone,
        "credits": credits,
        "confirmed_at": confirmedAt,
        "email_verify_token": emailVerifyToken,
        "is_featured": isFeatured,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "profile_image": profileImage,
        "address_id": addressId,
        "role_id": roleId,
        "deleted_at": deletedAt,
        "active_status": activeStatus,
      };
}
