// To parse this JSON data, do
//
//     final getDetailClassOtd = getDetailClassOtdFromJson(jsonString);

import 'dart:convert';

GetDetailClassOtd getDetailClassOtdFromJson(String str) =>
    GetDetailClassOtd.fromJson(json.decode(str));

String getDetailClassOtdToJson(GetDetailClassOtd data) =>
    json.encode(data.toJson());

class GetDetailClassOtd {
  String id;
  String name;
  String code;
  String description;
  String rules;
  DateTime startDate;
  DateTime endDate;
  dynamic zaloGroupChatName;
  dynamic zaloGroupChatUrl;
  bool archived;
  bool enabled;
  Course course;

  GetDetailClassOtd({
    required this.id,
    required this.name,
    required this.code,
    required this.description,
    required this.rules,
    required this.startDate,
    required this.endDate,
    this.zaloGroupChatName,
    this.zaloGroupChatUrl,
    required this.archived,
    required this.enabled,
    required this.course,
  });

  factory GetDetailClassOtd.fromJson(Map<String, dynamic> json) =>
      GetDetailClassOtd(
        id: json["id"],
        name: json["name"],
        code: json["code"],
        description: json["description"],
        rules: json["rules"],
        startDate: DateTime.parse(json["startDate"]),
        endDate: DateTime.parse(json["endDate"]),
        zaloGroupChatName: json["zaloGroupChatName"],
        zaloGroupChatUrl: json["zaloGroupChatUrl"],
        archived: json["archived"],
        enabled: json["enabled"],
        course: Course.fromJson(json["course"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "code": code,
        "description": description,
        "rules": rules,
        "startDate": startDate.toIso8601String(),
        "endDate": endDate.toIso8601String(),
        "zaloGroupChatName": zaloGroupChatName,
        "zaloGroupChatUrl": zaloGroupChatUrl,
        "archived": archived,
        "enabled": enabled,
        "course": course.toJson(),
      };
}

class Course {
  String id;
  String name;
  String description;
  String rules;
  int price;
  dynamic imageUrl;
  String categoryId;
  DateTime startDate;
  DateTime endDate;
  bool enabled;
  bool deleted;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  Course({
    required this.id,
    required this.name,
    required this.description,
    required this.rules,
    required this.price,
    this.imageUrl,
    required this.categoryId,
    required this.startDate,
    required this.endDate,
    required this.enabled,
    required this.deleted,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });

  factory Course.fromJson(Map<String, dynamic> json) => Course(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        rules: json["rules"],
        price: json["price"],
        imageUrl: json["imageUrl"],
        categoryId: json["categoryId"],
        startDate: DateTime.parse(json["startDate"]),
        endDate: DateTime.parse(json["endDate"]),
        enabled: json["enabled"],
        deleted: json["deleted"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        deletedAt: json["deletedAt"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "rules": rules,
        "price": price,
        "imageUrl": imageUrl,
        "categoryId": categoryId,
        "startDate": startDate.toIso8601String(),
        "endDate": endDate.toIso8601String(),
        "enabled": enabled,
        "deleted": deleted,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "deletedAt": deletedAt,
      };
}
