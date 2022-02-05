import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'input_page.dart';



void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "BMI CALCULATOR",
    home: BMICalculator(),
    theme: ThemeData.dark().copyWith(
      primaryColor: Color(0xFF0A0E21),
      scaffoldBackgroundColor: Color(0xFF0A0E21),
    ),
  ));
}



