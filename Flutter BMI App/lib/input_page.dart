import 'package:flutter/material.dart';
import 'result_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'tile.dart';
import 'calculator.dart';
const activeColor = Color(0xFF1D1E55);
const inactiveColor = Color(0xFF111328);

class BMICalculator extends StatefulWidget {
  @override
  _BMICalculatorState createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  var currentSliderValue = 120;
  var maleInactiveColor = inactiveColor;
  var femaleInactiveColor = inactiveColor;
  var weight = 50;
  var age = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          //1st expanded
          Expanded(
              flex: 4,
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          maleInactiveColor = activeColor;
                          femaleInactiveColor = inactiveColor;
                        });
                      },
                      child: Tile(
                        content: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              FontAwesomeIcons.mars,
                              size: 80,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Male",
                              style: TextStyle(
                                fontSize: 20,
                                letterSpacing: 3,
                              ),
                            )
                          ],
                        ),
                        colour: maleInactiveColor,
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          femaleInactiveColor = activeColor;
                          maleInactiveColor = inactiveColor;
                        });
                      },
                      child: Tile(
                        content: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              FontAwesomeIcons.venus,
                              size: 80,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Female",
                              style: TextStyle(
                                fontSize: 20,
                                letterSpacing: 3,
                              ),
                            )
                          ],
                        ),
                        colour: femaleInactiveColor,
                      ),
                    ),
                  ),
                ],
              )),

          // 2nd expanded
          Expanded(
            flex: 4,
            child: Row(
              children: [
                Expanded(
                  child: Tile(
                    content: Column(
                      children: [
                        Text(
                          "Height",
                          style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 3),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              currentSliderValue.toString(),
                              style: TextStyle(fontSize: 30, letterSpacing: 3),
                            ),
                            Text(
                              "cm",
                              style: TextStyle(fontSize: 25, letterSpacing: 3),
                            ),
                          ],
                        ),
                        Slider(
                          activeColor: Colors.pink,
                          inactiveColor: Colors.grey,
                          value: currentSliderValue.toDouble(),
                          min: 120,
                          max: 220,
                          divisions: 100,
                          label: currentSliderValue.round().toString(),
                          onChanged: (double value) {
                            setState(() {
                              currentSliderValue = value.toInt();
                            });
                          },
                        ),
                      ],
                    ),
                    colour: Color(0xFF1C1C2D),
                  ),
                )
              ],
            ),
          ),

          //3rd expanded
          Expanded(
            flex: 4,
            child: Row(
              children: [
                Expanded(
                  child: Tile(
                    colour: inactiveColor,
                    content: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Weight",
                          style: TextStyle(
                            fontSize: 30,
                            letterSpacing: 3,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          weight.toString(),
                          style: TextStyle(
                            fontSize: 25,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              heroTag:'btn1',
                              onPressed: () {
                                setState(() {
                                  if (weight < 200) {
                                    weight++;
                                  }
                                });
                              },
                              child: Icon(Icons.add),
                              backgroundColor: Colors.grey,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            FloatingActionButton(
                              heroTag: 'btn2',
                              onPressed: () {
                                setState(() {
                                  if (weight > 5) {
                                    weight--;
                                  }
                                });
                              },
                              child: Icon(Icons.remove),
                              backgroundColor: Colors.grey,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Tile(
                    colour: inactiveColor,
                    content: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Age",
                          style: TextStyle(
                            fontSize: 30,
                            letterSpacing: 3,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          age.toString(),
                          style: TextStyle(
                            fontSize: 25,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              heroTag:"btn3",
                              onPressed: () {
                                setState(() {
                                  if (age < 110) {
                                    age++;
                                  }
                                });
                              },
                              child: Icon(Icons.add),
                              backgroundColor: Colors.grey,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            FloatingActionButton(
                              heroTag: 'btn4',
                              onPressed: () {
                                setState(() {
                                  if (age > 2) {
                                    age--;
                                  }
                                });
                              },
                              child: Icon(Icons.remove),
                              backgroundColor: Colors.grey,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          //4th expanded
          Expanded(
            flex: 2,
            child: GestureDetector(
              onTap: () {
                Calculator brain = Calculator(height: currentSliderValue,weight: weight);
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ResultPage(bmiResult: brain.calculateBMI(),resultText: brain.getResult(),interpretation: brain.getInterpretation(),);
                }));
              },
              child: Tile(
                content: Center(
                  child: Text(
                    "Calculate",
                    style: TextStyle(fontSize: 30),
                  ),
                ),
                colour: Colors.pink,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

