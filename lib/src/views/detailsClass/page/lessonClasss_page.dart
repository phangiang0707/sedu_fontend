import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sedu_fontend/src/model/otd/classRooms.otd.dart';

import '../../../controller/lessonCourse.controller.dart';
import '../../../model/otd/lessonCourse.otd.dart';
import '../components/listlessonClass_page.dart';

class LessonClass_Page extends StatefulWidget {
  const LessonClass_Page({super.key, required this.classRoomsOtd});
  final ClassRoomsOtd classRoomsOtd;
  @override
  State<LessonClass_Page> createState() => _LessonClass_PageState();
}

class _LessonClass_PageState extends State<LessonClass_Page> {
  LessonCourseController? lessonCourseController;
  List<LessonCourseOtd> lessonCourseOtd = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    lessonCourseController = LessonCourseController();
    lessonCourseController!
        .getLessonCourses(widget.classRoomsOtd.course.id)
        .then((value) {
      setState(() {
        lessonCourseOtd = value!;
      });
    });
  }

  bool setSelector = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5),
      padding: EdgeInsets.only(left: 20),
      child: SingleChildScrollView(
          child: Column(
              children: lessonCourseOtd
                  .map(
                    (e) => ListLessonClass_page(
                      lessonCourseOtd: e,
                    ),
                  )
                  .toList())),
    );
  }
}
