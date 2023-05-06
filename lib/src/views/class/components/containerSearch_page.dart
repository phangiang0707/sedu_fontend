import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

class ContainerSearch_Page extends StatefulWidget {
  const ContainerSearch_Page({super.key});

  @override
  State<ContainerSearch_Page> createState() => _ContainerSearch_PageState();
}

class _ContainerSearch_PageState extends State<ContainerSearch_Page> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.search),
            hintText: "Tìm kiếm",
            border: InputBorder.none,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  width: 1,
                  color: Color.fromRGBO(23, 161, 250, 1)), //<-- SEE HERE
              borderRadius: BorderRadius.circular(15),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(width: 1, color: Color.fromRGBO(23, 161, 250, 1)),
              borderRadius: BorderRadius.circular(15),
            )),
        style: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.w400),
      ),
    );
  }
}
