import 'package:flutter/material.dart';
import 'package:sedu_fontend/src/views/dashboard.dart';
import 'package:sedu_fontend/src/views/menubar_page.dart';

void main() {
  runApp(const MyHomePage());
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SafeArea(child: Dashboard_page()));
  }
}
