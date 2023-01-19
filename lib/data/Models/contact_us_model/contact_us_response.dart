// To parse this JSON data, do
//
//     final contactModel = contactModelFromJson(jsonString);

import 'dart:convert';

ContactModel contactModelFromJson(String str) =>
    ContactModel.fromJson(json.decode(str));

String contactModelToJson(ContactModel data) => json.encode(data.toJson());

class ContactModel {
  ContactModel({
    this.name,
    this.email,
    this.subject,
    this.phone,
    this.content,
  });

  String? name;
  String? email;
  String? subject;
  String? phone;
  String? content;

  factory ContactModel.fromJson(Map<String, dynamic> json) => ContactModel(
        name: json["name"],
        email: json["email"],
        subject: json["subject"],
        phone: json["phone"],
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "subject": subject,
        "phone": phone,
        "content": content,
      };
}
