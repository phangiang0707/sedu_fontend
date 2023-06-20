import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controller/courses.controller.dart';
import '../../model/otd/courses.otd.dart';
import '../store/store_page.dart';
import 'components/containerCourse_page.dart';
import 'components/containerNews.dart';
import 'components/containerNotification_page.dart';
import 'components/containerTop.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({super.key});

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  CoursesOtd? coursesOtd;
  List<CoursesOtd> listCoures = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    CoursesController.fetchPosts().then((dataFromServer) {
      setState(() {
        listCoures = dataFromServer;
      });
    });
    print("Số khóa học ${listCoures.length}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          CoursesController.fetchPosts().then((dataFromServer) {
            setState(() {
              listCoures = dataFromServer;
            });
          });
        },
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const ContainerTop(),
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
                              color: const Color.fromRGBO(0, 99, 163, 1),
                              fontSize: 24,
                              fontWeight: FontWeight.w700),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Store_page(),
                                ));
                          },
                          child: Container(
                            child: Row(
                              children: [
                                Text(
                                  "Tất cả",
                                  style: GoogleFonts.inter(
                                      color:
                                          const Color.fromRGBO(23, 161, 250, 1),
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

                    SizedBox(
                      height: 210,
                      child: ListView(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        children: listCoures
                            .map((e) => ContainerCourse_Page(
                                  coursesOtd: e,
                                ))
                            .toList(),
                      ),
                    ),
                    //Thông báo
                    Row(
                      children: [
                        const Icon(
                          Icons.notifications_active_outlined,
                          color: Color.fromRGBO(0, 99, 163, 1),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Thông báo",
                          style: GoogleFonts.inter(
                              color: const Color.fromRGBO(0, 99, 163, 1),
                              fontSize: 24,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),

                    const SizedBox(
                      height: 10,
                    ),
                    const ContainerNotification_Page(),
                    const ContainerNotification_Page(),
                    const SizedBox(
                      height: 10,
                    ),
                    //Lịch
                    Row(
                      children: [
                        const Icon(
                          Icons.calendar_month_outlined,
                          color: Color.fromRGBO(0, 99, 163, 1),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Lịch",
                          style: GoogleFonts.inter(
                              color: const Color.fromRGBO(0, 99, 163, 1),
                              fontSize: 24,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const InkWell(child: Icon(Icons.arrow_back_ios)),
                        Text(
                          "25/04",
                          style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: const Color.fromRGBO(0, 0, 0, 1)),
                        ),
                        const InkWell(child: Icon(Icons.arrow_forward_ios)),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    //ContainerCalendar_Page(),
                    const SizedBox(
                      height: 10,
                    ),
                    //Tin tức
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              const Icon(
                                Icons.notifications_active_outlined,
                                color: Color.fromRGBO(0, 99, 163, 1),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Tin tức",
                                style: GoogleFonts.inter(
                                    color: const Color.fromRGBO(0, 99, 163, 1),
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
                                      color:
                                          const Color.fromRGBO(23, 161, 250, 1),
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
                    const ContainerNews_Page(),
                    const ContainerNews_Page(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
