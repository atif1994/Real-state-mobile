// To parse this JSON data, do
//
//     final signupModel = signupModelFromJson(jsonString);

import 'dart:convert';

SignupModel signupModelFromJson(String str) =>
    SignupModel.fromJson(json.decode(str));

String signupModelToJson(SignupModel data) => json.encode(data.toJson());

class SignupModel {
  SignupModel({
    this.success,
    this.errorCode,
    this.errorMessage,
  });

  bool? success;
  String? errorCode;
  List<String>? errorMessage;

  factory SignupModel.fromJson(Map<String, dynamic> json) => SignupModel(
        success: json["success"],
        errorCode: json["error code"],
        errorMessage: json["error_message"] == null
            ? []
            : List<String>.from(json["error_message"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "error code": errorCode,
        "error_message": errorMessage == null
            ? []
            : List<dynamic>.from(errorMessage!.map((x) => x)),
      };
}
