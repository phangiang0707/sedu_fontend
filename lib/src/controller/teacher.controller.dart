import '../model/otd/teacher.otd.dart';
import '../utils/url.dart';
import 'package:http/http.dart' as http;

class TeacherController {
  Future<List<TeacherOtd>?> getTeacher(String id) async {
    final response =
        await http.get(Uri.parse('${url}classrooms/$id/teachers'));
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      return teacherOtdFromJson(response.body);
    } else {
      return null;
    }
  }
}
