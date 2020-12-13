import 'package:careerbuilder/challenge_and_cv/widgets/menu_bar.dart';
import 'package:flutter/material.dart';
import 'package:careerbuilder/Tracks/Networking/UI/cellOfCourses.dart';
import '../model/modelofcourses.dart';

class corsesList3 extends StatefulWidget {
  @override
  _corsesList3State createState() => _corsesList3State();
}

class _corsesList3State extends State<corsesList3> {
  List<courses> course =[
    courses("John Purcell", 14, "assets/Tracks/Networking/1st instractor perl.jpg", "assets/Tracks/Networking/perl.png", "https://www.udemy.com/course/perltutorial/?gclid=Cj0KCQjw4dr0BRCxARIsAKUNjWSPE7HVUiOY7WLMfPh8ATlam_F3M8i-Bry6sAZthLfiTQTm3IUiMycaAj44EALw_wcB&matchtype=e&utm_campaign=LongTail_la.EN_cc.ROW&utm_content=deal4584&utm_medium=udemyads&utm_source=adwords&utm_term=_._ag_84635067968_._ad_425510286230_._kw_perl+course_._de_c_._dm__._pl__._ti_kwd-810590762783_._li_1005386_._pd__._", 4.3, 67),
    courses("Flame Tech",7, "assets/Tracks/Networking/2nd instractor perl.jpg","assets/Tracks/Networking/perl.png", "https://www.udemy.com/course/perl-5-programming-course-for-beginner-to-advanced/", 4.5, 63),
    courses("Darryl pace", 16,"assets/Tracks/Networking/3rd instractor perl.jpg" ,"assets/Tracks/Networking/perl.png" , "https://www.udemy.com/course/enhance-your-skill-set-with-perl/", 4.3, 115),
    courses("Aka Skills", 6, "assets/Tracks/Networking/4th instractor perl.jpg", "assets/Tracks/Networking/perl.png", "https://www.udemy.com/course/linux-shell-programming-for-beginners/", 4.0, 30),
    courses("Stone River", 7.5, "assets/Tracks/Networking/5th instractor perl.jpg", "assets/Tracks/Networking/perl.png", "https://www.udemy.com/course/linux-bash-shell-scripting-through-real-life-examples/", 4.3, 70)

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
                          image: AssetImage("assets/Tracks/Networking/perl.png"),
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