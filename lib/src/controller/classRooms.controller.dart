import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import '../model/otd/classRooms.otd.dart';
import '../utils/url.dart';

class ClassRoomsController {
  static List<ClassRoomsOtd> parsePost(String responseBody) {
    var list = json.decode(responseBody) as List<dynamic>;
    List<ClassRoomsOtd> posts =
        list.map((model) => ClassRoomsOtd.fromJson(model)).toList();
    return posts;
  }

  static Future<List<ClassRoomsOtd>> fetchPosts() async {
    final response = await http.get(Uri.parse('${url}classrooms'));
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
