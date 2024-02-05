import 'package:yamaguchi_quiz/models/problem.dart';
import 'package:yamaguchi_quiz/models/city.dart';
import 'package:yamaguchi_quiz/data/city_data.dart';
import 'dart:math';

class Quiz {
  List<Problem> problems; // クイズの質問リスト
  int currentProblemIndex = 0; // 現在の質問のインデックス
  int correctAnswers = 0; // 正解数

  Quiz(this.problems, this.currentProblemIndex, this.correctAnswers);

  void createNewProblem() {
    List<City> askedCities = problems.map((problem) => problem.correctCity)
        .toList();
    List<City> remainingCities = cities.where((city) =>
    !askedCities.contains(city)).toList();

    // pick up 1 correct city randomly
    var random = Random();
    City correctCity = remainingCities[random.nextInt(remainingCities.length)];

    // pick up 3 wrong cities randomly
    List<String> options = [];
    options.add(correctCity.displayName);
    for (var i = 0; i < 3; i++) {
      options.add(remainingCities[random.nextInt(remainingCities.length)].displayName);
    }

    Problem newProblem = Problem(correctCity, options, false);
    problems.add(newProblem);
  }

  Problem currentProblem() {
    return problems[currentProblemIndex - 1];
  }
}