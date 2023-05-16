import 'dart:convert';
import '../model/otd/loginEmail.otd.dart';
import '../utils/url.dart';
import 'package:http/http.dart' as http;

class UserControllerr {
  Future<LoginEmailOtd?> postUser(String email) async {
    var response = await http
        .post(Uri.parse('${url}users/loginByEmail'), body: {"email": email});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    if (response.statusCode == 201) {
      return loginEmailOtdFromJson(response.body);
    } else {
      print('Error');
      return null;
    }
  }
}
