import 'package:careerbuilder/Bottom_Navigation_Bars/MainBottom/main_bottom.dart';
import 'package:careerbuilder/Tracks/home/screens/dashScreen.dart';
import 'package:careerbuilder/challenge_and_cv/widgets/menu_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:careerbuilder/Tracks/Networking/UI/containerOfButtons.dart';
import 'package:careerbuilder/Tracks/Networking/UI/container about of main page.dart';
class HomePageOfNetworking extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {

    return HomePageOfNetworkingState();
  }
}


class HomePageOfNetworkingState extends State<HomePageOfNetworking>{


  @override
  Widget build(BuildContext context) {

    return new MaterialApp(
      home: new Scaffold(
        //ToDo:- ده المكان الفى ال اب بار بالزراير الكلام
        appBar: AppBar(
          backgroundColor: Color(0xff09d8d2),
          title:Center(
            //ToDo:- ده مكان التيتل
            child: Text('Networking'),
          ),
          //ToDo:- ده مكان زرار الباك
          leading: IconButton(
            icon: Icon(Icons.navigate_before),
            onPressed: (){
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => MainBottom(numOfPage: 0,)));
            },
          ),
          //ToDo:- ده مكان زرار المنيو
        ),
        endDrawer: Menu(),
        body: Column(

          children: <Widget>[
            ContainerAboutOfMainHome("A computer network facilitates interpersonal communications allowing users to communicate efficiently and easily via various means: email, instant messaging, online chat, telephone, video telephone calls,and video conferencing.A network allows sharing of network and computing resources. ", 'assets/Tracks/Networking/download.jpeg'),
             //ToDo:- ده المكان الفى الرو الشايل الرارين بال باك جروند باععته
            containerOfButtons('assets/Tracks/Networking/Component 98 – 1.png', 1, 'assets/Tracks/Networking/Component 99 – 1.png', 2),
            //ToDo:- ده الفرق بين الزرارين
            Container(
              width: 400,
              height: 7,
              color: Colors.white,
            ),
         containerOfButtons('assets/Tracks/Networking/Component 97 – 1.png', 3, 'assets/Tracks/Networking/Component 100 – 1.png', 4)


          ],
        ),

      ),
    );
  }
}
