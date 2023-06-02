import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sedu_fontend/src/model/otd/classRooms.otd.dart';
import 'package:sedu_fontend/src/views/detailsClass/page/generalityClass_page.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../controller/getDetailClass.controller.dart';
import '../../model/otd/getDetailClass.otd.dart';
import 'page/lessonClasss_page.dart';
import 'page/listStudent_page.dart';
import 'page/listTeacher_page.dart';

class DetailsClass_Page extends StatefulWidget {
  const DetailsClass_Page({super.key, required this.classRoomsOtd});
  final ClassRoomsOtd classRoomsOtd;
  @override
  State<DetailsClass_Page> createState() => _DetailsClass_PageState();
}

class _DetailsClass_PageState extends State<DetailsClass_Page> {
  int i = 0;
  int j = 0;
  String cutUrl = '';
  GetDetailController? _getDetailController;
  GetDetailClassOtd? _getDetailClassOtd;
  String _zaloUrl = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getDetailController = GetDetailController();
    _getDetailController!.getDetailClass(widget.classRoomsOtd.id).then((value) {
      setState(() {
        _getDetailClassOtd = value;
        // _zaloUrl = value!.zaloGroupChatUrl;
      });
    });
  }

  void removeString(String url) {
    setState(() {
      cutUrl = url.substring(7, url.length);
    });

    print(cutUrl);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _getDetailClassOtd == null
            ? Center(child: CircularProgressIndicator())
            : Column(children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  color: const Color.fromRGBO(23, 161, 250, 1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios_new_outlined,
                            color: Colors.white,
                          )),
                      Text(
                        widget.classRoomsOtd.name,
                        style: GoogleFonts.inter(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                      _getDetailClassOtd!.zaloGroupChatUrl == null
                          ? SizedBox(
                              height: 10,
                            )
                          : InkWell(
                              onTap: () async {
                                removeString(
                                    '${_getDetailClassOtd!.zaloGroupChatUrl}');
                                final uri = Uri.https('zalo.me', '${cutUrl}');
                                await launchUrl(uri,
                                    mode: LaunchMode.externalApplication);
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 5),
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(23, 161, 250, 0.8),
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: Colors.white)),
                                child: Text(
                                  "Tham gia chat",
                                  style: GoogleFonts.inter(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white),
                                ),
                              ),
                            )
                    ],
                  ),
                ),
                SizedBox(
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
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          height: 40,
                          alignment: Alignment.center,
                          child: Text(
                            "Tổng quát",
                            style: GoogleFonts.inter(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: i == 0
                                    ? const Color.fromRGBO(23, 161, 250, 0.8)
                                    : const Color.fromRGBO(0, 0, 0, 0.6)),
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
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          height: 40,
                          alignment: Alignment.center,
                          child: Text(
                            "Bài học",
                            style: GoogleFonts.inter(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: i == 1
                                    ? const Color.fromRGBO(23, 161, 250, 0.8)
                                    : const Color.fromRGBO(0, 0, 0, 0.6)),
                          ),
                        ),
                      ),
                      // InkWell(
                      //   onTap: () {
                      //     setState(() {
                      //       i = 2;
                      //       j = 2;
                      //     });
                      //   },
                      //   child: Container(
                      //     padding: EdgeInsets.only(left: 15, right: 15),
                      //     height: 40,
                      //     alignment: Alignment.center,
                      //     child: Text(
                      //       "Bài tập",
                      //       style: GoogleFonts.inter(
                      //           fontSize: 20,
                      //           fontWeight: FontWeight.w500,
                      //           color: i == 2
                      //               ? Color.fromRGBO(23, 161, 250, 0.8)
                      //               : Color.fromRGBO(0, 0, 0, 0.6)),
                      //     ),
                      //   ),
                      // ),
                      // InkWell(
                      //   onTap: () {
                      //     setState(() {
                      //       i = 3;
                      //       j = 3;
                      //     });
                      //   },
                      //   child: Container(
                      //     padding: EdgeInsets.only(left: 15, right: 15),
                      //     height: 40,
                      //     alignment: Alignment.center,
                      //     child: Text(
                      //       "Tài liệu",
                      //       style: GoogleFonts.inter(
                      //           fontSize: 20,
                      //           fontWeight: FontWeight.w500,
                      //           color: i == 3
                      //               ? Color.fromRGBO(23, 161, 250, 0.8)
                      //               : Color.fromRGBO(0, 0, 0, 0.6)),
                      //     ),
                      //   ),
                      // ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            i = 4;
                            j = 4;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          height: 40,
                          alignment: Alignment.center,
                          child: Text(
                            "Học viên",
                            style: GoogleFonts.inter(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: i == 4
                                    ? const Color.fromRGBO(23, 161, 250, 0.8)
                                    : const Color.fromRGBO(0, 0, 0, 0.6)),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            i = 5;
                            j = 5;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          height: 40,
                          alignment: Alignment.center,
                          child: Text(
                            "Giáo viên",
                            style: GoogleFonts.inter(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: i == 5
                                    ? const Color.fromRGBO(23, 161, 250, 0.8)
                                    : const Color.fromRGBO(0, 0, 0, 0.6)),
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
                                ? LessonClass_Page(
                                    classRoomsOtd: widget.classRoomsOtd,
                                  )
                                :
                                // //Bài tập
                                // j == 2
                                //     ? ExerciseClass_Page()
                                //     //Tài liệu
                                //     : j == 3
                                //         ? DocumentClass_page()
                                //         :
                                //Danh sách học sinh
                                j == 4
                                    ? ListStudent_page(
                                        classRoomsOtd: widget.classRoomsOtd,
                                      )
                                    //Danh sách giáo viên
                                    : ListTeacher_page(
                                        classRoomsOtd: widget.classRoomsOtd,
                                      ))
              ]),
      ),
    );
  }
}
