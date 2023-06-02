import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controller/detailCourses.controller.dart';
import '../../controller/lessonCourse.controller.dart';
import '../../controller/writemoney.controller.dart';
import '../../model/otd/detailCourses.otd.dart';
import '../../model/otd/lessonCourse.otd.dart';
import '../../utils/url.dart';
import '../detailsClass/components/listlessonClass_page.dart';

class DetailCourse_page extends StatefulWidget {
  const DetailCourse_page({super.key, required this.id});
  final String id;
  @override
  State<DetailCourse_page> createState() => _DetailCourse_pageState();
}

class _DetailCourse_pageState extends State<DetailCourse_page> {
  DetailCourseController? detailCourseController;
  DetailCoursesOtd? detailCoursesOtd;
  LessonCourseController? lessonCourseController;
  List<LessonCourseOtd> lessonCourseOtd = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.id);
    lessonCourseController = LessonCourseController();
    lessonCourseController!.getLessonCourses(widget.id).then((value) {
      setState(() {
        lessonCourseOtd = value!;
      });
    });
    detailCourseController = DetailCourseController();
    detailCourseController!.getDetailCourses(widget.id).then((value) {
      setState(() {
        detailCoursesOtd = value;
      });
    });
    print("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa$detailCoursesOtd");
  }

  int isSelect = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: detailCoursesOtd != null
          ? Scaffold(
              body: SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: Stack(
                  children: [
                    SizedBox(
                      height: 200,
                      width: double.infinity,
                      child: detailCoursesOtd!.imageUrl == null
                          ? Image.asset(
                              'images/image1.png',
                              fit: BoxFit.fill,
                            )
                          : Image.network(
                              detailCoursesOtd!.imageUrl,
                              fit: BoxFit.cover,
                            ),
                    ),
                    Positioned(
                        child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const Icon(
                                  Icons.arrow_back_ios_new_outlined,
                                  color: Colors.white,
                                )),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 100),
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20)),
                                color: Colors.white),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                        child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          isSelect = 0;
                                        });
                                      },
                                      child: Text(
                                        "Miêu tả",
                                        style: GoogleFonts.inter(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                            color: isSelect == 0
                                                ? const Color.fromRGBO(
                                                    23, 161, 250, 1)
                                                : const Color.fromRGBO(
                                                    0, 0, 0, 0.6)),
                                        textAlign: TextAlign.center,
                                      ),
                                    )),
                                    Expanded(
                                        child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          isSelect = 1;
                                        });
                                      },
                                      child: Text(
                                        "Lộ trình",
                                        style: GoogleFonts.inter(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                            color: isSelect == 1
                                                ? const Color.fromRGBO(
                                                    23, 161, 250, 1)
                                                : const Color.fromRGBO(
                                                    0, 0, 0, 0.6)),
                                        textAlign: TextAlign.center,
                                      ),
                                    ))
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  height: 2,
                                  width: double.infinity,
                                  color:
                                      const Color.fromRGBO(23, 161, 250, 0.6),
                                ),
                                isSelect == 0
                                    ? describeText(
                                        context,
                                        detailCoursesOtd!.name,
                                        detailCoursesOtd!.description)
                                    : lessonContainer(context, lessonCourseOtd),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ))
                  ],
                ),
              ),
              bottomNavigationBar: Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${detailCoursesOtd!.startDate.day}/${detailCoursesOtd!.startDate.month}/${detailCoursesOtd!.startDate.year} - ${detailCoursesOtd!.endDate.day}/${detailCoursesOtd!.endDate.month}/${detailCoursesOtd!.endDate.year}",
                          style: GoogleFonts.inter(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          WriteMoney()
                              .writedMoney("${detailCoursesOtd!.price}"),
                          style: GoogleFonts.inter(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: const Color.fromRGBO(255, 0, 0, 1)),
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Container(
                      height: 50,
                      width: 3,
                      color: const Color.fromRGBO(23, 161, 250, 0.6),
                    ),
                    SizedBox(
                      height: 50,
                      width: 47,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.shopping_bag_outlined,
                            size: 24,
                            color: Color.fromRGBO(23, 161, 250, 0.6),
                          ),
                          Text(
                            "Giỏ hàng",
                            style: GoogleFonts.inter(
                                fontSize: 8,
                                fontWeight: FontWeight.w400,
                                color: const Color.fromRGBO(23, 161, 250, 1)),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 50,
                      color: const Color.fromRGBO(0, 133, 255, 1),
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      alignment: Alignment.center,
                      child: Text(
                        "Mua khóa học",
                        style: GoogleFonts.inter(
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
                    )
                  ],
                ),
              ))
          : const Center(child: CircularProgressIndicator()),
    );
  }
}

Widget describeText(BuildContext context, String txtTitle, String txtDocument) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    width: double.infinity,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 5,
        ),
        Text(
          txtTitle,
          style: GoogleFonts.inter(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: const Color.fromRGBO(23, 161, 250, 1)),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          txtDocument,
          style: GoogleFonts.inter(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: const Color.fromRGBO(0, 0, 0, 0.7)),
        )
      ],
    ),
  );
}

Widget lessonContainer(
    BuildContext context, List<LessonCourseOtd> lessonCourseOtd) {
  return Container(
    margin: const EdgeInsets.only(top: 5),
    padding: const EdgeInsets.only(left: 20),
    child: SingleChildScrollView(
        child: Column(
            children: lessonCourseOtd
                .map((e) => ListLessonClass_page(
                      lessonCourseOtd: e,
                      bool: false,
                    ))
                .toList())),
  );
}
