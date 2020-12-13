import 'package:careerbuilder/Tracks/mobile/ui/ContainerOfButton.dart';
import 'package:careerbuilder/Tracks/mobile/ui/HomeOfMobile.dart';
import 'package:careerbuilder/challenge_and_cv/widgets/menu_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'container about of main page.dart';
import 'Flutter.dart';
import 'React.dart';

class Front extends StatefulWidget {
  @override
  _Front createState() => _Front();
}

class _Front extends State<Front>{
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff09d8d2),
          title:Center(
            child: Text('FrontEnd'),
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
              ContainerAboutOfMainHome("The FrontEnd  is the part that users interact with everything that you see when you're "
                  "navigating around the internet from fonts and colors todropdown menus and sliders"
                  , 'assets/Tracks/mobile development/images/selective-focus-photography-of-person-holding-turned-on-1092644.JPG'),
              //ToDo:- ده المكان الفى الرو الشايل الرارين بال باك جروند باععته
              Container(
                height: 20,
              ),
              Container(
                width: 400,
                height: 7,
                color: Colors.white,
              ),
              ContainerOfButtons('assets/Tracks/mobile development/images/react native left.PNG', 5,
                  'assets/Tracks/mobile development/images/flutterright.PNG', 1),
              //ToDo:- ده الفرق بين الزرارين

            ],
          ),
        ),
      ),
    );
  }
}
