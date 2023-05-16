import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContainerNotification_Page extends StatefulWidget {
  const ContainerNotification_Page({super.key});

  @override
  State<ContainerNotification_Page> createState() =>
      _ContainerNotification_PageState();
}

class _ContainerNotification_PageState
    extends State<ContainerNotification_Page> {
  @override
  Widget build(BuildContext context) {
    return Container(
        //height: 90,
        padding: const EdgeInsets.only(bottom: 5),
        margin: const EdgeInsets.only(top: 10),
        decoration: const BoxDecoration(
            border: Border(
                bottom: BorderSide(color: Color.fromRGBO(23, 161, 250, 0.5)))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Nội dung thông báo\naaaa",
              style: GoogleFonts.inter(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: const Color.fromRGBO(0, 0, 0, 1)),
            ),
            Container(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "bởi sEdu",
                      style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: const Color.fromRGBO(0, 0, 0, 0.7)),
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.timer_sharp,
                          size: 18,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Deadline 1/1/2024",
                          style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: const Color.fromRGBO(0, 0, 0, 0.7)),
                        )
                      ],
                    )
                  ]),
            )
          ],
        ));
  }
}
