import 'package:flutter/material.dart';
import 'package:movies/src/src.dart';
import 'package:provider/provider.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MovieProvider>(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          CardSwiper(movies: provider.onDisplayMovies),
          Sliders(
            title: 'Popular',
            movies: provider.popularMovies,
            onNextPage: provider.infinitePopular,
          ),
        ],
      ),
    );
  }
}