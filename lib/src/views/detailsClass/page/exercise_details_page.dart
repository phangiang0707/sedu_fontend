import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dotted_border/dotted_border.dart';

class ExerciseDetails_page extends StatefulWidget {
  const ExerciseDetails_page({super.key});

  @override
  State<ExerciseDetails_page> createState() => _ExerciseDetails_pageState();
}

class _ExerciseDetails_pageState extends State<ExerciseDetails_page> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(children: [
          Container(
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
                  "Bài tập 1",
                  style: GoogleFonts.inter(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
                const SizedBox(
                  width: 1,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.only(bottom: 20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(247, 247, 247, 1),
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: const [
                        BoxShadow(
                            color: Color.fromRGBO(
                              23,
                              161,
                              250,
                              1,
                            ),
                            blurRadius: 2,
                            spreadRadius: 1,
                            offset: Offset(2, 1))
                      ]),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Lưu ý",
                          style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: const Color.fromRGBO(201, 0, 0, 1)),
                        ),
                        Text(
                          "Nộp bài theo đúng cú pháp",
                          style: GoogleFonts.inter(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        )
                      ]),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.only(bottom: 30),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(247, 247, 247, 1),
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: const [
                        BoxShadow(
                            color: Color.fromRGBO(
                              23,
                              161,
                              250,
                              1,
                            ),
                            blurRadius: 2,
                            spreadRadius: 1,
                            offset: Offset(2, 1))
                      ]),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Đề bài",
                          style: GoogleFonts.inter(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "Đề bài kiểm tra 1.pdf",
                          style: GoogleFonts.inter(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        )
                      ]),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.only(bottom: 30),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(247, 247, 247, 1),
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: const [
                        BoxShadow(
                            color: Color.fromRGBO(
                              23,
                              161,
                              250,
                              1,
                            ),
                            blurRadius: 2,
                            spreadRadius: 1,
                            offset: Offset(2, 1))
                      ]),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Nộp bài",
                              style: GoogleFonts.inter(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: const Color.fromRGBO(23, 161, 250, 1)),
                            ),
                            Container(
                              child: Row(
                                children: [
                                  Text(
                                    "Còn:",
                                    style: GoogleFonts.inter(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    " 34:35",
                                    style: GoogleFonts.inter(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        color: const Color.fromRGBO(255, 0, 0, 1)),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () {},
                          child: DottedBorder(
                              color: const Color.fromRGBO(48, 48, 48, 1),
                              dashPattern: const [10],
                              child: const SizedBox(
                                height: 60,
                                width: 320,
                                child: Icon(
                                  Icons.add,
                                  color: Color.fromRGBO(48, 48, 48, 1),
                                ),
                              )),
                        )
                      ]),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
