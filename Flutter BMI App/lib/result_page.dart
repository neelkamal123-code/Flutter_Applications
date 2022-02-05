import 'package:flutter/material.dart';
import 'tile.dart';

class ResultPage extends StatelessWidget {
  @override
  final bmiResult;
  final resultText;
  final interpretation;

  ResultPage({this.bmiResult, this.resultText, this.interpretation});

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 1,
              child: Text(
                "Your Result",
                style: TextStyle(fontSize: 55, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              flex: 6,
              child: Tile(
                colour: Color(0xFF111328),
                content: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      resultText.toUpperCase(),
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.greenAccent),
                    ),
                    SizedBox(height: 30,),
                    Text(
                      bmiResult,
                      style: TextStyle(
                        fontSize: 70,
                        fontWeight: FontWeight.bold

                      ),
                    ),
                    SizedBox(height: 20,),
                    Text(
                      "Normal BMI range:",
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.grey,
                        letterSpacing: 2
                      ),
                    ),
                    Text(
                      "18.5 to 25 kg/m2",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1
                      ),
                    ),
                    SizedBox(height: 30,),
                    Container(
                      width: 320,
                      child: Text(
                        interpretation,
                        style: TextStyle(
                          fontSize: 15,
                          letterSpacing: 2
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Tile(
                  colour: Colors.pink,
                  content: Center(
                    child: Text(
                      "Re-Calculate BMI",
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
