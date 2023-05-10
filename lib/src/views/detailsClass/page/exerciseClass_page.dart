import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../class/components/containerSearch_page.dart';
import '../components/listexerciseClass_page.dart';

class ExerciseClass_Page extends StatefulWidget {
  const ExerciseClass_Page({super.key});

  @override
  State<ExerciseClass_Page> createState() => _ExerciseClass_PageState();
}

class _ExerciseClass_PageState extends State<ExerciseClass_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ContainerSearch_Page(),
              SizedBox(
                height: 10,
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                child: ListView(
                  children: [
                    ListExerciseClass_page(),
                    ListExerciseClass_page()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
