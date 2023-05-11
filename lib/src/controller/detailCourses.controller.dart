import 'dart:convert';
import '../model/otd/detailCourses.otd.dart';
import '../utils/url.dart';
import 'package:http/http.dart' as http;

class DetailCourseController {
  Future<DetailCoursesOtd?> getDetailCourses(String id) async {
    final response = await http.get(Uri.parse('${url}courses/$id'));
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      return detailCoursesOtdFromJson(response.body);
    } else {
      return null;
    }
  }
}
