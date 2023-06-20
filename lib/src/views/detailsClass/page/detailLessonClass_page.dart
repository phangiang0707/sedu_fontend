import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quill_html_editor/quill_html_editor.dart';

import '../../../model/otd/lessonCourse.otd.dart';

class DetailLessonClass_page extends StatefulWidget {
  const DetailLessonClass_page({super.key, required this.lessonCourseOtd});
  final LessonCourseOtd lessonCourseOtd;

  @override
  State<DetailLessonClass_page> createState() => _DetailLessonClass_pageState();
}

class _DetailLessonClass_pageState extends State<DetailLessonClass_page> {
  final QuillEditorController controller = QuillEditorController();
  String txtContent = '';
  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      txtContent = widget.lessonCourseOtd.content;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                color: const Color.fromRGBO(23, 161, 250, 1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios_new_outlined,
                          color: Colors.white,
                        )),
                    Expanded(
                      child: Text(
                        widget.lessonCourseOtd.title,
                        style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Nội dung bài học",
                        style: GoogleFonts.inter(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Color.fromRGBO(0, 0, 0, 0.8)),
                      ),
                      QuillHtmlEditor(
                          text: txtContent,
                          isEnabled: false,
                          controller: controller,
                          minHeight: 700,
                          hintTextAlign: TextAlign.start,
                          padding: const EdgeInsets.only(left: 10, top: 5),
                          hintTextPadding: EdgeInsets.zero,
                          onSelectionChanged: (sel) =>
                              debugPrint('${sel.index},${sel.length}')),
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
