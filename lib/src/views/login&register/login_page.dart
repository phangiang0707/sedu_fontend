import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controller/loginEmail.controller.dart';
import '../../model/otd/loginEmail.otd.dart';
import '../home/home_page.dart';
import '../menubar_page.dart';

class Login_page extends StatefulWidget {
  const Login_page({super.key});

  @override
  State<Login_page> createState() => _Login_pageState();
}

class _Login_pageState extends State<Login_page> {
  TextEditingController _txtUser = TextEditingController();
  TextEditingController _txtPass = TextEditingController();
  UserControllerr? userControllerr;
  LoginEmailOtd? loginEmailOtd;
  bool isEmail(String string) {
    // Null or empty string is invalid
    if (string == null || string.isEmpty) {
      return false;
    }

    const pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
    final regExp = RegExp(pattern);

    if (!regExp.hasMatch(string)) {
      return false;
    }
    return true;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userControllerr = UserControllerr();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          ClipPath(
            clipper: MyCustomCLipper1(),
            child: Container(
              height: 800,
              width: double.infinity,
              color: Color.fromRGBO(0, 133, 255, 1),
            ),
          ),
          ClipPath(
            clipper: MyCustomCLipper1(),
            child: Container(
              height: 600,
              width: double.infinity,
              color: Color.fromRGBO(23, 161, 250, 1),
            ),
          ),
          Center(
            child: Container(
              //padding: EdgeInsets.symmetric(horizontal: 20),
              height: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.arrow_back_ios_new_outlined,
                            color: Colors.white,
                          )),
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: 60),
                      height: 200,
                      width: 200,
                      child: Image.asset('images/logo__image.png'),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          TextFormField(
                            controller: _txtUser,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1,
                                    color: Color.fromRGBO(
                                        23, 161, 250, 1)), //<-- SEE HERE
                                borderRadius: BorderRadius.circular(15),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1,
                                    color: Color.fromRGBO(23, 161, 250, 1)),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              labelText: "Email",
                              border: OutlineInputBorder(),
                              hintText: "Email",
                            ),
                            keyboardType: TextInputType.emailAddress,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          // TextFormField(
                          //   controller: _txtUser,
                          //   decoration: InputDecoration(
                          //     enabledBorder: OutlineInputBorder(
                          //       borderSide: BorderSide(
                          //           width: 1,
                          //           color: Color.fromRGBO(
                          //               23, 161, 250, 1)), //<-- SEE HERE
                          //       borderRadius: BorderRadius.circular(15),
                          //     ),
                          //     focusedBorder: OutlineInputBorder(
                          //       borderSide: BorderSide(
                          //           width: 1,
                          //           color: Color.fromRGBO(23, 161, 250, 1)),
                          //       borderRadius: BorderRadius.circular(15),
                          //     ),
                          //     border: OutlineInputBorder(),
                          //     hintText: "Password",
                          //   ),
                          // ),
                          SizedBox(
                            height: 40,
                          ),
                          InkWell(
                            onTap: () {
                              isEmail(_txtUser.text)
                                  ? userControllerr!
                                      .postUser(_txtUser.text)
                                      .then((value) {
                                      if (value != null) {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    MenuBar_Page()));
                                      } else {
                                        print('Error');
                                      }
                                    })
                                  : print("Error email");
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: 200,
                              padding: EdgeInsets.symmetric(vertical: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Color.fromRGBO(23, 161, 250, 1)),
                              child: Text(
                                "Đăng nhập",
                                style: GoogleFonts.inter(
                                    fontSize: 26,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text("Hổ trợ"),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }
}

class MyCustomCLipper1 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height / 1.5);
    path.cubicTo(0, 3 * (size.height / 12), 3 * (size.width / 4),
        size.height / 2.5, size.width, size.height * 0.1);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
