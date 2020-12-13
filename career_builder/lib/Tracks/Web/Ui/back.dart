import 'package:careerbuilder/challenge_and_cv/widgets/menu_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:careerbuilder/Tracks/Web/Ui/container of buttons.dart';
import 'package:careerbuilder/Tracks/Web/Ui/container about of main page.dart';

class back extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {

    return backState();
  }
}


class backState extends State<back>{


  @override
  Widget build(BuildContext context) {

    return new MaterialApp(
      home: new Scaffold(
        //ToDo:- ده المكان الفى ال اب بار بالزراير الكلام
        appBar: AppBar(
          backgroundColor: Color(0xff09d8d2),
          title:Center(
            //ToDo:- ده مكان التيتل
            child: Text('Back-End'),
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
        body: Column(

          children: <Widget>[
            ContainerAboutOfMainHome("Backend development (also stylized as back-end or back end development) "
                "is the skill that powers the web. Yet it does it modestly, without fanfare—allowing "
                "people to browse their favorite sites without even knowing about all the work put in "
                "by the backend developer or team. ", 'assets/Tracks/Web/web.jpeg'),
            //ToDo:- ده المكان الفى الرو الشايل الرارين بال باك جروند باععته
            containerOfButtons('assets/Tracks/Web/mysqlleft.png', 7, 'assets/Tracks/Web/phpright.png', 8),






          ],
        ),

      ),
    );
  }
}
