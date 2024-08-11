import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie/pages/detail_movie.dart';
import 'package:flutter_movie/widgets/constants.dart';

class NowPlayingSliders extends StatelessWidget {
  const NowPlayingSliders({super.key, required this.snapshot});

  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CarouselSlider.builder(
          // the number we set for now playing just 6
          itemCount: 6,
          options: CarouselOptions(
              // this is for setting carousel slider
              height: 500,
              autoPlay: true,
              viewportFraction: 0.55,
              enlargeCenterPage: true,
              pageSnapping: true,
              autoPlayCurve: Curves.fastOutSlowIn,
              autoPlayAnimationDuration: const Duration(seconds: 1)),
          itemBuilder: (context, itemIndex, pageViewIndex) {
            // the image movie function when we tap it
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailMovie(
                      movie: snapshot.data[itemIndex],
                    ),
                  ),
                );
              },
              child: ClipRRect(
                child: SizedBox(
                  width: 300,
                  // the image get from API from constants and model class
                  child: Image.network(
                      filterQuality: FilterQuality.high,
                      fit: BoxFit.cover,
                      '${Constants.ImagePath}${snapshot.data[itemIndex].posterPath}'),
                ),
              ),
            );
          }),
    );
  }
}
