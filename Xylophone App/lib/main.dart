import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'myContainers.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Xylophone",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Xylophone"),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Container(
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                 child:  myContainer(colour: Colors.pink,sound: "note1",),
                ),
                Expanded(
                  child:  myContainer(colour:Colors.yellow,sound: "note2"),
                ),
                Expanded(
                  child:  myContainer(colour:Colors.greenAccent,sound: "note3"),
                ),
                Expanded(
                  child:  myContainer(colour:Colors.orange,sound: "note4"),
                ),
                Expanded(
                  child:  myContainer(colour:Colors.black,sound: "note5"),
                ),
                Expanded(
                  child:  myContainer(colour:Colors.purple,sound: "note6"),
                ),
                Expanded(
                  child:  myContainer(colour:Colors.amber,sound: "note7"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
