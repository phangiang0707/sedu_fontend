import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../controller/lessonCourse.controller.dart';
import '../../../model/otd/lessonCourse.otd.dart';
import '../components/listlessonClass_page.dart';

class LessonClass_Page extends StatefulWidget {
  const LessonClass_Page({super.key});

  @override
  State<LessonClass_Page> createState() => _LessonClass_PageState();
}

class _LessonClass_PageState extends State<LessonClass_Page> {
  LessonCourseOtd? lessonCourseOtd;
  bool setSelector = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5),
      padding: EdgeInsets.only(left: 20),
      child: SingleChildScrollView(
          child: Column(children: [
        ListLessonClass_page(
          lessonCourseOtd: lessonCourseOtd!,
        ),
      ])),
    );
  }
}
