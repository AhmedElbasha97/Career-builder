import 'package:careerbuilder/challenge_and_cv/widgets/menu_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:careerbuilder/Tracks/Web/Ui/container of buttons.dart';
import 'package:careerbuilder/Tracks/Web/Ui/container about of main page.dart';
class front extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {

    return frontState();
  }
}


class frontState extends State<front>{


  @override
  Widget build(BuildContext context) {

    return new MaterialApp(
      home: new Scaffold(
        //ToDo:- ده المكان الفى ال اب بار بالزراير الكلام
        appBar: AppBar(
          backgroundColor: Color(0xff09d8d2),
          title:Center(
            //ToDo:- ده مكان التيتل
            child: Text('Front-End'),
          ),
          //ToDo:- ده مكان زرار الباك
          leading: IconButton(
            icon: Icon(Icons.navigate_before),
            onPressed: (){
              Navigator.pop(context);
            },
          ),
          //ToDo:- ده مكان زرار المنيو
        ),
        endDrawer: Menu(),
        body: SingleChildScrollView(
          child: Column(

            children: <Widget>[
              ContainerAboutOfMainHome("Front-end web development, also known as client-side development is the practice "
                  "of producing HTML, CSS and JavaScript for a website or Web Application so that a user "
                  "can see and interact with them directly. ", 'assets/Tracks/Web/web.jpeg'),
              //ToDo:- ده المكان الفى الرو الشايل الرارين بال باك جروند باععته
              containerOfButtons('assets/Tracks/Web/htmlleft.png', 1, 'assets/Tracks/Web/cssright.png', 2),
              //ToDo:- ده الفرق بين الزرارين
              Container(
                width: 400,
                height: 7,
                color: Colors.white,
              ),
              containerOfButtons('assets/Tracks/Web/jqleft.png', 3, 'assets/Tracks/Web/jsright.png', 4),
              Container(
                width: 400,
                height: 7,
                color: Colors.white,
              ),
              containerOfButtons('assets/Tracks/Web/bsleft.png', 5, 'assets/Tracks/Web/xmlright.png', 6)






            ],
          ),
        ),

      ),
    );
  }
}
