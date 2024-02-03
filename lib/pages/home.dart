import 'package:flutter/material.dart';
import 'package:yamaguchi_quiz/pages/quiz.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ここに画面上部に表示するウィジェットを追加
            Text(
              '山口県クイズ',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20), // 適宜スペーサーを追加
            ElevatedButton(
              onPressed: () {
                // スタートボタンが押された時の処理
                // ここで問題画面に遷移するナビゲーションを追加する
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Quiz()), // QuizScreenへの遷移
                );              },
              child: Text(
                'スタート',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
