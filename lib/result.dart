import 'package:feedback_app/main.dart';
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final Function fxn;
  final int finalScore;
  Result(this.finalScore, this.fxn);

  final List<Map<String, dynamic>> result = [
    {
      "resultText": "We are sorry for your inconvenience",
      "resultColor": Colors.red,
      "min": 1,
      "max": 10,
    },
    {
      "resultText": "Hope we serve you better next time",
      "resultColor": Colors.yellow,
      "min": 11,
      "max": 20,
    },
    {
      "resultText": "We hope you come back next time",
      "resultColor": Colors.green,
      "min": 21,
      "max": 30,
    },
  ];

  Map<String, dynamic> get results {
    var finalResult;
    result.forEach((result) {
      if (finalScore >= result['min'] && finalScore <= result['max']) {
        finalResult = result;
      }
    });
    return finalResult;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 300,
            child: Column(
              children: <Widget>[
                Text(
                  results['resultText'],
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: results['resultColor'],
                  ),
                  textAlign: TextAlign.center,
                  softWrap: true,
                ),
                SizedBox(
                  height: 50.0,
                ),
                RaisedButton(
                  color: Colors.redAccent,
                  child: Text(
                    'Restart',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => MyApp()));
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
