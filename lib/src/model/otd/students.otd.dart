// To parse this JSON data, do
//
//     final studentsOtd = studentsOtdFromJson(jsonString);

import 'dart:convert';

List<StudentsOtd> studentsOtdFromJson(String str) => List<StudentsOtd>.from(
    json.decode(str).map((x) => StudentsOtd.fromJson(x)));

String studentsOtdToJson(List<StudentsOtd> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class StudentsOtd {
  String classroomId;
  String userId;
  String permission;
  DateTime createdAt;
  DateTime updatedAt;

  StudentsOtd({
    required this.classroomId,
    required this.userId,
    required this.permission,
    required this.createdAt,
    required this.updatedAt,
  });

  factory StudentsOtd.fromJson(Map<String, dynamic> json) => StudentsOtd(
        classroomId: json["classroomId"],
        userId: json["userId"],
        permission: json["permission"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "classroomId": classroomId,
        "userId": userId,
        "permission": permission,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}
