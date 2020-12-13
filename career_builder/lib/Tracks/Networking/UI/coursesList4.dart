import 'package:careerbuilder/challenge_and_cv/widgets/menu_bar.dart';
import 'package:flutter/material.dart';
import 'package:careerbuilder/Tracks/Networking/UI/cellOfCourses.dart';
import '../model/modelofcourses.dart';

class corsesList4 extends StatefulWidget {
  @override
  _corsesList4State createState() => _corsesList4State();
}

class _corsesList4State extends State<corsesList4> {
  List<courses> course =[
    courses("David Bomba", 80, "assets/Tracks/Networking/1st instractor ccna.jpg", "assets/Tracks/Networking/ccna.png", "https://www.udemy.com/course/complete-networking-fundamentals-course-ccna-start/", 4.5, 683),
    courses("Netwarkel Inc",18.5, "assets/Tracks/Networking/2nd instractor ccna.jpg","assets/Tracks/Networking/ccna.png", "https://www.udemy.com/course/new-ccna-full-course/", 4.5, 583),
    courses("Matt Carey", 18.5,"assets/Tracks/Networking/3rd instractor ccna.jpg" ,"assets/Tracks/Networking/ccna.png" , "https://www.udemy.com/course/cisco-ccna-course/", 4.4, 127),
    courses("kieth Gebnadt", 12.5, "assets/Tracks/Networking/4th instractor ccna.jpg", "assets/Tracks/Networking/ccna.png", "https://www.udemy.com/course/cisco-networking-introduction/", 4.2, 74),
    courses("Marious ", 13, "assets/Tracks/Networking/5th instractor ccna.jpg", "assets/Tracks/Networking/ccna.png", "https://www.udemy.com/course/ccna-security/", 4.4, 65)
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
                          image: AssetImage('assets/Tracks/Networking/perl.png'),
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