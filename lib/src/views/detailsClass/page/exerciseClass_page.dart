import 'package:flutter/material.dart';

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
              const ContainerSearch_Page(),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height,
                child: ListView(
                  children: const [
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
