import 'package:careerbuilder/Tracks/mobile/ui/HomeOfMobile.dart';
import 'package:careerbuilder/challenge_and_cv/widgets/menu_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'container about of main page.dart';
import 'ContainerOfButton.dart';
import 'JQ.dart';
import 'MySQL.dart';
import 'Node.dart';
import 'Ruby.dart';

class Back extends StatefulWidget {
  @override
  _Back createState() => _Back();
}

class _Back extends State<Back>{
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff09d8d2),
          title:Center(
            child: Text('BackEnd'),
          ),
          leading: IconButton(
            icon: Icon(Icons.navigate_before),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => HomeOfMobile()));
            },
          ),

        ),
        endDrawer: Menu(),
        body:SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ContainerAboutOfMainHome("The BackEnd consists of a server,an application, and database .A BackEnd developer bulids and maintains the technology that powers those components which, together, enable the User-Facing side  to even exist in the first place..", 'assets/Tracks/mobile development/images/shahadat-rahman-gnyA8vd3Otc-unsplash.JPG'),
              //ToDo:- ده المكان الفى الرو الشايل الرارين بال باك جروند باععته
              Container(
                child: Align(
                alignment: Alignment.topLeft,
                            child: Container(
                              height: 20,width: 380,
                              child: Text('#DATABASE',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),
                  ),
                ),
              ),
              ),
              ContainerOfButtons('assets/Tracks/mobile development/images/mysqlleft.PNG', 3, 'assets/Tracks/mobile development/images/jqueryright.PNG', 2),
              //ToDo:- ده الفرق بين الزرارين
              Container(
                width: 400,
                height: 7,
                color: Colors.white,
              ),
              Container(
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    height: 30,width: 380,
                    child: Text('#SERVER',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),
                    ),
                  ),
                ),
              ),
              ContainerOfButtons('assets/Tracks/mobile development/images/nodejsleft.PNG', 4, 'assets/Tracks/mobile development/images/rubyright.PNG', 6)
           , Container(height: 20,

            ),

            ],
          ),
        ) ,
      ),
    );
  }
}
