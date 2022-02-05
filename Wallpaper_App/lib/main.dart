//@dart=2.9

import 'package:flutter/material.dart';
import 'package:wallpaper_app/views/home.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WallpaperHub',
      theme: ThemeData.dark(),
      home: Home(),
    );
  }
}

