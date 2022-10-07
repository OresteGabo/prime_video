import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prime_video_clone/widgets/movie_card.dart';
import 'package:prime_video_clone/widgets/movies_type.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
      appBar: appBar(),
      body: TabBarView(
        children: [
          homeTabView(movieItems: movieItems),
          Container(
              child: Center(
                  child: Text(
            "Tv SHOWS",
            style: TextStyle(color: Colors.white),
          ))),
          Container(
              child: Center(
                  child: Text(
            "Movies",
            style: TextStyle(color: Colors.white),
          ))),
          Container(
              child: Center(
                  child: Text(
            "Kids",
            style: TextStyle(color: Colors.white),
          ))),
          Container(
              child: Center(
                  child: Text(
            "Originals",
            style: TextStyle(color: Colors.white),
          )))
        ],
      ),
    );
  }

  AppBar appBar() {
    bool _freeToMe = false;
    return AppBar(
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
    );
  }
}

class homeTabView extends StatelessWidget {
  const homeTabView({
    Key? key,
    required this.movieItems,
  }) : super(key: key);

  final List<MovieItem> movieItems;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
    );
  }
}
