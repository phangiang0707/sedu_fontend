import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sedu_fontend/src/model/otd/calendarClass.otd.dart';

class ContainerCalendar_Page extends StatefulWidget {
  ContainerCalendar_Page(
      {super.key, required this.calendarClassOtd, required this.name});
  final CalendarClassOtd calendarClassOtd;
  final String name;
  @override
  State<ContainerCalendar_Page> createState() => _ContainerCalendar_PageState();
}

class _ContainerCalendar_PageState extends State<ContainerCalendar_Page> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
      margin: EdgeInsets.only(bottom: 10),
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color.fromRGBO(228, 228, 228, 0.2),
          border: Border.all(color: Color.fromRGBO(23, 161, 250, 0.5))),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${widget.calendarClassOtd.startTime} - ${widget.calendarClassOtd.endTime}",
                      style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(255, 0, 0, 1)),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "${widget.name}",
                      style: GoogleFonts.inter(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(0, 0, 0, 1)),
                    ),
                  ]),
            ),
            Text(
              "Giáo viên: Phan Trung Giang",
              style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color.fromRGBO(0, 0, 0, 1)),
            )
          ]),
    );
  }
}
