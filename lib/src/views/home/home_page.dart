import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sedu_fontend/src/views/home/components/containerCourse_page.dart';

import 'components/containerCalendar_page.dart';
import 'components/containerNews.dart';
import 'components/containerNotification_page.dart';
import 'components/containerTop.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({super.key});

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            ContainerTop(),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Khóa học nổi bật",
                        style: GoogleFonts.inter(
                            color: Color.fromRGBO(0, 99, 163, 1),
                            fontSize: 24,
                            fontWeight: FontWeight.w700),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          child: Row(
                            children: [
                              Text(
                                "Tất cả",
                                style: GoogleFonts.inter(
                                    color: Color.fromRGBO(23, 161, 250, 1),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                              ),
                              const Icon(
                                Icons.navigate_next,
                                size: 20,
                                color: Color.fromRGBO(23, 161, 250, 1),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 180,
                    child: ListView(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      children: [
                        ContainerCourse_Page(),
                        ContainerCourse_Page(),
                      ],
                    ),
                  ),
                  //Thông báo
                  Row(
                    children: [
                      Icon(
                        Icons.notifications_active_outlined,
                        color: Color.fromRGBO(0, 99, 163, 1),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Thông báo",
                        style: GoogleFonts.inter(
                            color: Color.fromRGBO(0, 99, 163, 1),
                            fontSize: 24,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 10,
                  ),
                  ContainerNotification_Page(),
                  ContainerNotification_Page(),
                  SizedBox(
                    height: 10,
                  ),
                  //Lịch
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_month_outlined,
                        color: Color.fromRGBO(0, 99, 163, 1),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Lịch",
                        style: GoogleFonts.inter(
                            color: Color.fromRGBO(0, 99, 163, 1),
                            fontSize: 24,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      InkWell(child: Icon(Icons.arrow_back_ios)),
                      Text(
                        "25/04",
                        style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(0, 0, 0, 1)),
                      ),
                      InkWell(child: Icon(Icons.arrow_forward_ios)),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  //ContainerCalendar_Page(),
                  SizedBox(
                    height: 10,
                  ),
                  //Tin tức
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Icon(
                              Icons.notifications_active_outlined,
                              color: Color.fromRGBO(0, 99, 163, 1),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Tin tức",
                              style: GoogleFonts.inter(
                                  color: Color.fromRGBO(0, 99, 163, 1),
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          child: Row(
                            children: [
                              Text(
                                "Tất cả",
                                style: GoogleFonts.inter(
                                    color: Color.fromRGBO(23, 161, 250, 1),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                              ),
                              Icon(
                                Icons.navigate_next,
                                size: 20,
                                color: Color.fromRGBO(23, 161, 250, 1),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ContainerNews_Page(),
                  ContainerNews_Page(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
