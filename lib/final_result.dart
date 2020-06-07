import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'icon-contennt.dart';
import 'reuseable_card.dart';
import 'result_page.dart';

class CalculationBrain{
  CalculationBrain({this.height, this.weight, this.age});
  final int height;
  final int weight;
  final int age;

  double _bmi;

  String getCalculate(){
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

String getStatus(){
  if(_bmi >= 25 && age >= 30){
      return 'Overweight';
  }else if(_bmi >=18.3 && _bmi <25 && age <30){
      return 'Normal';
  }else{
    return 'UnderWeight';
  }
}
 String getMessage(){
   if(_bmi >= 25 && age >= 30){
       return 'Take Fast Daily More and More, Age & weight not match';
   }else if(_bmi >=18.3 && _bmi <25 && age <30){
       return 'Very Good Helth, Keep Momentum';
   }else{
     return 'Daily Eat 6 Time For More Weight';
   }
  }
}