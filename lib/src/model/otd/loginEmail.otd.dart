// To parse this JSON data, do
//
//     final loginEmailOtd = loginEmailOtdFromJson(jsonString);

import 'dart:convert';

LoginEmailOtd loginEmailOtdFromJson(String str) =>
    LoginEmailOtd.fromJson(json.decode(str));

String loginEmailOtdToJson(LoginEmailOtd data) => json.encode(data.toJson());

class LoginEmailOtd {
  String id;
  String name;
  String email;
  String phone;
  String avatarUrl;
  DateTime birthday;
  bool enabled;
  DateTime createdAt;
  DateTime updatedAt;

  LoginEmailOtd({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.avatarUrl,
    required this.birthday,
    required this.enabled,
    required this.createdAt,
    required this.updatedAt,
  });

  factory LoginEmailOtd.fromJson(Map<String, dynamic> json) => LoginEmailOtd(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        avatarUrl: json["avatarUrl"],
        birthday: DateTime.parse(json["birthday"]),
        enabled: json["enabled"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "phone": phone,
        "avatarUrl": avatarUrl,
        "birthday": birthday.toIso8601String(),
        "enabled": enabled,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}
