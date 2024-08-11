import 'package:flutter/material.dart';
import 'package:flutter_movie/pages/home_page.dart';
import 'package:flutter_movie/pages/login_page.dart';
import 'package:flutter_movie/pages/userprofile_page.dart';
// ignore: unused_import
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      title: 'Home',
      home: const LoginPage(),
      routes: <String, WidgetBuilder>{
        // this is for navigate between page from get library
        '/home': (BuildContext context) => const HomePage(),
        '/userprofile': (BuildContext context) => const UserProfile(),
      },
    );
  }
}
