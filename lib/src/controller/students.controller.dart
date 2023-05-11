import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/otd/students.otd.dart';
import '../utils/url.dart';
import 'package:http/http.dart' as http;

class StudentsController {
  Future<List<StudentsOtd>?> getStuden(String id) async {
    final response = await http.get(Uri.parse('${url}courses/$id/lessons'));
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      return studentsOtdFromJson(response.body);
    } else {
      return null;
    }
  }
}
