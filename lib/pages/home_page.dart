import 'package:flutter/material.dart';
import 'package:flutter_movie/api/api.dart';
import 'package:flutter_movie/models/movie.dart';
import 'package:flutter_movie/widgets/state_nowPlaying.dart';
import 'package:flutter_movie/widgets/state_popular.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  // for req list data from model
  late Future<List<Movie>> nowPlaying;
  late Future<List<Movie>> popularState;

  // this state for get the data from API
  @override
  void initState() {
    super.initState();
    nowPlaying = Api().getNowPlaying();
    popularState = Api().getPopular();
  }

  get pageviewIndex => null;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'FlutMovie',
          style: TextStyle(
              fontSize: 22, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        centerTitle: true,
      ),
      // for initiating bottom navigationbar but the navigation bar can't used because the controller doesn't made for link between page
      bottomNavigationBar: Obx(
        () => NavigationBar(
            height: 80,
            elevation: 0,
            selectedIndex: controller.selectedIndex.value,
            onDestinationSelected: (index) =>
                controller.selectedIndex.value = index,
            destinations: const [
              NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
              NavigationDestination(
                  icon: Icon(Iconsax.play), label: 'TV Shows'),
              NavigationDestination(
                  icon: Icon(Iconsax.heart), label: 'Favorite'),
              NavigationDestination(
                icon: Icon(Iconsax.user),
                label: 'User',
              ),
            ]),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            // Main
            // State Now Playing
            SizedBox(
              height: 600,
              width: double.maxFinite,
              child: Column(
                children: [
                  // title
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.all(24.0),
                      child: Text(
                        'Now Playing',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  // CardSlider
                  // CarouselSlider(
                  //     items: imageSliders,
                  //     options: CarouselOptions(
                  //       autoPlay: true,
                  //       aspectRatio: 2.0,
                  //       enlargeCenterPage: true,
                  //     ))
                  SizedBox(
                    child: FutureBuilder(
                        future: nowPlaying,
                        builder: (context, snapshot) {
                          // for initiating image with animated sliders for representing what movie that playing currently
                          // and assuming get data from model that created and from API
                          if (snapshot.hasError) {
                            return Center(
                                child: Text(snapshot.error.toString()));
                          } else if (snapshot.hasData) {
                            // get layout from nowplaying class that i made
                            return NowPlayingSliders(
                              snapshot: snapshot,
                            );
                          } else {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        }),
                  )
                ],
              ),
            ),
            // State Popular
            const Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.all(24.0),
                child: Text(
                  'Popular',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
            // Card
            SizedBox(
              child: FutureBuilder(
                  future: popularState,
                  builder: (context, snapshot) {
                    // for initiating image sliders for representing what popular movie currently people saw
                    // and assuming get data from model that created and from API
                    if (snapshot.hasError) {
                      return Center(child: Text(snapshot.error.toString()));
                    } else if (snapshot.hasData) {
                      // get layout from statepopular class that i made
                      return StatePopular(
                        snapshot: snapshot,
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
            ),
            // SizedBox(
            //   height: 200,
            //   width: double.infinity,
            //   child: ListView.builder(
            //       scrollDirection: Axis.horizontal,
            //       physics: const BouncingScrollPhysics(),
            //       itemCount: 20,
            //       itemBuilder: (context, index) {
            //         return Padding(
            //           padding: const EdgeInsets.only(left: 24, top: 8),
            //           child: Container(
            //             color: Colors.white,
            //             width: 250,
            //           ),
            //         );
            //       }),
            // )
          ],
        ),
      ),
    );
  }
}

// this controller for navigating eachpage
class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [];
}
