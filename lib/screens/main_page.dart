import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prime_video_clone/screens/home_page.dart';
import 'package:prime_video_clone/screens/downloads_page.dart';
import 'package:prime_video_clone/screens/store_page.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var _currentIndex = 0;

  final _children = [
    Builder(builder: (_) => const MyHomePage()),
    Builder(builder: (_) => const StorePage()),
    Builder(builder: (_) => const DownloadsPage()),
    Builder(builder: (_) => const MyHomePage()),
    Builder(builder: (_) => const MyHomePage())
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: bottomNavigationBar(),
    );
  }

  BottomNavigationBar bottomNavigationBar() {
    //int selectedIndex = 0;
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home_outlined,
          ),
          label: 'Home',
          backgroundColor: Colors.black,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: 'Store',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Find',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.download),
          label: 'Downloads',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_box),
          label: 'My Stuff',
        ),
      ],
      backgroundColor: Colors.black,
      currentIndex: _currentIndex,
      onTap: onTabTapped,
    );
  }

  void onTabTapped(int index) {
    print('tab $index was pressed');
    setState(() {
      _currentIndex = index;
    });
  }
}
