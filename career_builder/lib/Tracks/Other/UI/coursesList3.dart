import 'package:careerbuilder/challenge_and_cv/widgets/menu_bar.dart';
import 'package:flutter/material.dart';
import 'package:careerbuilder/Tracks/Other/UI/cellOfCourses.dart';
import '../model/modelofcourses.dart';

class corsesList3 extends StatefulWidget {
  @override
  _corsesList3State createState() => _corsesList3State();
}

class _corsesList3State extends State<corsesList3> {
  List<courses> course = [
    courses(
        "Data Science Dojo",
        1.29,
        "assets/Tracks/Other/DataScienceDojo.png",
        "assets/Tracks/Other/datamining2.png",
        "https://www.youtube.com/playlist?list=PL8eNk_zTBST-gN6Y5E-5FZdARXjglYpyT",
        5, //rating based on videos's view count
        24),
    courses(
        "RANJI RAJ",
        5.04,
        "assets/Tracks/Other/RANJIRAJ.jpg",
        "assets/Tracks/Other/datamining2.png",
        "https://www.youtube.com/playlist?list=PLPN-43XehstOe0CxcXaYeLTFpgD2IiluP",
        4.2, //rating based on videos's view count
        36),
    courses(
        "mokafeha seu",
        44.25,
        "assets/Tracks/Other/mokafehaseu.jpg",
        "assets/Tracks/Other/datamining2.png",
        "https://www.youtube.com/playlist?list=PLO6V6DeYbPNHmRxmtvNbtGN59dZRojNbj",
        4, //rating based on videos's view count
        71),
  ];

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff09d8d2),
          title: Center(
            child: Text('Courses'),
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
        body: ListView(
          children: <Widget>[
            Container(
              height: 230,
              width: 400,
              child: Stack(
                children: <Widget>[
                  Container(
                    height: 220,
                    width: 430,
                    alignment: Alignment.topCenter,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image:
                              AssetImage("assets/Tracks/Other/datamining2.png"),
                          fit: BoxFit.fill,
                          alignment: Alignment.topCenter),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      height: 43,
                      width: 167,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Color(0xff728686),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(50),
                          bottomRight: Radius.circular(50),
                        ),
                      ),
                      child: Text("Courses",
                          style: TextStyle(
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.w700,
                            fontSize: 24,
                            color: Color(0xffffffff),
                          )),
                    ),
                  ),
                ],
              ),
            ),
            ListView.builder(
              physics: ScrollPhysics(),
              shrinkWrap: true,
              itemCount: course.length,
              itemBuilder: (BuildContext context, int index) {
                return coursesCard(
                    vdNum: course[index].vdNum,
                    name: course[index].name,
                    imgCont: course[index].imgCont,
                    rnNumber: course[index].rnNumber,
                    myUrl: course[index].myUrl,
                    imgAva: course[index].imgAva,
                    hrNum: course[index].hrNum);
              },
            ),
          ],
        ),
      ),
    );
  }
}
