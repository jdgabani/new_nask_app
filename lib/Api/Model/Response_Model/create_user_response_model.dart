// To parse this JSON data, do
//
//     final createUserResponseModel = createUserResponseModelFromJson(jsonString);

import 'dart:convert';

CreateUserResponseModel createUserResponseModelFromJson(String str) =>
    CreateUserResponseModel.fromJson(json.decode(str));

String createUserResponseModelToJson(CreateUserResponseModel data) =>
    json.encode(data.toJson());

class CreateUserResponseModel {
  int? status;
  String? message;
  int? count;
  List<Response>? response;

  CreateUserResponseModel({
    this.status,
    this.message,
    this.count,
    this.response,
  });

  factory CreateUserResponseModel.fromJson(Map<String, dynamic> json) =>
      CreateUserResponseModel(
        status: json["status"],
        message: json["message"],
        count: json["count"],
        response: json["response"] == null
            ? []
            : List<Response>.from(
                json["response"]!.map((x) => Response.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "count": count,
        "response": response == null
            ? []
            : List<dynamic>.from(response!.map((x) => x.toJson())),
      };
}

class Response {
  String? email;
  String? alreadyExists;

  Response({
    this.email,
    this.alreadyExists,
  });

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        email: json["email"],
        alreadyExists: json["already_exists"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "already_exists": alreadyExists,
      };
}
