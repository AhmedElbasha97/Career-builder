import 'package:careerbuilder/challenge_and_cv/widgets/menu_bar.dart';
import 'package:flutter/material.dart';
import 'package:careerbuilder/Tracks/Desktop/Ui//CellOfCourses.dart';
import 'package:careerbuilder/Tracks/Desktop/Models/modelofcourses.dart';

class MysqlCourses extends StatefulWidget {
  @override
  _MysqlCoursesState createState() => _MysqlCoursesState();
}

class _MysqlCoursesState extends State<MysqlCourses> {
  List<courses> course =[
    courses('ElZero', 8, 'assets/Tracks/desktop/images/profile.png', 'assets/Tracks/desktop/images/mysql.png', 'https://teracourses.com/course/computers-databases-mysql-course1', 5, 44),
    courses('Raouf Rahiche',2, 'assets/Tracks/desktop/images/profile.png','assets/Tracks/desktop/images/mysql.png', 'https://teracourses.com/course/database-sql-course4', 4.71, 9),
    courses('Mobarmg', 10, 'assets/Tracks/desktop/images/profile.png', 'assets/Tracks/desktop/images/mysql.png', 'https://teracourses.com/course/database-sql-course3', 4.95, 9),
    courses('Mohamed yehia', 8, 'assets/Tracks/desktop/images/profile.png', 'assets/Tracks/desktop/images/mysql.png',   'https://teracourses.com/course/computers-databases-mysql-course2', 5,20)
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
                          image: AssetImage('assets/Tracks/desktop/images/mysql.png'),
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
                          'MysqlCourses',
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
