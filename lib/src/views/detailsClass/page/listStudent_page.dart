import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sedu_fontend/src/controller/student.controller.dart';
import 'package:sedu_fontend/src/model/otd/classRooms.otd.dart';
import 'package:sedu_fontend/src/model/otd/student.otd.dart';
import 'package:sedu_fontend/src/model/otd/user/getUser.otd.dart';

import '../../../controller/getUser.controller.dart';

class ListStudent_page extends StatefulWidget {
  const ListStudent_page({super.key, required this.classRoomsOtd});
  final ClassRoomsOtd classRoomsOtd;
  @override
  State<ListStudent_page> createState() => _ListStudent_pageState();
}

class _ListStudent_pageState extends State<ListStudent_page> {
  List<StudentOtd> studentOtd = [];
  StudentController? studentController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    studentController = StudentController();
    studentController!.getStudent(widget.classRoomsOtd.id).then((value) {
      setState(() {
        studentOtd = value!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: studentOtd.isEmpty
          ? Center(
              child: Text(
              "Không có học viên",
              style:
                  GoogleFonts.inter(fontSize: 24, fontWeight: FontWeight.w700),
            ))
          : Column(
              children: studentOtd
                  .map((e) => ContainerStudent(
                        studentOtd: e,
                      ))
                  .toList(),
            ),
    ));
  }
}

class ContainerStudent extends StatefulWidget {
  const ContainerStudent({super.key, required this.studentOtd});
  final StudentOtd studentOtd;
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
    userController!.getUser(widget.studentOtd.userId).then((value) {
      print(widget.studentOtd.userId);
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
            margin: const EdgeInsets.only(bottom: 10),
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
                // userOtd!.avatarUrl == null
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
