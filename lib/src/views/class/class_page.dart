import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sedu_fontend/src/model/otd/classRooms.otd.dart';
import 'package:sedu_fontend/src/views/class/components/containerSearch_page.dart';

import '../../controller/classRooms.controller.dart';
import '../detailsClass/detailsClass_page.dart';

class Class_Page extends StatefulWidget {
  const Class_Page({super.key});

  @override
  State<Class_Page> createState() => _Class_PageState();
}

class _Class_PageState extends State<Class_Page> {
  ClassRoomsController? classRoomsController;
  List<ClassRoomsOtd> classRoomsOtd = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    classRoomsController = ClassRoomsController();
    ClassRoomsController.fetchPosts().then((value) {
      setState(() {
        classRoomsOtd = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              ContainerSearch_Page(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${classRoomsOtd.length} lớp",
                    style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(0, 0, 0, 0.3)),
                  ),
                  TextButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: ((BuildContext context) {
                              return AlertDialog(
                                content: TextFormField(
                                  decoration: InputDecoration(
                                      hintText: "Nhập mã lớp học",
                                      border: InputBorder.none,
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 1,
                                            color: Color.fromRGBO(
                                                23, 161, 250, 1)),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 1,
                                            color: Color.fromRGBO(
                                                23, 161, 250, 1)),
                                        borderRadius: BorderRadius.circular(15),
                                      )),
                                  style: GoogleFonts.inter(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400),
                                ),
                                actions: [
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Color.fromRGBO(23, 161, 250, 1)),
                                    padding: EdgeInsets.all(10),
                                    child: Text(
                                      "Xác nhận",
                                      style: GoogleFonts.inter(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white),
                                    ),
                                  )
                                ],
                              );
                            }));
                      },
                      child: Text(
                        "Mã lớp",
                        style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(0, 0, 0, 0.8)),
                      ))
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                children: classRoomsOtd
                    .map(
                      (e) => InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailsClass_Page(
                                      classRoomsOtd: e,
                                    )),
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.only(bottom: 20),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromRGBO(23, 161, 250, 1),
                                spreadRadius: 1,
                                blurRadius: 2,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${e.name}",
                                style: GoogleFonts.inter(
                                    fontSize: 18, fontWeight: FontWeight.w700),
                              ),
                              Text(
                                "sEdu",
                                style: GoogleFonts.inter(
                                    fontSize: 16, fontWeight: FontWeight.w400),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                    .toList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
