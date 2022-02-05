import 'package:flutter/material.dart';
class Tile extends StatelessWidget {
  Tile({this.content, this.colour,this.giveHeight});
  final content;
  final colour;
  final giveHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: giveHeight,
      width: double.infinity,
      child: content,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}