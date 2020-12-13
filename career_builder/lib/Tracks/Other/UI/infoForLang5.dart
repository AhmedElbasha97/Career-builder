import 'package:careerbuilder/challenge_and_cv/widgets/menu_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:careerbuilder/Tracks/Other/UI/containerOfaboutOfInfo.dart';
import 'package:careerbuilder/Tracks/Other/UI/containerOfFeatures.dart';
import 'package:careerbuilder/Tracks/Other/UI/containerOFLearnAndTestButton.dart';

class infoForMathLang extends StatefulWidget {
  @override
  _infoForMathLangState createState() => _infoForMathLangState();
}

class _infoForMathLangState extends State<infoForMathLang> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff09d8d2),
          title: Center(
            child: Text('Math'),
          ),
          // ToDo:- ده الجزاء الخاص بى زرارين الفى الااب بار
          leading: IconButton(
            icon: Icon(Icons.navigate_before),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        endDrawer: Menu(),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              containerOfAboutOfInfo('assets/Tracks/Other/math2.png',
                  "Mathematics is the science that deals with the logic of shape, quantity and arrangement. Math is all around us, in everything we do. It is the building block for everything in our daily lives, including mobile devices, architecture (ancient and modern), art, money, engineering, and even sports."),
              Align(
                alignment: Alignment.center,
                //ToDo:- حجم الكارد الشايل كل ده
                child: Container(
                  width: MediaQuery.of(context).size.width / 1,
                  height: MediaQuery.of(context).size.height / 1.6,

                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 6,
                          offset: Offset(1, 1)),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25),
                    ),
                  ),
                  //Todo:- الكارد الشيله الفيتشر كلها
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      containerOfFeature(
                          "Real-life Problem Solving",
                          "Appropriate Use of Technology",
                          "Emphasis on Communication",
                          "Balanced Instruction",
                          "Simplicity"),
                      //Todo:- ده الجزاء الخاص بى الجزاء بتاعالزراير الفى اخر الشاشه
                      ContainerOfLearAndTestButton(5),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
