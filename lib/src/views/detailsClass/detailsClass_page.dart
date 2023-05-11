import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sedu_fontend/src/model/otd/classRooms.otd.dart';
import 'package:sedu_fontend/src/views/detailsClass/page/generalityClass_page.dart';

import 'page/documentClass_page.dart';
import 'page/exerciseClass_page.dart';
import 'page/lessonClasss_page.dart';

class DetailsClass_Page extends StatefulWidget {
  const DetailsClass_Page({super.key, required this.classRoomsOtd});
  final ClassRoomsOtd classRoomsOtd;
  @override
  State<DetailsClass_Page> createState() => _DetailsClass_PageState();
}

class _DetailsClass_PageState extends State<DetailsClass_Page> {
  int i = 0;
  int j = 0;
  // List<Widget> list = [
  //   GeneralityClass_Page(
  //     classRoomsOtd: widget.classRoomsOtd,
  //   ),
  //   LessonClass_Page(),
  //   ExerciseClass_Page(),
  //   DocumentClass_page()
  // ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(children: [
          Container(
            color: Color.fromRGBO(23, 161, 250, 1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios_new_outlined,
                      color: Colors.white,
                    )),
                Text(
                  "${widget.classRoomsOtd.name}",
                  style: GoogleFonts.inter(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
                SizedBox(
                  width: 1,
                )
              ],
            ),
          ),
          Container(
            height: 40,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      i = 0;
                      j = 0;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.only(left: 15, right: 15),
                    height: 40,
                    alignment: Alignment.center,
                    child: Text(
                      "Tổng quát",
                      style: GoogleFonts.inter(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: i == 0
                              ? Color.fromRGBO(23, 161, 250, 0.8)
                              : Color.fromRGBO(0, 0, 0, 0.6)),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      i = 1;
                      j = 1;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.only(left: 15, right: 15),
                    height: 40,
                    alignment: Alignment.center,
                    child: Text(
                      "Bài học",
                      style: GoogleFonts.inter(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: i == 1
                              ? Color.fromRGBO(23, 161, 250, 0.8)
                              : Color.fromRGBO(0, 0, 0, 0.6)),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      i = 2;
                      j = 2;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.only(left: 15, right: 15),
                    height: 40,
                    alignment: Alignment.center,
                    child: Text(
                      "Bài tập",
                      style: GoogleFonts.inter(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: i == 2
                              ? Color.fromRGBO(23, 161, 250, 0.8)
                              : Color.fromRGBO(0, 0, 0, 0.6)),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      i = 3;
                      j = 3;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.only(left: 15, right: 15),
                    height: 40,
                    alignment: Alignment.center,
                    child: Text(
                      "Tài liệu",
                      style: GoogleFonts.inter(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: i == 3
                              ? Color.fromRGBO(23, 161, 250, 0.8)
                              : Color.fromRGBO(0, 0, 0, 0.6)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child:
                  //Tổng quát
                  j == 0
                      ? GeneralityClass_Page(
                          classRoomsOtd: widget.classRoomsOtd,
                        )
                      :
                      //Bài học
                      j == 1
                          ? LessonClass_Page()
                          :
                          //Bài tập
                          j == 2
                              ? ExerciseClass_Page()
                              //Tài liệu
                              : DocumentClass_page())
        ]),
      ),
    );
  }
}
