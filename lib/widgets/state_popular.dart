import 'package:flutter/material.dart';
import 'package:flutter_movie/pages/detail_movie.dart';
import 'package:flutter_movie/widgets/constants.dart';

class StatePopular extends StatelessWidget {
  const StatePopular({super.key, required this.snapshot});

  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemCount: 20,
          itemBuilder: (context, itemIndex) {
            return Padding(
              padding: const EdgeInsets.only(left: 24, top: 8),
              // the image movie function when we tap it
              child: GestureDetector(
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
                  borderRadius: BorderRadius.circular(8),
                  child: SizedBox(
                    height: 200,
                    width: 100,
                    // the image get from API from constants and model class
                    child: Image.network(
                        filterQuality: FilterQuality.high,
                        fit: BoxFit.fitHeight,
                        '${Constants.ImagePath}${snapshot.data![itemIndex].posterPath}'),
                  ),
                ),
              ),
            );
          }),
    );
  }
  // height: 200,
  // width: double.infinity,
  // child: ListView.builder(
  //     scrollDirection: Axis.horizontal,
  //     physics: const BouncingScrollPhysics(),
  //     itemCount: 20,
  //     itemBuilder: (context, index) {
  //       return Padding(
  //         padding: const EdgeInsets.only(left: 24, top: 8),
  //         child: Container(
  //           color: Colors.white,
  //           width: 250,
  //         ),
  //       );
  //     }),
}
