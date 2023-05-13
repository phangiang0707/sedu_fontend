
// To parse this JSON data, do
//
//     final registerOtd = registerOtdFromJson(jsonString);

import 'dart:convert';

RegisterOtd registerOtdFromJson(String str) =>
    RegisterOtd.fromJson(json.decode(str));

String registerOtdToJson(RegisterOtd data) => json.encode(data.toJson());
String signUpPostOtdToJson(RegisterOtd data) => json.encode(data.toJson());

class RegisterOtd {
  String name;
  String email;
  String phone;
  String avatarUrl;
  DateTime birthday;

  RegisterOtd({
    required this.name,
    required this.email,
    required this.phone,
    required this.avatarUrl,
    required this.birthday,
  });

  factory RegisterOtd.fromJson(Map<String, dynamic> json) => RegisterOtd(
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        avatarUrl: json["avatarUrl"],
        birthday: DateTime.parse(json["birthday"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "phone": phone,
        "avatarUrl": avatarUrl,
        "birthday": birthday.toIso8601String(),
      };
}
