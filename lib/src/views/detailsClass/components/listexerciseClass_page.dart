import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../page/exercise_details_page.dart';

class ListExerciseClass_page extends StatefulWidget {
  const ListExerciseClass_page({super.key});

  @override
  State<ListExerciseClass_page> createState() => _ListExerciseClass_pageState();
}

class _ListExerciseClass_pageState extends State<ListExerciseClass_page> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ExerciseDetails_page()));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color.fromRGBO(247, 247, 247, 1),
            boxShadow: [
              BoxShadow(
                  color: Color.fromRGBO(23, 161, 250, 1),
                  blurRadius: 2,
                  spreadRadius: 1,
                  offset: Offset(2, 1))
            ]),
        padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Bài tập 1",
                  style: GoogleFonts.inter(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromRGBO(0, 196, 43, 1),
                  ),
                  padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                  child: Text("Đã nộp"),
                )
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "bởi sEdu",
              style:
                  GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Icon(Icons.timer_outlined),
                Text(
                  "23:59:00 - 27/04/2023",
                  style: GoogleFonts.inter(
                      fontSize: 18, fontWeight: FontWeight.w500),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
