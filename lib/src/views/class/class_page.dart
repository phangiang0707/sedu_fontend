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
  List<ClassRoomsOtd> _classRoomsOtdDisplay = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    classRoomsController = ClassRoomsController();
    ClassRoomsController.fetchPosts().then((value) {
      setState(() {
        classRoomsOtd = value;
        _classRoomsOtdDisplay = classRoomsOtd;
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
              Container(
                child: TextFormField(
                  onChanged: (text) {
                    text = text.toLowerCase();
                    setState(() {
                      _classRoomsOtdDisplay = classRoomsOtd.where((element) {
                        var postitle = element.name.toLowerCase();
                        return postitle.contains(text);
                      }).toList();
                    });
                  },
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      hintText: "Tìm kiếm",
                      border: InputBorder.none,
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            width: 1,
                            color:
                                Color.fromRGBO(23, 161, 250, 1)), //<-- SEE HERE
                        borderRadius: BorderRadius.circular(15),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            width: 1, color: Color.fromRGBO(23, 161, 250, 1)),
                        borderRadius: BorderRadius.circular(15),
                      )),
                  style: GoogleFonts.inter(
                      fontSize: 18, fontWeight: FontWeight.w400),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${classRoomsOtd.length} lớp",
                    style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: const Color.fromRGBO(0, 0, 0, 0.3)),
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
                                        borderSide: const BorderSide(
                                            width: 1,
                                            color: Color.fromRGBO(
                                                23, 161, 250, 1)),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
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
                                        color: const Color.fromRGBO(
                                            23, 161, 250, 1)),
                                    padding: const EdgeInsets.all(10),
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
                            color: const Color.fromRGBO(0, 0, 0, 0.8)),
                      ))
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                children: _classRoomsOtdDisplay
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
                          margin: const EdgeInsets.only(bottom: 20),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromRGBO(23, 161, 250, 1),
                                spreadRadius: 1,
                                blurRadius: 2,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                e.name,
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
