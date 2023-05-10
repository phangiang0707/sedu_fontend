import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sedu_fontend/src/views/menubar_page.dart';

import '../../controller/register.controller.dart';
import '../../model/otd/register.otd.dart';

class Register_page extends StatefulWidget {
  const Register_page({super.key});

  @override
  State<Register_page> createState() => _Register_pageState();
}

class _Register_pageState extends State<Register_page> {
  RegisterController? registerController;
  RegisterOtd? registerOtd;
  TextEditingController _txtName = TextEditingController();
  TextEditingController _txtEmail = TextEditingController();
  TextEditingController _txtPhone = TextEditingController();
  DateTime _txtBirthday = DateTime.now();
  TextEditingController _txtPass = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    registerController = RegisterController();
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
                            controller: _txtName,
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
                              border: OutlineInputBorder(),
                              hintText: "User name",
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: _txtEmail,
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
                              border: OutlineInputBorder(),
                              hintText: "Email address",
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: _txtPhone,
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
                              border: OutlineInputBorder(),
                              hintText: "Phone number",
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: _txtPass,
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
                              border: OutlineInputBorder(),
                              hintText: "Password",
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          InkWell(
                            onTap: () {
                              // registerOtd = new RegisterOtd(
                              //     name: _txtName.text,
                              //     email: _txtEmail.text,
                              //     phone: _txtPhone.text,
                              //     avatarUrl: 'images.logo__image.png',
                              //     birthday: _txtBirthday);
                              registerController!
                                  .postRegister(RegisterOtd(
                                      name: _txtName.text,
                                      email: _txtEmail.text,
                                      phone: _txtPhone.text,
                                      avatarUrl: 'images.logo__image.png',
                                      birthday: _txtBirthday))
                                  .then((value) {
                                print(value);
                                if (value != null) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              MenuBar_Page()));
                                }
                              });
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: 200,
                              padding: EdgeInsets.symmetric(vertical: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Color.fromRGBO(23, 161, 250, 1)),
                              child: Text(
                                "Đăng ký",
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
