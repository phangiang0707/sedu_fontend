// To parse this JSON data, do
//
//     final lessonCourseOtd = lessonCourseOtdFromJson(jsonString);

import 'dart:convert';

List<LessonCourseOtd> lessonCourseOtdFromJson(String str) =>
    List<LessonCourseOtd>.from(
        json.decode(str).map((x) => LessonCourseOtd.fromJson(x)));

String lessonCourseOtdToJson(List<LessonCourseOtd> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LessonCourseOtd {
  String id;
  int lessonNo;
  String title;
  String content;
  String type;
  bool enabled;
  bool deleted;
  DateTime createdAt;
  DateTime updatedAt;

  LessonCourseOtd({
    required this.id,
    required this.lessonNo,
    required this.title,
    required this.content,
    required this.type,
    required this.enabled,
    required this.deleted,
    required this.createdAt,
    required this.updatedAt,
  });

  factory LessonCourseOtd.fromJson(Map<String, dynamic> json) =>
      LessonCourseOtd(
        id: json["id"],
        lessonNo: json["lessonNo"],
        title: json["title"],
        content: json["content"],
        type: json["type"],
        enabled: json["enabled"],
        deleted: json["deleted"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "lessonNo": lessonNo,
        "title": title,
        "content": content,
        "type": type,
        "enabled": enabled,
        "deleted": deleted,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}
