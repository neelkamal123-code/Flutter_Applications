import 'package:flutter/material.dart';
import 'package:wallpaper_app/data/data.dart';
import 'dart:convert';
import 'package:wallpaper_app/models/categories_model.dart';
import 'package:wallpaper_app/views/fullscreen.dart';
import 'package:wallpaper_app/widget/widget.dart';
import 'package:http/http.dart' as http;
Widget brandName() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: const [
      Text(
        "Wallpaper",
        style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30),
      ),
      Text(
        "Hub",
        style: TextStyle(color: Colors.blue,fontSize: 30),
      )
    ],
  );
}

Future getTrendingWallpapers(String url) async {
  List images = [];
  var response = await http.get(
      Uri.parse(url),
      headers: {"Authorization": ApiKey});
  Map result = jsonDecode(response.body);
    images = result["photos"];
    return images;
}

Future<List> loadMore(String url,List images,int pageNo) async {
    pageNo = pageNo + 1;
  String newurl = url+"&page=" +
      pageNo.toString();
  var response =
  await http.get(Uri.parse(newurl), headers: {"Authorization": ApiKey});
  Map result = jsonDecode(response.body);
  images.addAll(result["photos"]);
  return images;
}