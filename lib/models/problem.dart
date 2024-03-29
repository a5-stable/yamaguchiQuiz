import 'dart:ffi';
import 'package:yamaguchi_quiz/models/city.dart';

class Problem {
  City correctCity;
  List<String> options;
  String answeredCityName;
  bool isCorrect;

  Problem(this.correctCity, this.options, this.answeredCityName, this.isCorrect);

  bool checkAnswer(String selectedCityName) {
    if (selectedCityName == correctCity.name) {
      isCorrect = true;
      return true;
    } else {
      isCorrect = false;
      return false;
    }
  }
}