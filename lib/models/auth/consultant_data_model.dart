
import 'dart:convert';

ConsultantDataModel consultantDataModelFromJson(String str) => ConsultantDataModel.fromJson(json.decode(str));

String consultantDataModelToJson(ConsultantDataModel data) => json.encode(data.toJson());

class ConsultantDataModel {
  String? docId;
  String? name;
  String? email;
  String? createdAt;
  String? updatedAt;

  ConsultantDataModel({
    this.docId,
    this.name,
    this.email,
    this.createdAt,
    this.updatedAt,
  });

  factory ConsultantDataModel.fromJson(Map<String, dynamic> json) => ConsultantDataModel(
    docId: json["docId"],
    name: json["name"],
    email: json["email"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "docId": docId,
    "name": name,
    "email": email,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}
