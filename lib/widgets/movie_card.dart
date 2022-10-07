import 'package:flutter/material.dart';

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
