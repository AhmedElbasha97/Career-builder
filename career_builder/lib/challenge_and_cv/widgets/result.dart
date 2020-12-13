import 'package:flutter/material.dart';
class Result extends StatelessWidget {
final IconData icon;
final Color iconColor;
final String questionnum;

  const Result({this.icon, this.iconColor, this.questionnum});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(questionnum,style: TextStyle(
       color: Colors.black54,
       ),
       textAlign: TextAlign.center,),
        SizedBox(width: 3,),
        Icon(icon, color: iconColor, size: 35),
      ],
    );
  }
}
