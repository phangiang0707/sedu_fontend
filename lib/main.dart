import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sedu_fontend/src/model/sponsorModel.dart';
import 'package:sedu_fontend/src/views/dashboard.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyHomePage());
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => SponsorModel())],
      child: MaterialApp(
          theme: ThemeData(backgroundColor: Colors.white),
          debugShowCheckedModeBanner: false,
          home: SafeArea(child: Dashboard_page())),
    );
  }
}
