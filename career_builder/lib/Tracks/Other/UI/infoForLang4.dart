import 'package:careerbuilder/challenge_and_cv/widgets/menu_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:careerbuilder/Tracks/Other/UI/containerOfaboutOfInfo.dart';
import 'package:careerbuilder/Tracks/Other/UI/containerOfFeatures.dart';
import 'package:careerbuilder/Tracks/Other/UI/containerOFLearnAndTestButton.dart';

class infoForDataStructureLang extends StatefulWidget {
  @override
  _infoForDataStructureLangState createState() =>
      _infoForDataStructureLangState();
}

class _infoForDataStructureLangState extends State<infoForDataStructureLang> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff09d8d2),
          title: Center(
            child: Text("Data Structure"),
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
              containerOfAboutOfInfo('assets/Tracks/Other/datastructure2.png',
                  "A data structure is a specialized format for organizing, processing, retrieving and storing data. While there are several basic and advanced structure types, any data structure is designed to arrange data to suit a specific purpose so that it can be accessed and worked with in appropriate ways."),
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
                      //Todo:- ده الجزاء الخاص بى الجزاء بتاعالزراير الفى اخر الشاشه
                      containerOfFeature(
                          "Linear or non-linear",
                          "Store data in different formats",
                          "Homogeneous or non-homogeneous",
                          "Linked list",
                          "Graph"),
                      ContainerOfLearAndTestButton(4)
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
