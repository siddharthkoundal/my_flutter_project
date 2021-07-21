import 'package:flutter/material.dart';
import 'question.dart';
import 'slider_response.dart';

class Quiz extends StatelessWidget {
  final Function answerQuestion;
  final List<String> questions;
  final int questionIndex;
  Quiz(this.answerQuestion, this.questions, this.questionIndex);
  int currentFeedbackValue = 1;

  void setFeedbackValue(int feedbackValue) {
    currentFeedbackValue = feedbackValue;
    print(currentFeedbackValue);
  }

  static const initFeedbackValue = 3;
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey[100],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Question(questions[questionIndex]),
            )),
            SizedBox(
              height: 30,
            ),
            Container(
              child: Align(
                child: Material(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(24.0),
                  child: Answer(
                    setFeedbackValue: setFeedbackValue,
                    initValue: initFeedbackValue,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0)),
                  color: Colors.redAccent,
                  child: Text(
                    'Next',
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                  ),
                  onPressed: () => answerQuestion(currentFeedbackValue),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
