import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../model/otd/lessonCourse.otd.dart';

class ListLessonClass_page extends StatefulWidget {
  const ListLessonClass_page({super.key, required this.lessonCourseOtd});
  final LessonCourseOtd lessonCourseOtd;

  @override
  State<ListLessonClass_page> createState() => _ListLessonClass_pageState();
}

class _ListLessonClass_pageState extends State<ListLessonClass_page> {
  bool setSelector = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Row(
          children: [
            const Icon(
              Icons.book_outlined,
              size: 24,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              widget.lessonCourseOtd.title,
              style: GoogleFonts.inter(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            )
          ],
        ),
        Row(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 11, right: 11),
              color: const Color.fromRGBO(23, 161, 250, 1),
              width: 2,
              height: setSelector ? 40 * 3 : 30,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                setSelector
                    ? Row(
                        children: [
                          const Text("0 video"),
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  setSelector = false;
                                });
                              },
                              icon: const Icon(Icons.keyboard_arrow_up_outlined))
                        ],
                      )
                    : Row(children: [
                        const Text("0 video"),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                setSelector = true;
                              });
                            },
                            icon: const Icon(Icons.keyboard_arrow_down_outlined))
                      ]),
                setSelector
                    ? Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.book_outlined,
                                      size: 24,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    SizedBox(
                                      width: 200,
                                      child: Text(
                                        "Giới thiệu sơ lược về lịch sử hình thành",
                                        style: GoogleFonts.inter(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color:
                                                const Color.fromRGBO(0, 0, 0, 0.7)),
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  "15:00",
                                  style: GoogleFonts.inter(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: const Color.fromRGBO(0, 0, 0, 0.7)),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.book_outlined,
                                      size: 24,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    SizedBox(
                                      width: 200,
                                      child: Text(
                                        "Giới thiệu sơ lược về lịch sử hình thành",
                                        style: GoogleFonts.inter(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color:
                                                const Color.fromRGBO(0, 0, 0, 0.7)),
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  "15:00",
                                  style: GoogleFonts.inter(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: const Color.fromRGBO(0, 0, 0, 0.7)),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    : const SizedBox()
              ],
            ),
          ],
        )
      ]),
    );
  }
}
