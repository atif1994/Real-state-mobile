class Profile_Model {
  bool? success;
  String? message;
  Data? data;

  Profile_Model({this.success, this.message, this.data});

  Profile_Model.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? firstName;
  String? lastName;
  String? username;
  Null? description;
  Null? gender;
  String? email;
  Null? avatarId;
  Null? dob;
  String? phone;
  int? credits;
  Null? confirmedAt;
  Null? emailVerifyToken;
  String? isFeatured;
  String? createdAt;
  String? updatedAt;
  String? profileImage;
  Null? addressId;
  Null? roleId;
  Null? deletedAt;
  String? activeStatus;

  Data(
      {this.id,
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
      this.activeStatus});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    username = json['username'];
    description = json['description'];
    gender = json['gender'];
    email = json['email'];
    avatarId = json['avatar_id'];
    dob = json['dob'];
    phone = json['phone'];
    credits = json['credits'];
    confirmedAt = json['confirmed_at'];
    emailVerifyToken = json['email_verify_token'];
    isFeatured = json['is_featured'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    profileImage = json['profile_image'];
    addressId = json['address_id'];
    roleId = json['role_id'];
    deletedAt = json['deleted_at'];
    activeStatus = json['active_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['username'] = this.username;
    data['description'] = this.description;
    data['gender'] = this.gender;
    data['email'] = this.email;
    data['avatar_id'] = this.avatarId;
    data['dob'] = this.dob;
    data['phone'] = this.phone;
    data['credits'] = this.credits;
    data['confirmed_at'] = this.confirmedAt;
    data['email_verify_token'] = this.emailVerifyToken;
    data['is_featured'] = this.isFeatured;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['profile_image'] = this.profileImage;
    data['address_id'] = this.addressId;
    data['role_id'] = this.roleId;
    data['deleted_at'] = this.deletedAt;
    data['active_status'] = this.activeStatus;
    return data;
  }
}