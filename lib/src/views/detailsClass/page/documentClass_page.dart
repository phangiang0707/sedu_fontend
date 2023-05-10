import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../class/components/containerSearch_page.dart';

class DocumentClass_page extends StatefulWidget {
  const DocumentClass_page({super.key});

  @override
  State<DocumentClass_page> createState() => _DocumentClass_pageState();
}

class _DocumentClass_pageState extends State<DocumentClass_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
        child: SingleChildScrollView(
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        hintText: "Tìm kiếm",
                        border: InputBorder.none,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 1,
                              color: Color.fromRGBO(
                                  23, 161, 250, 1)), //<-- SEE HERE
                          borderRadius: BorderRadius.circular(15),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 1, color: Color.fromRGBO(23, 161, 250, 1)),
                          borderRadius: BorderRadius.circular(15),
                        )),
                    style: GoogleFonts.inter(
                        fontSize: 18, fontWeight: FontWeight.w400),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.filter_alt_outlined,
                      size: 24,
                    ))
              ],
            ),
            SizedBox(
              height: 10,
            ),
            containerPDF(context),
            containerVideo(context),
            containerMp3(context),
            containerImage(context),
          ]),
        ),
      ),
    );
  }
}

Widget containerPDF(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(bottom: 10),
    decoration: BoxDecoration(
        color: Color.fromRGBO(247, 247, 247, 1),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
              color: Color.fromRGBO(23, 161, 250, 1),
              blurRadius: 2,
              spreadRadius: 1,
              offset: Offset(2, 1))
        ]),
    padding: EdgeInsets.all(10),
    child: Row(
      children: [
        Image.asset('images/pdf.png'),
        SizedBox(
          width: 10,
        ),
        Text(
          "Đề bài kiểm tra 1.pdf",
          style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w400),
        )
      ],
    ),
  );
}

Widget containerVideo(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(bottom: 10),
    decoration: BoxDecoration(
        color: Color.fromRGBO(247, 247, 247, 1),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
              color: Color.fromRGBO(23, 161, 250, 1),
              blurRadius: 2,
              spreadRadius: 1,
              offset: Offset(2, 1))
        ]),
    padding: EdgeInsets.all(10),
    child: Row(
      children: [
        Image.asset('images/video.png'),
        SizedBox(
          width: 10,
        ),
        Text(
          "Đề bài kiểm tra 1.mp4",
          style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w400),
        )
      ],
    ),
  );
}

Widget containerMp3(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(bottom: 10),
    decoration: BoxDecoration(
        color: Color.fromRGBO(247, 247, 247, 1),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
              color: Color.fromRGBO(23, 161, 250, 1),
              blurRadius: 2,
              spreadRadius: 1,
              offset: Offset(2, 1))
        ]),
    padding: EdgeInsets.all(10),
    child: Row(
      children: [
        Image.asset('images/mp3.png'),
        SizedBox(
          width: 10,
        ),
        Text(
          "Đề bài kiểm tra 1.mp3",
          style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w400),
        )
      ],
    ),
  );
}

Widget containerImage(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(bottom: 10),
    decoration: BoxDecoration(
        color: Color.fromRGBO(247, 247, 247, 1),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
              color: Color.fromRGBO(23, 161, 250, 1),
              blurRadius: 2,
              spreadRadius: 1,
              offset: Offset(2, 1))
        ]),
    padding: EdgeInsets.all(10),
    child: Row(
      children: [
        Image.asset('images/image.png'),
        SizedBox(
          width: 10,
        ),
        Text(
          "Đề bài kiểm tra 1.png",
          style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w400),
        )
      ],
    ),
  );
}
