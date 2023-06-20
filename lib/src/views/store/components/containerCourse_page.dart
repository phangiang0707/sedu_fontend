import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sedu_fontend/src/model/otd/courses.otd.dart';

import '../../../controller/writemoney.controller.dart';
import '../../../utils/url.dart';
import '../detailCourse_page.dart';

class ContainerCourse_page extends StatefulWidget {
  const ContainerCourse_page({Key? key, required this.coursesOtd})
      : super(key: key);
  final CoursesOtd coursesOtd;
  @override
  State<ContainerCourse_page> createState() => _ContainerCourse_pageState();
}

class _ContainerCourse_pageState extends State<ContainerCourse_page> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailCourse_page(
                      id: widget.coursesOtd.id,
                    )));
        print("bbbbbbbbbbbbbbbbbbbbb${widget.coursesOtd.id}");

        print(widget.coursesOtd.imageUrl);
      },
      child: Container(
        decoration: BoxDecoration(
            color: const Color.fromRGBO(255, 255, 255, 1),
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                  color: Color.fromRGBO(23, 161, 250, 1),
                  blurRadius: 2,
                  spreadRadius: 1,
                  offset: Offset(2, 1))
            ]),
        //height: 185,
        width: 150,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            height: 100,
            width: 150,
            child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                child: widget.coursesOtd.imageUrl == ""
                    ? Image.asset('images/backgroud.png')
                    : Image.network(
                        widget.coursesOtd.imageUrl,
                        fit: BoxFit.cover,
                      )),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 50,
                  child: Text(
                    widget.coursesOtd.name,
                    style: GoogleFonts.inter(
                        fontSize: 16, fontWeight: FontWeight.w600),
                    maxLines: 2,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${widget.coursesOtd.startDate.day}/${widget.coursesOtd.startDate.month}/${widget.coursesOtd.startDate.year}",
                          style: GoogleFonts.inter(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: const Color.fromRGBO(0, 0, 0, 0.8)),
                        ),
                        Text(
                          WriteMoney()
                              .writedMoney("${widget.coursesOtd.price}"),
                          style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: const Color.fromRGBO(255, 0, 0, 0.8)),
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
