import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:movies/src/src.dart';

class CardSwiper extends StatelessWidget {
  final List<Movie> movies;
  const CardSwiper({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
        height: size.height * 0.5,
        width: double.infinity,
        child: Swiper(
          itemCount: movies.length,
          layout: SwiperLayout.STACK,
          itemWidth: size.width * 0.6,
          itemHeight: size.height * 0.4,
          itemBuilder: (_, int index) {
            final movie = movies[index];
            movie.heroId = 'swiper-${movie.id}';
            return GestureDetector(
              onTap: () => Navigator.pushNamed(context, 'details',
                  arguments: movie),
              child: Hero(
                tag: movie.heroId!,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  child: FadeInImage(
                    placeholder: const AssetImage('assets/no-image.jpg'),
                    image: NetworkImage(movie.posterPath != null
                        ? 'https://image.tmdb.org/t/p/w500${movie.posterPath}'
                        : 'https://i.stack.imgur.com/GNhxO.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            );
          },
        ));
  }
}
