import 'package:careerbuilder/Tracks/mobile/model/Courses.dart';
import 'package:careerbuilder/challenge_and_cv/widgets/menu_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Cell.dart';

class LearnFlutter extends StatefulWidget {
  @override
  _LearnFlutter createState() => _LearnFlutter();
}

class _LearnFlutter extends State<LearnFlutter> {
  List<Courses> course =[
    Courses("Mohamad", 16.5, "assets/Tracks/mobile development/images/1024px-Circle-icons-profile.svg.PNG", "assets/Tracks/mobile development/images/flutter.PNG", "https://www.youtube.com/watch?v=om_3LFEwTRU&list=PLqPejUavRNTXQyOCdA8vw-xN-yhFBK9S6 ", 4.4, 105),
    Courses("AboElDahb",5, "assets/Tracks/mobile development/images/1024px-Circle-icons-profile.svg.PNG","assets/Tracks/mobile development/images/flutter.PNG", "https://www.youtube.com/watch?v=gvAvYwMM5MA&t=4684s", 3.9, 2),
    Courses("maxi ", 6,"assets/Tracks/mobile development/images/max.JPG" ,"assets/Tracks/mobile development/images/flutter.PNG" , "https://www.youtube.com/watch?v=x0uinJvhNxI", 4.8, 1),
    Courses("Raouf ", 6.5, "assets/Tracks/mobile development/images/1024px-Circle-icons-profile.svg.PNG", "assets/Tracks/mobile development/images/flutter.PNG", "https://www.youtube.com/watch?v=kc2ZGGX3AtU&list=PLClgJfKTCMEij-GsnzXcu4iKeGlARnimi", 4.3, 46),
    Courses("Malik ", 6, "assets/Tracks/mobile development/images/udemy.PNG", "assets/Tracks/mobile development/images/flutter.PNG", "https://www.udemy.com/course/flutter-arabic/", 4.0, 59)
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
              width:380,
              child: Stack(
                children: <Widget>[
                  Container(
                    height: 220,
                    width: 380,
                    alignment: Alignment.topCenter,
                    decoration: BoxDecoration(
                      // ToDo:- ده مكان الفيه صوره الكونتانر الفوق
                      image: DecorationImage(
                          image: AssetImage('assets/Tracks/mobile development/images/flutter.PNG'),
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
                return CoursesCard( vdNum: course[index].vdNum,name: course[index].name,
                    imgCont: course[index].imgCont, rnNumber: course[index].rnNumber,
                    myUrl: course[index].myUrl, imgAva: course[index].imgAva, hrNum: course[index].hrNum );
              },
            ),
          ],
        ),
      ),
    ) ;
  }
}