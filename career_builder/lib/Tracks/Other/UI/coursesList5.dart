import 'package:careerbuilder/challenge_and_cv/widgets/menu_bar.dart';
import 'package:flutter/material.dart';
import 'package:careerbuilder/Tracks/Other/UI/cellOfCourses.dart';
import '../model/modelofcourses.dart';

class corsesList5 extends StatefulWidget {
  @override
  _corsesList5State createState() => _corsesList5State();
}

class _corsesList5State extends State<corsesList5> {
  List<courses> course = [
    courses(
        "Study Smart",
        4.10,
        "assets/Tracks/Other/StudySmart.jpg",
        "assets/Tracks/Other/math2.png",
        "https://www.youtube.com/playlist?list=PLJUzDR8Xp7F-u4MVvXgZf3BqvWaSs6Hn9",
        5,
        10),
    courses(
        "TO Courses",
        12.27,
        "assets/Tracks/Other/TOCourses.jpg",
        "assets/Tracks/Other/math2.png",
        "https://www.youtube.com/playlist?list=PLDcmCgguL9rzfwsRJehv5ocS4dnnvcOCa",
        3.5,
        24),
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
                          image: AssetImage('assets/Tracks/Other/math2.png'),
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
