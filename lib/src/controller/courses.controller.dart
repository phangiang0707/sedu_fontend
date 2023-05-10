import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import '../model/otd/courses.otd.dart';
import '../utils/url.dart';

class CoursesController {
  // List<CoursesOtd> coursesOtd = [];
  // Future<List<CoursesOtd>?> getCourses() async {
  //   var response =
  //       await http.get(Uri.parse(url + 'courses')); //id nay la ntn ne

  //   print('Response status: ${response.statusCode}');
  //   print('Response body: ${response.body}');
  //   if (response.statusCode == 200) {
  //     coursesOtd =
  //         (response.body as List).map((e) => CoursesOtd.fromJson(e)).toList();
  //     //coursesOtdFromJson(response.body);
  //     return coursesOtd;
  //   } else {
  //     return null;
  //   }
  // }

  static List<CoursesOtd> parsePost(String responseBody) {
    var list = json.decode(responseBody) as List<dynamic>;
    List<CoursesOtd> posts =
        list.map((model) => CoursesOtd.fromJson(model)).toList();
    return posts;
  }

  static Future<List<CoursesOtd>> fetchPosts() async {
    final response = await http.get(Uri.parse('${url}courses'));
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    if (response.statusCode == 200) {
      return compute(parsePost, response.body);
    } else if (response.statusCode == 404) {
      throw Exception('Not Found');
    } else {
      throw Exception('Can\'tget post');
    }
  }
}
