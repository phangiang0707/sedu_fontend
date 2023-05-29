
import '../model/otd/calendarClass.otd.dart';
import '../utils/url.dart';
import 'package:http/http.dart' as http;

class CalendarClassController {
  Future<List<CalendarClassOtd>?> getCalendarClass(String id) async {
    final response = await http.get(Uri.parse('${url}classrooms/$id/timings'));
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      return calendarClassOtdFromJson(response.body);
    } else {
      return null;
    }
  }
}
