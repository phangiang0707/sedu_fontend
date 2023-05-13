// To parse this JSON data, do
//
//     final studentOtd = studentOtdFromJson(jsonString);

import 'dart:convert';

List<StudentOtd> studentOtdFromJson(String str) =>
    List<StudentOtd>.from(json.decode(str).map((x) => StudentOtd.fromJson(x)));

String studentOtdToJson(List<StudentOtd> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class StudentOtd {
  String classroomId;
  String userId;
  String permission;
  DateTime createdAt;
  DateTime updatedAt;

  StudentOtd({
    required this.classroomId,
    required this.userId,
    required this.permission,
    required this.createdAt,
    required this.updatedAt,
  });

  factory StudentOtd.fromJson(Map<String, dynamic> json) => StudentOtd(
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
