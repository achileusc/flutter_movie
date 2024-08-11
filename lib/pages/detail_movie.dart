// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_movie/models/movie.dart';
import 'package:flutter_movie/widgets/constants.dart';
// import 'package:flutter_movie/widgets/state_recommendations.dart';
// import 'package:http/http.dart';

// this class for show detail movie but only until overview because for get some similar movies from the api can't get it with the function
class DetailMovie extends StatelessWidget {
  DetailMovie({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final Movie movie;

  // late Future<List<Movie>> recState;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            leading: Container(
              height: 70,
              width: 70,
              margin: const EdgeInsets.only(top: 16, left: 24),
              decoration: const BoxDecoration(
                color: Colors.transparent,
              ),
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_rounded)),
            ),
            expandedHeight: 350,
            pinned: true,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              background: ClipRRect(
                child: Image.network(
                  '${Constants.ImagePath}${movie.backDropPath}',
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title,
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.w600),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    movie.overview,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w400),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    'Similar Movie',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  // SizedBox(
                  //   child: FutureBuilder(
                  //       future: recState,
                  //       builder: (context, snapshot) {
                  //         if (snapshot.hasError) {
                  //           return Center(
                  //               child: Text(snapshot.error.toString()));
                  //         } else if (snapshot.hasData) {
                  //           return StateRecommendation(snapshot: snapshot);
                  //         } else {
                  //           return const Center(
                  //             child: CircularProgressIndicator(),
                  //           );
                  //         }
                  //       }),
                  // )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
