import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/otd/register.otd.dart';
import '../utils/url.dart';

class RegisterController {
  Future<RegisterOtd?> postRegister(RegisterOtd data) async {
    var response = await http.post(
      Uri.parse(url + 'users/register'),
      headers: {
        "Content-Type": "application/json",
      },
      body: signUpPostOtdToJson(data),
    );

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    print(response.statusCode);
    if (response.statusCode == 201) {
      return registerOtdFromJson(response.body);
    } else {
      print("Error");
      return null;
    }
  }
}
