import 'package:flutter/material.dart';
import 'package:yamaguchi_quiz/pages/home.dart';
import 'package:yamaguchi_quiz/pages/result_page.dart';
void main() {
  runApp(MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        '/result': (context) => ResultPage(),
      }
  ));
}