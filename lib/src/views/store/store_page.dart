import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sedu_fontend/src/model/otd/courses.otd.dart';

import '../../controller/courses.controller.dart';
import 'components/containerCourse_page.dart';

class Store_page extends StatefulWidget {
  const Store_page({super.key});

  @override
  State<Store_page> createState() => _Store_pageState();
}

class _Store_pageState extends State<Store_page> {
  CoursesController? coursesController;
  CoursesOtd? coursesOtd;
  List<CoursesOtd> listCoures = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    coursesController = CoursesController();
    CoursesController.fetchPosts().then((dataFromServer) {
      setState(() {
        listCoures = dataFromServer;
      });
      print("aaaaaaaaaaaaaaaaa ${dataFromServer.length}");
    });
    print("aaaaaaaaaaaaaaaaa ${listCoures.length}");
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: "Tìm kiếm",
                      border: InputBorder.none,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 1,
                            color:
                                Color.fromRGBO(23, 161, 250, 1)), //<-- SEE HERE
                        borderRadius: BorderRadius.circular(15),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 1, color: Color.fromRGBO(23, 161, 250, 1)),
                        borderRadius: BorderRadius.circular(15),
                      )),
                  style: GoogleFonts.inter(
                      fontSize: 18, fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Icon(
                    Icons.filter_alt_outlined,
                    size: 24,
                    color: Color.fromRGBO(0, 0, 0, 0.7),
                  ),
                ),
                listCoures != null
                    ? Wrap(
                        children: listCoures
                            .map((e) => ContainerCourse_page(coursesOtd: e))
                            .toList())
                    : Center(
                        child: CircularProgressIndicator(),
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
