import 'package:flutter/material.dart';
import 'package:yamaguchi_quiz/models/quiz.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizState();
}

class _QuizState extends State<QuizPage> {
  late Quiz quiz;

  @override
  void initState() {
    super.initState();
    // Quiz インスタンスを作成
    quiz = Quiz([], 1, 0);
    quiz.createNewProblem();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage('assets/${quiz.currentProblem().correctCity.name}.png'),
              height: 150.0,
            ),
            SizedBox(height: 40.0),
            GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 20.0,
              mainAxisSpacing: 20.0,
              shrinkWrap: true,
              children: quiz.currentProblem().options.map((option) =>
                  buildElevatedButton(option, () {
                    setState(() {
                      quiz.createNewProblem();
                      quiz.currentProblemIndex++;
                    });
                  })
              ).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildElevatedButton(String label, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: Colors.blue,
        onPrimary: Colors.white,
        fixedSize: Size(200.0, 60.0), // ボタンを横長に変更
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 5.0,
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}