import 'package:flutter/material.dart';
import 'movie_card.dart';

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
