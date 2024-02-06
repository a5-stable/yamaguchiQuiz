import 'package:flutter/material.dart';
import 'package:yamaguchi_quiz/models/quiz.dart';
import 'package:yamaguchi_quiz/models/problem.dart';


class ResultPage extends StatefulWidget {
  const ResultPage({super.key});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context)!.settings.arguments as Map;
    Quiz quiz = data['quiz'];
    List<Problem> problems = quiz.problems;

    return Scaffold(
      appBar: AppBar(
        title: Text('クイズ結果'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '結果一覧',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: quiz.problems.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('${problems[index].correctCity.displayName}の位置'),
                            content: Column(
                              children: [
                                Image(
                                  image: AssetImage('assets/${problems[index].correctCity.name}.png'),
                                ),
                              ],
                            ),
                            actions: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('閉じる'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: ListTile(
                      leading: Icon(
                        problems[index].isCorrect ? Icons.check_circle : Icons.cancel,
                        color: problems[index].isCorrect ? Colors.green : Colors.red,
                      ),
                      title: Text(
                        'Q${index + 1}: ${problems[index].isCorrect ? '正解' : '不正解'}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: problems[index].isCorrect ? Colors.green : Colors.red,
                        ),
                      ),
                      subtitle: problems[index].isCorrect
                          ? Text('正解: ${problems[index].correctCity.displayName}')
                          : Text('正解: ${problems[index].correctCity.displayName} / 選択: ${problems[index].answeredCityName}'),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 16),
            Text(
              '合計正解数: ${quiz.correctAnswers} / 10',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
