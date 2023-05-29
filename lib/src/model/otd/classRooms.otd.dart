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

  Course({
    required this.id,
    required this.name,
    required this.description,
  });

  factory Course.fromJson(Map<String, dynamic> json) => Course(
        id: json["id"],
        name: json["name"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
      };
}
