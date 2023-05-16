import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../controller/writemoney.controller.dart';
import '../../../model/otd/courses.otd.dart';
import '../../../utils/url.dart';
import '../../store/detailCourse_page.dart';

class ContainerCourse_Page extends StatefulWidget {
  const ContainerCourse_Page({super.key, required this.coursesOtd});

  final CoursesOtd coursesOtd;
  @override
  State<ContainerCourse_Page> createState() => _ContainerCourse_PageState();
}

class _ContainerCourse_PageState extends State<ContainerCourse_Page> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    DetailCourse_page(id: widget.coursesOtd.id)));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(23, 161, 250, 1),
              spreadRadius: 1,
              blurRadius: 2,
              offset: Offset(0, 2),
            ),
          ],
        ),
        margin: const EdgeInsets.only(right: 20, bottom: 10),
        width: 160,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
                child: widget.coursesOtd.imageUrl == null
                    ? Image.asset('images/image1.png')
                    : Image(
                        image:
                            NetworkImage('${url}${widget.coursesOtd.imageUrl}'),
                      )),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${widget.coursesOtd.name}",
                        style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                      Container(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${widget.coursesOtd.startDate.day}/${widget.coursesOtd.startDate.month}/${widget.coursesOtd.startDate.year}/",
                                style: GoogleFonts.inter(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: const Color.fromRGBO(0, 0, 0, 0.8)),
                              ),
                              Text(
                                  " ${WriteMoney().writedMoney(widget.coursesOtd.price.toString())}",
                                  style: GoogleFonts.inter(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color:
                                          const Color.fromRGBO(255, 0, 0, 0.8)))
                            ]),
                      )
                    ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
