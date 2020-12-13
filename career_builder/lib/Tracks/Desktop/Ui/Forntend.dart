import 'package:careerbuilder/challenge_and_cv/widgets/menu_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:careerbuilder/Tracks/Desktop/Ui/containerOfButtons.dart';
import 'package:careerbuilder/Tracks/Desktop/Ui/container about of main page.dart';
class Frontend extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {

    return FrontendState();
  }
}


class FrontendState extends State<Frontend>{


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
            ContainerAboutOfMainHome( "The front end of a Desktop is the part that users interact with", 'assets/Tracks/desktop/images/Desktop.jpg'),
            //ToDo:- ده المكان الفى الرو الشايل الرارين بال باك جروند باععته
            ContainerOfButtons('assets/Tracks/desktop/images/java.png', 1, 'assets/Tracks/desktop/images/c sharp.png', 2),
            //ToDo:- ده الفرق بين الزرارين
              Container(
              width: 400,
              height: 7,
              color: Colors.white,
            ),
            ContainerOfButtons('assets/Tracks/desktop/images/c plus.png', 3, 'assets/Tracks/desktop/images/python.png', 4)


          ],
        ),

      ),
    );
  }
}
