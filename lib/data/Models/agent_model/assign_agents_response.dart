// To parse this JSON data, do
//
//     final assignAgentResponse = assignAgentResponseFromJson(jsonString);

import 'dart:convert';

AssignAgentResponse assignAgentResponseFromJson(String str) =>
    AssignAgentResponse.fromJson(json.decode(str));

String assignAgentResponseToJson(AssignAgentResponse data) =>
    json.encode(data.toJson());

class AssignAgentResponse {
  AssignAgentResponse({
    this.error,
    this.data,
    this.message,
  });

  bool? error;
  String? data;
  String? message;

  factory AssignAgentResponse.fromJson(Map<String, dynamic> json) =>
      AssignAgentResponse(
        error: json["error"],
        data: json["data"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "data": data,
        "message": message,
      };
}
