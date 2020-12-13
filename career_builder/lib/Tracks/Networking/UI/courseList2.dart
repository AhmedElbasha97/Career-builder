import 'package:careerbuilder/challenge_and_cv/widgets/menu_bar.dart';
import 'package:flutter/material.dart';
import 'package:careerbuilder/Tracks/Networking/UI/cellOfCourses.dart';
import 'package:careerbuilder/Tracks/Networking/model/modelofcourses.dart';

class corsesList2 extends StatefulWidget {
  @override
  _corsesList2State createState() => _corsesList2State();
}

class _corsesList2State extends State<corsesList2> {
  //ToDo:- ده المكان المكتوب فيه الليست بتاعت الكورسات امشى بنفس الترتيب متلعبش فى حاجه

  List<courses> course =[
    courses("Mark price", 8.5, "assets/Tracks/Networking/1st instractor obj-c.jpg", "assets/Tracks/Networking/obj-c.png", "https://www.udemy.com/course/objectivec/", 4.4, 53),
    courses("john bura",1, "assets/Tracks/Networking/2nd instrauctor obj-c.jpg","assets/Tracks/Networking/obj-c.png", "https://www.udemy.com/course/learn-how-to-code-in-objective-c-for-beginners/", 3.9, 29),
    courses("Aaron Caines", 32,"assets/Tracks/Networking/3rd instrauctor obj-c.jpg" ,"assets/Tracks/Networking/obj-c.png" , "https://www.udemy.com/course/ios-12-objective-c/", 4.0, 132),
    courses("Suresh Kurmar", 6.5, "assets/Tracks/Networking/4th instrauctor obj-c.jpg", "assets/Tracks/Networking/obj-c.png", "https://www.udemy.com/course/design-patterns-through-objective-c/", 3.3, 68),
    courses("Aaron Caines", 11, "assets/Tracks/Networking/5th instrauctor obj-c.jpg", "assets/Tracks/Networking/obj-c.png", "https://www.udemy.com/course/the-complete-objective-c-guide-for-ios-8-and-xcode-6/", 3.8, 92)
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
                      // ToDo:- ده مكان الفيه صوره الكونتانر الفوق
                      image: DecorationImage(
                          image: AssetImage('assets/Tracks/Networking/obj-c.png'),
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