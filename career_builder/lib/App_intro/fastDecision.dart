import 'package:careerbuilder/App_intro/homeScreen.dart';
import 'package:careerbuilder/App_intro/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FastDecision extends StatefulWidget {
  @override
  _FastDecisionState createState() => _FastDecisionState();
}

class _FastDecisionState extends State<FastDecision> {

  startTime() async {  // method to check the user is  first time or not
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);
    if (_seen) {// Not first time

      Navigator.push(context, MaterialPageRoute(builder: (_){
     return HomeScreen();
     })) ;

    } else if(!_seen) {// First time
      await prefs.setBool('seen', true);
      Navigator.push(context, MaterialPageRoute(builder: (_){
       return IntroOverboardPage();
      })) ;


    }
  }

  @override
  void initState() {
    super.initState();
startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
