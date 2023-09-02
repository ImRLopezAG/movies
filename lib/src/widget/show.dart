import 'package:flutter/material.dart';
import 'package:movies/src/src.dart';
import 'package:provider/provider.dart';

class ShowWidget extends StatelessWidget {
  const ShowWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ShowProvider>(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          CardSwiper(movies: provider.onDisplayShows),
          Sliders(
            title: 'Popular',
            movies: provider.popularShows,
            onNextPage: provider.infinitePopular,
          ),
        ],
      ),
    );
  }
}
