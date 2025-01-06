
import 'dart:convert';

VisitorDataModel visitorDataModelFromJson(String str) => VisitorDataModel.fromJson(json.decode(str));

String visitorDataModelToJson(VisitorDataModel data) => json.encode(data.toJson());

class VisitorDataModel {
  String? docId;
  String? name;
  String? email;
  String? number;
  String? option;
  String? createdAt;
  String? updatedAt;

  VisitorDataModel({
    this.docId,
    this.name,
    this.email,
    this.number,
    this.option,
    this.createdAt,
    this.updatedAt,
  });

  factory VisitorDataModel.fromJson(Map<String, dynamic> json) => VisitorDataModel(
    docId: json["docId"],
    name: json["name"],
    email: json["email"],
    number: json["number"],
    option: json["option"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "docId": docId,
    "name": name,
    "email": email,
    "number": number,
    "option": option,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}
