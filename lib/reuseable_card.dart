import 'package:flutter/material.dart';

class reusebleCard extends StatelessWidget {
  reusebleCard({@required this.colour, this.childCard});
  final Widget childCard;
  final Color colour;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: childCard,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: colour,
        border: Border.all(color: Color(0xFF0B0B1B), width: 1, style: BorderStyle.solid),
      ),
      height: 200.0,
      width: 170.0,
    );
  }
}