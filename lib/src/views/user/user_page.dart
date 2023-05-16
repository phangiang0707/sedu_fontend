import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sedu_fontend/src/model/sponsorModel.dart';

import '../../model/otd/loginEmail.otd.dart';

class User_page extends StatefulWidget {
  const User_page({super.key});

  @override
  State<User_page> createState() => _User_pageState();
}

class _User_pageState extends State<User_page> {
  LoginEmailOtd? _loginEmailOtd;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _loginEmailOtd =
        Provider.of<SponsorModel>(context, listen: false).loginEmailOtd;
    //print(_loginEmailOtd!.email);
  }

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<SponsorModel>(context);
    return SafeArea(
      child: Scaffold(
          body: Container(
        width: double.infinity,
        padding: EdgeInsets.fromLTRB(20, 30, 20, 0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ClipOval(
                  child: Container(
                color: Colors.amber,
                child: Image.asset(
                  'images/image1.png',
                  width: 150,
                  height: 150,
                  fit: BoxFit.fill,
                ),
              )),
              SizedBox(
                height: 10,
              ),
              Text(
                _loginEmailOtd!.name,
                style: GoogleFonts.inter(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Color.fromRGBO(0, 0, 0, 0.6)),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.topLeft,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(bottom: 20),
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromRGBO(23, 161, 250, 1),
                                  blurRadius: 2,
                                  spreadRadius: 1,
                                  offset: Offset(2, 1))
                            ]),
                        child: Row(
                          children: [
                            Icon(Icons.phone),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              _loginEmailOtd!.phone,
                              style: GoogleFonts.inter(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(bottom: 20),
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromRGBO(23, 161, 250, 1),
                                  blurRadius: 2,
                                  spreadRadius: 1,
                                  offset: Offset(2, 1))
                            ]),
                        child: Row(
                          children: [
                            Icon(Icons.email),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              _loginEmailOtd!.email,
                              style: GoogleFonts.inter(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(bottom: 20),
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromRGBO(23, 161, 250, 1),
                                  blurRadius: 2,
                                  spreadRadius: 1,
                                  offset: Offset(2, 1))
                            ]),
                        child: Row(
                          children: [
                            Icon(Icons.calendar_month),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "${_loginEmailOtd!.birthday.day}/${_loginEmailOtd!.birthday.month}/${_loginEmailOtd!.birthday.year}",
                              style: GoogleFonts.inter(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(bottom: 20),
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromRGBO(23, 161, 250, 1),
                                  blurRadius: 2,
                                  spreadRadius: 1,
                                  offset: Offset(2, 1))
                            ]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Row(children: [
                                Icon(Icons.people),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Phụ huynh",
                                  style: GoogleFonts.inter(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black),
                                ),
                              ]),
                            ),
                            Icon(Icons.arrow_forward_ios_outlined)
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(bottom: 20),
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromRGBO(23, 161, 250, 1),
                                  blurRadius: 2,
                                  spreadRadius: 1,
                                  offset: Offset(2, 1))
                            ]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Row(children: [
                                Icon(Icons.info),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Thông tin ứng dụng",
                                  style: GoogleFonts.inter(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black),
                                ),
                              ]),
                            ),
                            Icon(Icons.arrow_forward_ios_outlined)
                          ],
                        ),
                      ),
                    ]),
              )
            ],
          ),
        ),
      )),
    );
  }
}
