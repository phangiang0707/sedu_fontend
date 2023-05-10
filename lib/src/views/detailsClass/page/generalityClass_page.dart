import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../home/components/containerCalendar_page.dart';
import '../../home/components/containerNotification_page.dart';

class GeneralityClass_Page extends StatefulWidget {
  const GeneralityClass_Page({super.key});

  @override
  State<GeneralityClass_Page> createState() => _GeneralityClass_PageState();
}

class _GeneralityClass_PageState extends State<GeneralityClass_Page> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            children: [
              Expanded(
                  child: ListTile(
                leading: Icon(Icons.calendar_month_outlined),
                title: Text(
                  "Ngày bắt đầu",
                  style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(0, 0, 0, 0.6)),
                ),
                subtitle: Text(
                  "26/04/2023",
                  style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(0, 0, 0, 0.8)),
                ),
              )),
              Expanded(
                  child: ListTile(
                leading: Icon(Icons.tag_outlined),
                title: Text(
                  "Mã lớp",
                  style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(0, 0, 0, 0.6)),
                ),
                subtitle: Text(
                  "123",
                  style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(0, 0, 0, 0.8)),
                ),
              ))
            ],
          ),
          Row(
            children: [
              Expanded(
                  child: ListTile(
                leading: Icon(Icons.add_to_photos_outlined),
                title: Text(
                  "Môn học",
                  style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(0, 0, 0, 0.6)),
                ),
                subtitle: Text(
                  "Java cơ bản",
                  style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(0, 0, 0, 0.8)),
                ),
              )),
              Expanded(
                  child: ListTile(
                leading: Icon(Icons.timer_outlined),
                title: Text(
                  "Thời lượng",
                  style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(0, 0, 0, 0.6)),
                ),
                subtitle: Text(
                  "45 phút",
                  style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(0, 0, 0, 0.8)),
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
                        color: Color.fromRGBO(23, 161, 250, 1))),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 40,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: Text("Thứ 2"),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: Text("Thứ 3"),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: Text("Thứ 4"),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: Text("Thứ 5"),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: Text("Thứ 6"),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: Text("Thứ 7"),
                        ),
                      ),
                    ],
                  ),
                ),
                ContainerCalendar_Page(),
                ContainerCalendar_Page(),
//Thông báo
                Text("Thông báo",
                    style: GoogleFonts.inter(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: Color.fromRGBO(23, 161, 250, 1))),
                ContainerNotification_Page(),
                ContainerNotification_Page(),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
