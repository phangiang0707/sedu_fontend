import 'package:flutter/material.dart';
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
  CoursesOtd? coursesOtd;
  List<CoursesOtd> listCoures = [];
  List<CoursesOtd> _listCouresDisplay = [];
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    CoursesController.fetchPosts().then((dataFromServer) {
      setState(() {
        listCoures = dataFromServer;
        _listCouresDisplay = listCoures;
      });
    });
    print("Số khóa học ${listCoures.length}");
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
          child: RefreshIndicator(
            key: _refreshIndicatorKey,
            onRefresh: () async {
              CoursesController.fetchPosts().then((dataFromServer) {
                setState(() {
                  listCoures = dataFromServer;
                  _listCouresDisplay = listCoures;
                });
              });
            },
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          onChanged: (text) {
                            text = text.toLowerCase();
                            setState(() {
                              _listCouresDisplay = listCoures.where((element) {
                                var postitle = element.name.toLowerCase();
                                return postitle.contains(text);
                              }).toList();
                            });
                          },
                          decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.search),
                              hintText: "Tìm kiếm",
                              border: InputBorder.none,
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 1,
                                    color: Color.fromRGBO(
                                        23, 161, 250, 1)), //<-- SEE HERE
                                borderRadius: BorderRadius.circular(15),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 1,
                                    color: Color.fromRGBO(23, 161, 250, 1)),
                                borderRadius: BorderRadius.circular(15),
                              )),
                          style: GoogleFonts.inter(
                              fontSize: 18, fontWeight: FontWeight.w400),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      IconButton(
                          onPressed: () {
                            _refreshIndicatorKey.currentState?.show();
                          },
                          icon: Icon(Icons.replay_outlined,
                              size: 24,
                              color: Color.fromRGBO(
                                23,
                                161,
                                250,
                                1,
                              )))
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Align(
                    alignment: Alignment.centerRight,
                    child: Icon(
                      Icons.filter_alt_outlined,
                      size: 24,
                      color: Color.fromRGBO(0, 0, 0, 0.7),
                    ),
                  ),
                  _listCouresDisplay != null
                      ? Wrap(
                          spacing: 20,
                          runSpacing: 10,
                          children: _listCouresDisplay
                              .map((e) => ContainerCourse_page(coursesOtd: e))
                              .toList())
                      : const Center(
                          child: CircularProgressIndicator(),
                        )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
