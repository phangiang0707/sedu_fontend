
import '../model/otd/user/getUser.otd.dart';
import '../utils/url.dart';
import 'package:http/http.dart' as http;

class UserController {
  Future<UserOtd?> getUser(String id) async {
    final response = await http.get(Uri.parse('${url}users/$id'));
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      return userOtdFromJson(response.body);
    } else {
      return null;
    }
  }
}
