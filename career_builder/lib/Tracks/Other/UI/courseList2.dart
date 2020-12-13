import 'package:careerbuilder/challenge_and_cv/widgets/menu_bar.dart';
import 'package:flutter/material.dart';
import 'package:careerbuilder/Tracks/Other/UI/cellOfCourses.dart';
import 'package:careerbuilder/Tracks/Other/model/modelofcourses.dart';

class corsesList2 extends StatefulWidget {
  @override
  _corsesList2State createState() => _corsesList2State();
}

class _corsesList2State extends State<corsesList2> {
  //ToDo:- ده المكان المكتوب فيه الليست بتاعت الكورسات امشى بنفس الترتيب متلعبش فى حاجه

  List<courses> course = [
    courses(
        "edureka!",
        75.29,
        "assets/Tracks/Other/edureka!.png",
        "assets/Tracks/Other/bigdata2.png",
        "https://www.youtube.com/playlist?list=PL9ooVrP1hQOFrYxqxb0NJCdCABPZNo0pD",
        5, //rating based on videos's view count
        82),
    courses(
        "SDET",
        26.11,
        "assets/Tracks/Other/SDET.jpg",
        "assets/Tracks/Other/bigdata2.png",
        "https://www.youtube.com/playlist?list=PLUDwpEzHYYLvFc8ic8eAsN7aFki9YlvRL",
        4.2, //rating based on videos's view count
        35),
    courses(
        "Mohamed Fawzy",
        27.20,
        "assets/Tracks/Other/MohamedFawzy.png",
        "assets/Tracks/Other/bigdata2.png",
        "https://www.youtube.com/playlist?list=PL4O5VDRX1NTfokrA2qotMFRD_opvcayJJ",
        3, //rating based on videos's view count
        46),
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
                      // ToDo:- ده مكان الفيه صوره الكونتانر الفوق
                      image: DecorationImage(
                          image: AssetImage('assets/Tracks/Other/bigdata2.png'),
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
