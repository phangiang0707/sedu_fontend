import 'package:flutter/material.dart';

import 'otd/loginEmail.otd.dart';

class SponsorModel extends ChangeNotifier {
  LoginEmailOtd? loginEmailOtd;
  void getUser(LoginEmailOtd _loginEmailOtd) {
    loginEmailOtd = _loginEmailOtd;
    notifyListeners();
  }
}
