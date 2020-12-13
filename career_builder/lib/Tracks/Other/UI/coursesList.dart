import 'package:careerbuilder/challenge_and_cv/widgets/menu_bar.dart';
import 'package:flutter/material.dart';
import 'package:careerbuilder/Tracks/Other/UI/cellOfCourses.dart';
import '../model/modelofcourses.dart';

class corsesList extends StatefulWidget {
  @override
  _corsesListState createState() => _corsesListState();
}

class _corsesListState extends State<corsesList> {
  List<courses> course = [
    courses(
        "Education 4u",
        3.22,
        "assets/Tracks/Other/Education4u.jpg",
        "assets/Tracks/Other/cloud2.png",
        "https://www.youtube.com/playlist?list=PLrjkTql3jnm86_Jr9195OaqN-HeiBy49I",
        5,
        25),
    courses(
        "Simplilearn",
        12.37,
        "assets/Tracks/Other/Simplilearn.jpg",
        "assets/Tracks/Other/cloud2.png",
        "https://www.youtube.com/playlist?list=PLEiEAq2VkUUIJ3o1tehvtux0_Ynf42CBN",
        4.5,
        20),
    courses(
        "Saif Bashar",
        4,
        "assets/Tracks/Other/SaifBashar.jpg",
        "assets/Tracks/Other/cloud2.png",
        "https://www.youtube.com/playlist?list=PL7VL3VEjE3Bgo_ADduXvkxP1t-CGiAMz2",
        4,
        7),
    courses(
        "nihad cherim",
        7.49,
        "assets/Tracks/Other/nihadcherim.jpg",
        "assets/Tracks/Other/cloud2.png",
        "https://www.youtube.com/playlist?list=PL2xcFcisYiLbVN1OPav-XaBStRRXow9R0",
        3,
        17),
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
                          image: AssetImage('assets/Tracks/Other/cloud2.png'),
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
