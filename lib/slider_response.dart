import 'package:flutter/material.dart';

class Answer extends StatefulWidget {
  Answer({required this.setFeedbackValue, required this.initValue});
  final Function setFeedbackValue;
  final int initValue;

  @override
  _AnswerState createState() => _AnswerState();
}

class _AnswerState extends State<Answer> {
  int value = 1;

  void setValue(double temp) {
    setState(() {
      value = temp.toInt();
    });
    widget.setFeedbackValue(value);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(),
        SizedBox(
          width: 25,
        ),
        Text(value.toString()),
        Expanded(
          child: Slider(
            min: 0,
            max: 5,
            divisions: 5,
            activeColor: Colors.blue[value * 100 + 100],
            inactiveColor: Colors.amber[(6 - value) * 100 + 100],
            onChanged: (temp) {
              setValue(temp);
            },
            value: value.toDouble(),
          ),
        ),
      ],
    );
  }
}
