import 'package:careerbuilder/challenge_and_cv/widgets/menu_bar.dart';
import 'package:flutter/material.dart';
import 'package:careerbuilder/Tracks/Other/UI/cellOfCourses.dart';
import '../model/modelofcourses.dart';

class corsesList4 extends StatefulWidget {
  @override
  _corsesList4State createState() => _corsesList4State();
}

class _corsesList4State extends State<corsesList4> {
  List<courses> course = [
    courses(
        "mycodeschool",
        9.46,
        "assets/Tracks/Other/mycodeschool.jpg",
        "assets/Tracks/Other/datastructure2.png",
        "https://www.youtube.com/playlist?list=PL2_aWCzGMAwI3W_JlcBbtYTwiQSsOTa6P",
        5,
        42),
    courses(
        "TheNewBaghdad",
        8.49,
        "assets/Tracks/Other/TheNewBaghdad.png",
        "assets/Tracks/Other/datastructure2.png",
        "https://www.youtube.com/playlist?list=PLF8OvnCBlEY3a1pbPrE6fvNuV3qi-6KRf",
        4.5,
        53),
    courses(
        "FCIH OCW",
        17.55,
        "assets/Tracks/Other/FCIHOCW.jpg",
        "assets/Tracks/Other/datastructure2.png",
        "https://www.youtube.com/playlist?list=PLoK2Lr1miEm-5zCzKE8siQezj9rvQlnca",
        4,
        24),
    courses(
        "Adel Nasim",
        10.45,
        "assets/Tracks/Other/AdelNasim.jpg",
        "assets/Tracks/Other/datastructure2.png",
        "https://www.youtube.com/playlist?list=PLCInYL3l2AajqOUW_2SwjWeMwf4vL4RSp",
        3.7,
        37),
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
                          image: AssetImage(
                              'assets/Tracks/Other/datastructure2.png'),
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
