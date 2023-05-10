// To parse this JSON data, do
//
//     final coursesOtd = coursesOtdFromJson(jsonString);

import 'dart:convert';

List<CoursesOtd> coursesOtdFromJson(String str) =>
    List<CoursesOtd>.from(json.decode(str).map((x) => CoursesOtd.fromJson(x)));

String coursesOtdToJson(List<CoursesOtd> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CoursesOtd {
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

  CoursesOtd({
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

  factory CoursesOtd.fromJson(Map<String, dynamic> json) => CoursesOtd(
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
