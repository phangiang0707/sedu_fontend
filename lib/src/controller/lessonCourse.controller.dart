
import '../model/otd/lessonCourse.otd.dart';
import '../utils/url.dart';
import 'package:http/http.dart' as http;

class LessonCourseController {
  Future<List<LessonCourseOtd>?> getLessonCourses(String id) async {
    final response = await http.get(Uri.parse('${url}courses/$id/lessons'));
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      return lessonCourseOtdFromJson(response.body);
    } else {
      return null;
    }
  }
}
