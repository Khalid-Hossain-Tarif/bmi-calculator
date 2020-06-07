import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon-contennt.dart';
import 'reuseable_card.dart';
import 'result_page.dart';
import 'final_result.dart';

const activeCardColor = Colors.teal;
const inactiveCardColor = Color(0xFF1C1B2F);
const labelTextStyle = TextStyle(
  fontSize: 40.0, color: Colors.white, fontWeight: FontWeight.w900
);
const calculateButtonStyle = TextStyle(
  fontSize: 25.0, fontWeight: FontWeight.bold,
) ;
class inputPage extends StatefulWidget {
  @override
  _inputPageState createState() => _inputPageState();
}

class _inputPageState extends State<inputPage> {
  int height = 220;
  int weight = 60;
  int age = 19;
  Color maleCardColor = activeCardColor;
  Color femaleCardColor = inactiveCardColor;

  void updateColor(int gender){
    if(gender == 1){
      if(maleCardColor == inactiveCardColor){
        maleCardColor = activeCardColor;
        femaleCardColor = inactiveCardColor;
      }else{
        maleCardColor = inactiveCardColor;
      }
    }
    if(gender == 2){
      if(femaleCardColor == inactiveCardColor){
        femaleCardColor = activeCardColor;
        maleCardColor = inactiveCardColor;
      }else{
        femaleCardColor = inactiveCardColor;
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),

      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                 child: GestureDetector(
                   onTap: (){
                     setState(() {
                       updateColor(1);
                     });
                   },
                     child: reusebleCard(
                       colour: activeCardColor,
                       childCard: iconContent(
                         icon: FontAwesomeIcons.mars,
                         label: 'male',
                       ),
                     ),
                 ),
                ),
                Expanded(
                 child: GestureDetector(
                   onTap: (){
                     setState(() {
                       updateColor(2);
                     });
                   },
                   child: reusebleCard(
                     colour: inactiveCardColor,
                     childCard: iconContent(
                       icon: FontAwesomeIcons.venus,
                       label: 'Female',
                     ),
                   ),
                 ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: reusebleCard(
                    colour: Color(0xFF121224),
                    childCard: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                            'Height',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(
                              height.toString(),
                              style: labelTextStyle,
                            ),
                            Text(
                              'cm',
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Slider(
                          value: height.toDouble(),
                          min: 120.0,
                          max: 250.0,
                          activeColor: Colors.teal,
                          inactiveColor: Colors.grey,
                          onChanged: (double newValue){
                            setState(() {
                              height = newValue.round();
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: reusebleCard(
                    colour: Color(0xFF121224),
                    childCard: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Weight',
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
                        Text(
                          weight.toString(),
                          style: labelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPress: (){
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPress: (){
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: reusebleCard(
                    colour: Color(0xFF121224),
                    childCard: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Age',
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
                        Text(
                          age.toString(),
                          style: labelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPress: (){
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPress: (){
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              CalculationBrain cal = CalculationBrain(height: height, weight: weight, age: age);
              Navigator.push(context, MaterialPageRoute(builder: (context) =>resultspage(
                calculate: cal.getCalculate(),
                status: cal.getStatus(),
                message: cal.getMessage(),
                age: cal.age,
              )));
            },
            child: Container(
              child: Center(
                child: Text(
                  'CALCULATE',
                  style: calculateButtonStyle,
                ),
              ),
              color: Colors.teal,
              height: 45.0,
              width: double.infinity,
              //margin: EdgeInsets.only(top: 10.0),
             // padding: EdgeInsets.only(bottom: 10.0),
            ),
          ),
        ],
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({this.icon, this.onPress});
  final IconData icon;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPress,
      constraints: BoxConstraints.tightFor(
        height: 55.0,
        width: 55.0,
      ),
      fillColor: Color(0xFF0C0F1E),
      shape: CircleBorder(),
    );
  }
}


