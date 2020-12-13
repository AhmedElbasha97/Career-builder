import 'package:careerbuilder/Bottom_Navigation_Bars/MainBottom/main_bottom.dart';
import 'package:careerbuilder/Tracks/home/screens/dashScreen.dart';
import 'package:careerbuilder/challenge_and_cv/widgets/menu_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:careerbuilder/Tracks/Other/UI/containerOfButtons.dart';
import 'package:careerbuilder/Tracks/Other/UI/container about of main page.dart';

class HomePageOfOther extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageOfOtherState();
  }
}

class HomePageOfOtherState extends State<HomePageOfOther> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: new MaterialApp(
        home: new Scaffold(
          //ToDo:- ده المكان الفى ال اب بار بالزراير الكلام
          appBar: AppBar(
            backgroundColor: Color(0xff09d8d2),
            title: Center(
              //ToDo:- ده مكان التيتل
              child: Text('Other'),
            ),
            //ToDo:- ده مكان زرار الباك
            leading: IconButton(
              icon: Icon(Icons.navigate_before),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => MainBottom(numOfPage: 0,)));
              },
            ),
            //ToDo:- ده مكان زرار المنيو
          ),
          endDrawer: Menu(),
          body: Column(
            children: <Widget>[
              containerAboutOfMainHome("", 'assets/Tracks/Other/7.jpg'),
              //ToDo:- ده المكان الفى الرو الشايل الرارين بال باك جروند باععته
              containerOfButtons('assets/Tracks/Other/ComponentCloud.png', 1,
                  'assets/Tracks/Other/ComponentBigdata.png', 2),
              //ToDo:- ده الفرق بين الزرارين
              Container(
                width: 400,
                height: 7,
                color: Colors.white,
              ),
              containerOfButtons('assets/Tracks/Other/ComponentDataMining.png',
                  3, 'assets/Tracks/Other/ComponentDatastructure2.png', 4),
              Container(
                width: 400,
                height: 7,
                color: Colors.white,
              ),
              containerOfButtons(
                  'assets/Tracks/Other/ComponentMath.png', 5, '', 0),
            ],
          ),
        ),
      ),
    );
  }
}
