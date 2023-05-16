import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'login&register/login_page.dart';
import 'login&register/register_page.dart';

class Dashboard_page extends StatefulWidget {
  const Dashboard_page({super.key});

  @override
  State<Dashboard_page> createState() => _Dashboard_pageState();
}

class _Dashboard_pageState extends State<Dashboard_page> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          ClipPath(
            clipper: MyCustomCLipper1(),
            child: Container(
              height: 800,
              width: double.infinity,
              color: const Color.fromRGBO(0, 133, 255, 1),
            ),
          ),
          ClipPath(
            clipper: MyCustomCLipper1(),
            child: Container(
              height: 600,
              width: double.infinity,
              color: const Color.fromRGBO(23, 161, 250, 1),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 60),
                  height: 200,
                  width: 200,
                  child: Image.asset('images/logo__image.png'),
                ),
                Container(
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Login_page()));
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: 300,
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                  color: const Color.fromRGBO(0, 133, 255, 1),
                                  width: 1)),
                          child: Text(
                            "Đăng nhập",
                            style: GoogleFonts.inter(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                                color: const Color.fromRGBO(0, 133, 255, 1)),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Register_page()));
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: 300,
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: const Color.fromRGBO(0, 133, 255, 1)),
                          child: Text(
                            "Đăng ký",
                            style: GoogleFonts.inter(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text("Hổ trợ"),
                )
              ],
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
