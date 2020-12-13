import 'package:careerbuilder/challenge_and_cv/widgets/menu_bar.dart';
import 'package:flutter/material.dart';
import 'package:careerbuilder/Tracks/Web/Ui/CellOfCourses.dart';
import 'package:careerbuilder/Tracks/Web/model/modelofcourses.dart';

class mysqlcard extends StatefulWidget {
  @override
  _mysqlcardState createState() => _mysqlcardState();
}

class _mysqlcardState extends State<mysqlcard> {
  List<courses> course =[

    courses("elzero academy", 12, "assets/Tracks/Web/zero1.jpg", "assets/Tracks/Web/mysqlcover.png", "https://teracourses.com/course/computers-databases-mysql-course1#lessons", 5, 44),
    courses("hussien elrabeei", 4, "assets/Tracks/Web/freecodecamp.jpg", "assets/Tracks/Web/mysqlcover.png", "http://arbcours.blogspot.com/2017/06/course-build-database-by-mysql.html", 4, 37),
    courses("Alkhumayri", 4, "assets/Tracks/Web/boy.png", "assets/Tracks/Web/mysqlcover.png", "http://arbcours.blogspot.com/2017/06/course-build-database-by-mysql.html", 4.5, 13),
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
                          image: AssetImage('assets/Tracks/Web/mysql.jpg'),
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
                          "Courses",
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
