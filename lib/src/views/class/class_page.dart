import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sedu_fontend/src/views/class/components/containerSearch_page.dart';

class Class_Page extends StatefulWidget {
  const Class_Page({super.key});

  @override
  State<Class_Page> createState() => _Class_PageState();
}

class _Class_PageState extends State<Class_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [ContainerSearch_Page()],
          ),
        ),
      ),
    );
  }
}
