import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContainerCalendar_Page extends StatefulWidget {
  const ContainerCalendar_Page({super.key});

  @override
  State<ContainerCalendar_Page> createState() => _ContainerCalendar_PageState();
}

class _ContainerCalendar_PageState extends State<ContainerCalendar_Page> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
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
                      "07:15 - 15:15",
                      style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(255, 0, 0, 1)),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Java cơ bản\nJava cơ bản",
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
