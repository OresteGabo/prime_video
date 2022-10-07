import 'package:flutter/material.dart';
import 'package:prime_video_clone/widgets/movie_card.dart';
import 'package:prime_video_clone/widgets/movies_scrollable_list.dart';

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
