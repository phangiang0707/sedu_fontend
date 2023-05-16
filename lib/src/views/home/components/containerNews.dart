import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContainerNews_Page extends StatefulWidget {
  const ContainerNews_Page({super.key});

  @override
  State<ContainerNews_Page> createState() => _ContainerNews_PageState();
}

class _ContainerNews_PageState extends State<ContainerNews_Page> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 5, 20, 10),
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color.fromRGBO(23, 161, 250, 1)),
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(23, 161, 250, 1),
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(0, 2),
          ),
        ],
      ),
      //height: 300,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset('images/image1.png')),
              Text(
                'Share4happy',
                style: GoogleFonts.inter(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: const Color.fromRGBO(255, 0, 0, 1)),
              ),
              const SizedBox(
                height: 5,
              ),
              Text("Điện tăng, giá hàng hóa có tăng?",
                  style: GoogleFonts.inter(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: const Color.fromRGBO(0, 0, 0, 1))),
            ]),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [Icon(Icons.timer_outlined), Text("15 giờ trước")],
          )
        ],
      ),
    );
  }
}
