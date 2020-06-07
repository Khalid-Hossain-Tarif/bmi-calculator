import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'input_page.dart';
import 'reuseable_card.dart';

const yourResultTextStyle = TextStyle(
  fontSize: 50.0, fontWeight: FontWeight.bold,
);
const largeResultTextStyle = TextStyle(
  fontSize: 100.0, fontWeight: FontWeight.bold,
);
const normalTextStyle = TextStyle(
  fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.teal
);
class resultspage extends StatelessWidget {
  resultspage({this.calculate, this.status, this.message, this.age});

  final String calculate;
  final String status;
  final String message;
  final int age;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculate BMI'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child: Container(
                child: Text(
                    'You Result',
                  style: yourResultTextStyle,
                ),

          )),
          Expanded(
            flex: 5,
            child: reusebleCard(
              colour: Color(0xFF1C1B2F),
              childCard: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    status,
                    style: normalTextStyle,
                  ),
                  Text(
                    calculate,
                    style: largeResultTextStyle,
                  ),
                  Text(
                    message,
                    style: normalTextStyle,
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              child: Center(
                child: Text(
                  'RECALCULATE',
                  style: calculateButtonStyle,
                ),
              ),
              color: Colors.teal,
              height: 80.0,
              width: double.infinity,
              margin: EdgeInsets.only(top: 10.0),
              padding: EdgeInsets.only(bottom: 10.0),
            ),
          ),
        ],
      ),
    );
  }
}
