// To parse this JSON data, do
//
//     final calendarClassOtd = calendarClassOtdFromJson(jsonString);

import 'dart:convert';

List<CalendarClassOtd> calendarClassOtdFromJson(String str) =>
    List<CalendarClassOtd>.from(
        json.decode(str).map((x) => CalendarClassOtd.fromJson(x)));

String calendarClassOtdToJson(List<CalendarClassOtd> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CalendarClassOtd {
  String id;
  int day;
  String startTime;
  String endTime;
  DateTime createdAt;
  DateTime updatedAt;

  CalendarClassOtd({
    required this.id,
    required this.day,
    required this.startTime,
    required this.endTime,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CalendarClassOtd.fromJson(Map<String, dynamic> json) =>
      CalendarClassOtd(
        id: json["id"],
        day: json["day"],
        startTime: json["startTime"],
        endTime: json["endTime"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "day": day,
        "startTime": startTime,
        "endTime": endTime,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}
