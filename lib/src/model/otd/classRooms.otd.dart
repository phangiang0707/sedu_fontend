// To parse this JSON data, do
//
//     final classRoomsOtd = classRoomsOtdFromJson(jsonString);

import 'dart:convert';

List<ClassRoomsOtd> classRoomsOtdFromJson(String str) =>
    List<ClassRoomsOtd>.from(
        json.decode(str).map((x) => ClassRoomsOtd.fromJson(x)));

String classRoomsOtdToJson(List<ClassRoomsOtd> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ClassRoomsOtd {
  String id;
  String name;
  String code;
  String description;
  DateTime startDate;
  DateTime endDate;
  Course course;

  ClassRoomsOtd({
    required this.id,
    required this.name,
    required this.code,
    required this.description,
    required this.startDate,
    required this.endDate,
    required this.course,
  });

  factory ClassRoomsOtd.fromJson(Map<String, dynamic> json) => ClassRoomsOtd(
        id: json["id"],
        name: json["name"],
        code: json["code"],
        description: json["description"],
        startDate: DateTime.parse(json["startDate"]),
        endDate: DateTime.parse(json["endDate"]),
        course: Course.fromJson(json["course"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "code": code,
        "description": description,
        "startDate": startDate.toIso8601String(),
        "endDate": endDate.toIso8601String(),
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
      };
}
