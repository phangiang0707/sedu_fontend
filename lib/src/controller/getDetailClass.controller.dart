import '../model/otd/getDetailClass.otd.dart';
import 'package:http/http.dart' as http;

import '../utils/url.dart';

class GetDetailController {
  Future<GetDetailClassOtd?> getDetailClass(String id) async {
    final response = await http.get(Uri.parse('${url}classrooms/${id}'));
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      return getDetailClassOtdFromJson(response.body);
    } else {
      return null;
    }
  }
}
