import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
        scaffoldBackgroundColor: Color(0xff0E171E),
        textTheme: TextTheme(),
      ),
      home: DefaultTabController(length: 5, child: const MyHomePage()),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  bool _freeToMe = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Transform.scale(
          scale: 1.5,
          alignment: Alignment.centerLeft,
          child: SvgPicture.network(
            'https://upload.wikimedia.org/wikipedia/commons/1/11/Amazon_Prime_Video_logo.svg',
            semanticsLabel: 'Prime video logo',
            color: Colors.white,
          ),
        ),
        actions: [
          Row(
            children: [
              const Text('Free to me'),
              Transform.scale(
                scale: 0.7,
                child: CupertinoSwitch(
                  activeColor: Colors.blue,
                  value: _freeToMe,
                  onChanged: (bool value) {
                    setState(() {
                      _freeToMe = value;
                    });
                  },
                ),
              ),
            ],
          ),
        ],
        bottom: const TabBar(
          padding: EdgeInsets.only(left: 25),
          tabs: [
            Tab(text: 'Home'),
            Tab(text: 'TV Shows'),
            Tab(text: 'Movies'),
            Tab(text: 'Kids'),
            Tab(text: 'Originals'),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
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
        currentIndex: _selectedIndex,

        //selectedItemColor: Colors.amber[800],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
