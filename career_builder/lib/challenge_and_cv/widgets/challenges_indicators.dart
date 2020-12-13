import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class ChallengeIndicator extends StatefulWidget {

  @override
  _ChallengeIndicatorState createState() => _ChallengeIndicatorState();
}

class _ChallengeIndicatorState extends State<ChallengeIndicator> {
  var userType;
  int selectedRadio1;
  int selectedRadio2;
  List gender=[];
  void _handeleRadioButton(int value){
    setState(() {
      var radioValue=value;
      switch(radioValue){
        case 0:
        userType='female';
        selectedRadio1=0;
        selectedRadio2=0;
        gender.add(userType);
        print(userType);

        break;
        case 1:
        userType='male';
        selectedRadio2=1;
        selectedRadio1=1;
        gender.add(userType);
        print(userType);



        break;

      }
    });
  }

  
  @override
  void initState() {
    super.initState();
   selectedRadio1=1;
   selectedRadio2=0;
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('challenge indicator'),),
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
                Text('please select your gender',
                 style: TextStyle(
                 color: Colors.black87,
                 fontSize: 20,
                 fontWeight: FontWeight.bold,
                 ),),
                        SizedBox(height: 20,),

                  //vertical
                   Container(
                        margin: EdgeInsets.only(top: 3),
                        width: 300,
                        height: 2,
                        color: Color(0xff8CDBD8)),
                        SizedBox(height: 20,),
                      
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                        Radio(
                          value: 0,
                          groupValue:selectedRadio1,
                          onChanged:  _handeleRadioButton,
                        ),
                        Text(
                          'female',
                          style: new TextStyle(fontSize: 16.0),
                        ),
                        Radio(
                          value: 1,
                          groupValue:selectedRadio2,
                          onChanged:  _handeleRadioButton,
                        ),
                        Text(
                          'male',
                          style: new TextStyle(fontSize: 16.0),
                        ),
                        
                      ],)
                  
        ],),
      )
    );
  }
}