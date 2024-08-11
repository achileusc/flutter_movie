import 'package:flutter/material.dart';

import '../pages/detail_movie.dart';
import 'constants.dart';

class StateRecommendation extends StatelessWidget {
  const StateRecommendation({
    super.key,
    required this.snapshot,
  });

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
                    width: 300,
                    child: Image.network(
                        filterQuality: FilterQuality.high,
                        fit: BoxFit.cover,
                        '${Constants.ImagePath}${snapshot.data![itemIndex].posterPath}'),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
