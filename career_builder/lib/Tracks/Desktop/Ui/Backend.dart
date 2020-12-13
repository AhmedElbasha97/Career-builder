import 'package:careerbuilder/challenge_and_cv/widgets/menu_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:careerbuilder/Tracks/Desktop/Ui/containerOfButtons.dart';
import 'package:careerbuilder/Tracks/Desktop/Ui/container about of main page.dart';
class Backend extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {

    return BackendState();
  }
}


class BackendState extends State<Backend>{


  @override
  Widget build(BuildContext context) {

    return new MaterialApp(
      home: new Scaffold(
        //ToDo:- ده المكان الفى ال اب بار بالزراير الكلام
        appBar: AppBar(
          backgroundColor: Color(0xff09d8d2),
          title:Center(
            //ToDo:- ده مكان التيتل
            child: Text('Desktop'),
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
            ContainerAboutOfMainHome( "The back end refers to parts of a computer application or a programs code that allow it to operate and that cannot be accessed by a user", 'assets/Tracks/desktop/images/Desktop.jpg'),
            //ToDo:- ده المكان الفى الرو الشايل الرارين بال باك جروند باععته
            ContainerOfButtons('assets/Tracks/desktop/images/my.png', 5, '', 00),
          ],
        ),

      ),
    );
  }
}
