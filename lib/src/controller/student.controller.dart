import '../model/otd/student.otd.dart';
import '../utils/url.dart';
import 'package:http/http.dart' as http;

class StudentController {
  Future<List<StudentOtd>?> getStudent(String id) async {
    final response = await http.get(Uri.parse('${url}classrooms/$id/students'));
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      return studentOtdFromJson(response.body);
    } else {
      return null;
    }
  }
}
