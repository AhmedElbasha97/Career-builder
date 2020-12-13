import 'package:careerbuilder/challenge_and_cv/widgets/menu_bar.dart';
import 'package:flutter/material.dart';
import 'package:careerbuilder/Tracks/Desktop/Ui/CellOfCourses.dart';
import 'package:careerbuilder/Tracks/Desktop/Models/modelofcourses.dart';

class CplusCourses extends StatefulWidget {
  @override
  _CplusCoursesState createState() => _CplusCoursesState();
}

class _CplusCoursesState extends State<CplusCourses> {
  List<courses> course =[
    courses('ElDosoky', 55, 'assets/Tracks/desktop/images/profile.png', 'assets/Tracks/desktop/images/c++.png', 'https://www.youtube.com/playlist?list=PL1DUmTEdeA6IUD9Gt5rZlQfbZyAWXd-oD', 5, 343),
    courses('Adel Nasim',8, 'assets/Tracks/desktop/images/profile.png','assets/Tracks/desktop/images/c++.png',  'https://www.youtube.com/playlist?list=PLCInYL3l2AajFAiw4s1U4QbGszcQ-rAb3', 4.5, 38),
    courses('Marwa Radwan', 80, 'assets/Tracks/desktop/images/profile.png', 'assets/Tracks/desktop/images/c++.png', 'https://teracourses.com/course/c-plus-plus-course3', 4, 400),
    courses('H.Shaaban', 17, 'assets/Tracks/desktop/images/profile.png', 'assets/Tracks/desktop/images/c++.png',   'https://teracourses.com/course/c-plus-plus-course10', 4.7,28)
  ];

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff09d8d2),
          title:Center(
            child: Text('Courses'),
          ),
          // ToDo:- ده الجزاء الخاص بى زرارين الفى الااب بار
          leading: IconButton(
            icon: Icon(Icons.navigate_before),
            onPressed: (){
              Navigator.pop(context);
            },
          ),

        ),
        endDrawer: Menu(),
        body: ListView(
          children: <Widget>[
            Container(
              height: 230,
              width:400,
              child: Stack(
                children: <Widget>[
                  Container(
                    height: 220,
                    width: 430,
                    alignment: Alignment.topCenter,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/Tracks/desktop/images/c++.png'),
                          fit: BoxFit.fill,
                          alignment: Alignment.topCenter
                      ),
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
                      child: Text(
                          'CplusCourses',
                          style: TextStyle(
                            fontFamily: "Roboto",fontWeight: FontWeight.w700,
                            fontSize: 24,
                            color:Color(0xffffffff),

                          )
                      ),
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
                return coursesCard( vdNum: course[index].vdNum,name: course[index].name, imgCont: course[index].imgCont, rnNumber: course[index].rnNumber, myUrl: course[index].myUrl, imgAva: course[index].imgAva, hrNum: course[index].hrNum );
              },
            ),
          ],
        ),
      ),
    ) ;
  }
}
