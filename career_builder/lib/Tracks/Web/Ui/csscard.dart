import 'package:careerbuilder/challenge_and_cv/widgets/menu_bar.dart';
import 'package:flutter/material.dart';
import 'package:careerbuilder/Tracks/Web/Ui/CellOfCourses.dart';
import 'package:careerbuilder/Tracks/Web/model/modelofcourses.dart';

class csscard extends StatefulWidget {
  @override
  _csscardState createState() => _csscardState();
}

class _csscardState extends State<csscard> {
  List<courses> course =[

    courses("Free Code Camp",7, "assets/Tracks/Web/freecodecamp.jpg","assets/Tracks/Web/csscover.png", "https://www.youtube.com/watch?v=1Rs2ND1ryYc", 4.4, 60),
    courses("Tera Courses", 6,"assets/Tracks/Web/boy.png" ,"assets/Tracks/Web/csscover.png" , "https://teracourses.com/course/web-design-css-course3", 4, 30),
    courses("Ahmed Issa", 9, "assets/Tracks/Web/udemy.png", "assets/Tracks/Web/csscover.png", "https://www.udemy.com/course/build_webiste_using_css3_html5/", 4.2, 15),
    courses("Khadiga Elsayed", 8, "assets/Tracks/Web/girl.jpg", "assets/Tracks/Web/csscover.png", "https://www.youtube.com/playlist?list=PLF8K63T6dslFTFcE3dBBumSqVg4fx7_pa", 4, 13)
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
                          image: AssetImage('assets/Tracks/Web/css1.jpg'),
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
