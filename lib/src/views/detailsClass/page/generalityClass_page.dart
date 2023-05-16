import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sedu_fontend/src/model/otd/calendarClass.otd.dart';
import 'package:sedu_fontend/src/model/otd/classRooms.otd.dart';

import '../../../controller/calendar.controller.dart';
import '../../home/components/containerCalendar_page.dart';
import '../../home/components/containerNotification_page.dart';

class GeneralityClass_Page extends StatefulWidget {
  const GeneralityClass_Page({super.key, required this.classRoomsOtd});
  final ClassRoomsOtd classRoomsOtd;
  @override
  State<GeneralityClass_Page> createState() => _GeneralityClass_PageState();
}

class _GeneralityClass_PageState extends State<GeneralityClass_Page> {
  CalendarClassController? _calendarClassController;
  List<CalendarClassOtd> listcalendarClassOtd = [];
  CalendarClassOtd? calendarClassOtd;
  int i = 0;
  void checkDay(int j) {
    calendarClassOtd = null;
    for (var element in listcalendarClassOtd) {
      if (element.day == j) {
        setState(() {
          calendarClassOtd = element;
        });
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (var element in listcalendarClassOtd) {
      if (element.day == 0) {
        setState(() {
          calendarClassOtd = element;
        });
      }
    }
    _calendarClassController = CalendarClassController();
    _calendarClassController!
        .getCalendarClass(widget.classRoomsOtd.id)
        .then((value) {
      listcalendarClassOtd = value!;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            children: [
              Expanded(
                  child: ListTile(
                leading: const Icon(Icons.calendar_month_outlined),
                title: Text(
                  "Ngày bắt đầu",
                  style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: const Color.fromRGBO(0, 0, 0, 0.6)),
                ),
                subtitle: Text(
                  "${widget.classRoomsOtd.startDate.day}/${widget.classRoomsOtd.startDate.month}/${widget.classRoomsOtd.startDate.year}",
                  style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: const Color.fromRGBO(0, 0, 0, 0.8)),
                ),
              )),
              Expanded(
                  child: ListTile(
                leading: const Icon(Icons.tag_outlined),
                title: Text(
                  "Mã lớp",
                  style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: const Color.fromRGBO(0, 0, 0, 0.6)),
                ),
                subtitle: Text(
                  widget.classRoomsOtd.code,
                  style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: const Color.fromRGBO(0, 0, 0, 0.8)),
                ),
              ))
            ],
          ),
          Row(
            children: [
              Expanded(
                  child: ListTile(
                leading: const Icon(Icons.add_to_photos_outlined),
                title: Text(
                  "Môn học",
                  style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: const Color.fromRGBO(0, 0, 0, 0.6)),
                ),
                subtitle: Text(
                  widget.classRoomsOtd.course.name,
                  style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: const Color.fromRGBO(0, 0, 0, 0.8)),
                  maxLines: 2,
                ),
              )),
              Expanded(
                  child: ListTile(
                leading: const Icon(Icons.timer_outlined),
                title: Text(
                  "Thời lượng",
                  style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: const Color.fromRGBO(0, 0, 0, 0.6)),
                ),
                subtitle: Text(
                  "45 phút",
                  style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: const Color.fromRGBO(0, 0, 0, 0.8)),
                ),
              ))
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Lịch học
                Text("Lịch học",
                    style: GoogleFonts.inter(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: const Color.fromRGBO(23, 161, 250, 1))),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 40,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            i = 0;
                          });
                          checkDay(i);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            "Thứ 2",
                            style: GoogleFonts.inter(
                                color: i == 0
                                    ? const Color.fromRGBO(23, 161, 250, 1)
                                    : const Color.fromRGBO(0, 0, 0, 0.8)),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            i = 1;
                          });

                          checkDay(i);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            "Thứ 3",
                            style: GoogleFonts.inter(
                                color: i == 1
                                    ? const Color.fromRGBO(23, 161, 250, 1)
                                    : const Color.fromRGBO(0, 0, 0, 0.8)),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            i = 2;
                          });
                          checkDay(i);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            "Thứ 4",
                            style: GoogleFonts.inter(
                                color: i == 2
                                    ? const Color.fromRGBO(23, 161, 250, 1)
                                    : const Color.fromRGBO(0, 0, 0, 0.8)),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            i = 3;
                          });
                          checkDay(i);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            "Thứ 5",
                            style: GoogleFonts.inter(
                                color: i == 3
                                    ? const Color.fromRGBO(23, 161, 250, 1)
                                    : const Color.fromRGBO(0, 0, 0, 0.8)),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            i = 4;
                          });
                          checkDay(i);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            "Thứ 6",
                            style: GoogleFonts.inter(
                                color: i == 4
                                    ? const Color.fromRGBO(23, 161, 250, 1)
                                    : const Color.fromRGBO(0, 0, 0, 0.8)),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            i = 5;
                          });
                          checkDay(i);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            "Thứ 7",
                            style: GoogleFonts.inter(
                                color: i == 5
                                    ? const Color.fromRGBO(23, 161, 250, 1)
                                    : const Color.fromRGBO(0, 0, 0, 0.8)),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            i = 6;
                          });
                          checkDay(i);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            "CN",
                            style: GoogleFonts.inter(
                                color: i == 6
                                    ? const Color.fromRGBO(23, 161, 250, 1)
                                    : const Color.fromRGBO(0, 0, 0, 0.8)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                calendarClassOtd == null
                    ? const SizedBox(
                        height: 5,
                      )
                    : ContainerCalendar_Page(
                        calendarClassOtd: calendarClassOtd!,
                        name: widget.classRoomsOtd.name,
                      ),
                // Column(
                //   children: calendarClassOtd
                //       .map(
                //         (e) => ContainerCalendar_Page(
                //           i: i,
                //           calendarClassOtd: calendarClassOtd,
                //           name: widget.classRoomsOtd.name,
                //         ),
                //       )
                //       .toList(),
                // ),

//Thông báo
                Text("Thông báo",
                    style: GoogleFonts.inter(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: const Color.fromRGBO(23, 161, 250, 1))),
                const ContainerNotification_Page(),
                const ContainerNotification_Page(),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
