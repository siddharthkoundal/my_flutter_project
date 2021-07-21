import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';
import './sampleQuestions.dart';

void main() {
  var app = MyApp();
  runApp(app);
}

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  int currentFeedbackValue = 1;
  var questionIndex = 0;
  var totalScore = 0;

  void resetQuiz() {
    setState(() {
      questionIndex = 0;
      totalScore = 0;
    });
  }

  void answerQuestion(int sliderValue) {
    setState(() {
      totalScore = totalScore + sliderValue;
      questionIndex += 1;
    });
    print(totalScore);
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    color: Colors.redAccent,
                    onPressed: () => answerQuestion(currentFeedbackValue),
                    child: Text(
                      'Skip',
                      style: TextStyle(color: Colors.white),
                    )),
              ),
            )
          ],
          title: Text(
            'Feedback App',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Colors.red,
        ),
        body: questionIndex < questions.length
            ? Quiz(answerQuestion, questions, questionIndex)
            : Center(
                child: Result(totalScore, resetQuiz),
              ),
      ),
    );
  }
}
