// To parse this JSON data, do
//
//     final teacherOtd = teacherOtdFromJson(jsonString);

import 'dart:convert';

List<TeacherOtd> teacherOtdFromJson(String str) =>
    List<TeacherOtd>.from(json.decode(str).map((x) => TeacherOtd.fromJson(x)));

String teacherOtdToJson(List<TeacherOtd> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TeacherOtd {
  String classroomId;
  String userId;
  String permission;
  DateTime createdAt;
  DateTime updatedAt;

  TeacherOtd({
    required this.classroomId,
    required this.userId,
    required this.permission,
    required this.createdAt,
    required this.updatedAt,
  });

  factory TeacherOtd.fromJson(Map<String, dynamic> json) => TeacherOtd(
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
