import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContainerTop extends StatefulWidget {
  const ContainerTop({super.key});

  @override
  State<ContainerTop> createState() => _ContainerTopState();
}

class _ContainerTopState extends State<ContainerTop> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Image.asset('images/image1.png'),
          Positioned(
              child: Container(
            height: 150,
            margin: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                    child: Column(
                      children: [
                        Icon(Icons.live_tv_rounded),
                        Text(
                          "Live",
                          style: GoogleFonts.inter(
                              color: Color.fromRGBO(58, 58, 58, 1),
                              fontSize: 12,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                ),
                Text(
                  "Gieo ý tưởng, gặt thành công.",
                  style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
