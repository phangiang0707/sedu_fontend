import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sedu_fontend/src/controller/teacher.controller.dart';
import 'package:sedu_fontend/src/model/otd/classRooms.otd.dart';
import 'package:sedu_fontend/src/model/otd/teacher.otd.dart';
import 'package:sedu_fontend/src/model/otd/user/getUser.otd.dart';

import '../../../controller/getUser.controller.dart';

class ListTeacher_page extends StatefulWidget {
  const ListTeacher_page({super.key, required this.classRoomsOtd});
  final ClassRoomsOtd classRoomsOtd;
  @override
  State<ListTeacher_page> createState() => _ListTeacher_pageState();
}

class _ListTeacher_pageState extends State<ListTeacher_page> {
  List<TeacherOtd> teacherOtd = [];
  TeacherController? teacherController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    teacherController = TeacherController();
    teacherController!.getTeacher(widget.classRoomsOtd.id).then((value) {
      setState(() {
        teacherOtd = value!;
      });
    });
    print(teacherOtd.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: teacherOtd.isEmpty
          ? Center(
              child: Text(
              "Không có giáo viên",
              style:
                  GoogleFonts.inter(fontSize: 24, fontWeight: FontWeight.w700),
            ))
          : Column(
              children: teacherOtd
                  .map((e) => ContainerStudent(
                        teacherOtd: e,
                      ))
                  .toList(),
            ),
    );
  }
}

class ContainerStudent extends StatefulWidget {
  const ContainerStudent({super.key, required this.teacherOtd});
  final TeacherOtd teacherOtd;
  @override
  State<ContainerStudent> createState() => _ContainerStudentState();
}

class _ContainerStudentState extends State<ContainerStudent> {
  UserController? userController;
  UserOtd? userOtd;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userController = UserController();
    userController!.getUser(widget.teacherOtd.userId).then((value) {
      print(widget.teacherOtd.userId);
      setState(() {
        userOtd = value;
      });
    });
    print('object ${userOtd.toString()}');
  }

  @override
  Widget build(BuildContext context) {
    return userOtd != null
        ? Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: const BoxDecoration(
              border: Border(
                bottom:
                    BorderSide(width: 2, color: Color.fromRGBO(0, 0, 0, 0.5)),
              ),
            ),
            child: Row(
              children: [
                Image.asset(
                  'images/logo__image.png',
                  width: 30,
                  height: 30,
                ),
                // userOtd!.avatarUrl.isEmpty
                //     ? Image.asset(
                //         'images/logo__image.png',
                //         width: 30,
                //         height: 30,
                //       )
                //     : Image(
                //         image: NetworkImage(url + '${userOtd!.avatarUrl}'),
                //         width: 30,
                //         height: 30,
                //       ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  userOtd!.name,
                  style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: const Color.fromRGBO(0, 0, 0, 0.8)),
                ),
              ],
            ),
          )
        : const CircularProgressIndicator();
  }
}
