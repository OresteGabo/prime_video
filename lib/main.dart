import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:prime_video_clone/screens/main_page.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prime_video_clone/widgets/movie_card.dart';
import 'package:prime_video_clone/screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Prime video clone app',
      theme: ThemeData(
        tabBarTheme: const TabBarTheme(
          labelColor: Colors.white,
          unselectedLabelColor: Color(0xff56656B),
          indicator: UnderlineTabIndicator(
            borderSide: BorderSide(
              width: 5.0,
              color: Colors.white,
            ),
            //insets: EdgeInsets.symmetric(horizontal: 16.0),
          ),
        ),
        //indicatorSize: TabBarIndicatorSize.values(2)),
        appBarTheme: const AppBarTheme(
          color: Color(0xff0E171E),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Color(0xff0E171E),
          selectedItemColor: Colors.blue,
          unselectedItemColor: Color(0xff3F5266),
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedIconTheme: IconThemeData(size: 34),
          unselectedIconTheme: IconThemeData(size: 34),
        ),
        scaffoldBackgroundColor: const Color(0xff0E171E),
        textTheme: const TextTheme(),
      ),
      home: const DefaultTabController(length: 5, child: MainPage()),
    );
  }
}
