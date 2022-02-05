import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

class myContainer extends StatelessWidget{
  Color colour;
  String sound;
  myContainer({this.colour,this.sound});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: (){
        final player = AudioCache();
        player.play('$sound.wav');
      },
      child: Container(
        width: double.infinity,
        color: colour,
      ),
    );
  }
}