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
        scaffoldBackgroundColor: const Color(0xff0E171E),
        textTheme: const TextTheme(),
      ),
      home: const DefaultTabController(length: 5, child: MyHomePage()),
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
  List<MovieItem> movieItems = [
    MovieItem(),
    MovieItem(),
    MovieItem(),
    MovieItem(),
    MovieItem(),
    MovieItem(),
    MovieItem(),
    MovieItem(),
  ];
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
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            MovieListType(title: 'Continue watching', movieItems: movieItems),
            MovieListType(
              title: 'Amazon originals and Exclusives',
              includedPrime: true,
              movieItems: movieItems,
            ),
            MovieListType(
              title: 'Movies we think yu\'ll like',
              includedPrime: true,
              movieItems: movieItems,
            ),
            MovieListType(
              title: 'Categories',
              movieItems: movieItems,
            ),
            MovieListType(
              title: 'Current trending',
              movieItems: movieItems,
            ),
            MovieListType(
              title: 'Thriller Movies',
              includedPrime: true,
              movieItems: movieItems,
            ),
            MovieListType(
              title: 'Action and Adventure movies',
              includedPrime: true,
              movieItems: movieItems,
            ),
          ],
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

class MovieListType extends StatelessWidget {
  bool includedPrime;
  List<MovieItem> movieItems;
  final String title;
  MovieListType(
      {Key? key,
      this.includedPrime = false,
      required this.title,
      required this.movieItems})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 26.0, left: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 6,
          ),
          includedPrime
              ? const Text(
                  'Included with prime',
                  style: TextStyle(color: Colors.blue, fontSize: 12),
                )
              : Container(),
          GestureDetector(
            onTap: () {},
            child: Row(
              children: [
                Text(
                  title,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                  size: 10,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 6,
          ),
          MoviesList(
            movieItems: movieItems,
          )
        ],
      ),
    );
  }
}

class MoviesList extends StatelessWidget {
  List<MovieItem> movieItems;
  MoviesList({Key? key, required this.movieItems}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: movieItems,
      ),
    );
  }
}

class MovieItem extends StatelessWidget {
  const MovieItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      width: 160,
      height: 100,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fitWidth,
          image: NetworkImage(
              'https://cdn.cfr.org/sites/default/files/styles/slide_3_2/public/image/2021/09/cfr_watersedge_9.11_series_900x600_post.5-b2.png.webp'),
        ),
      ),
    );
  }
}
