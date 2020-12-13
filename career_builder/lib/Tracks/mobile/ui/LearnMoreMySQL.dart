
import 'package:careerbuilder/Tracks/mobile/model/Courses.dart';
import 'package:careerbuilder/Tracks/mobile/ui/Cell.dart';
import 'package:careerbuilder/challenge_and_cv/widgets/menu_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LearnMoreMySQL extends StatefulWidget {
  @override
  _LearnMoreMySQL createState() => _LearnMoreMySQL();
}

class _LearnMoreMySQL extends State<LearnMoreMySQL> {
  List<Courses> course =[
    Courses("Mosh", 3.5, "assets/Tracks/mobile development/images/1024px-Circle-icons-profile.svg.PNG", "assets/Tracks/mobile development/images/my sql.PNG", "https://www.youtube.com/watch?v=7S_tz1z_5bA ", 4.0, 1),
    Courses("Bucky",5, "assets/Tracks/mobile development/images/1024px-Circle-icons-profile.svg.PNG","assets/Tracks/mobile development/images/my sql.PNG", "https://www.youtube.com/watch?v=KgiCxe-ZW8o&list=PL32BC9C878BA72085", 3.9, 33),
    Courses("Knowledge", 5,"assets/Tracks/mobile development/images/1024px-Circle-icons-profile.svg.PNG" ,"assets/Tracks/mobile development/images/my sql.PNG" , "https://www.youtube.com/watch?v=iP1wOSsKjW8&list=PLS1QulWo1RIahlYDqHWZb81qsKgEvPiHn", 4.2, 56),
    Courses("Free Code", 4.5, "assets/Tracks/mobile development/images/freecodecamp.JPG", "assets/Tracks/mobile development/images/my sql.PNG", "https://www.youtube.com/watch?v=HXV3zeQKqGY", 4.3, 1),
    Courses("Yogesh", 6, "assets/Tracks/mobile development/images/1024px-Circle-icons-profile.svg.PNG", "assets/Tracks/mobile development/images/my sql.PNG", "https://www.youtube.com/watch?v=e1LPfehYSgg&list=PLS1QulWo1RIY4auvfxAHS9m_fZJ2wxSse", 4.0, 40)
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
                          image: AssetImage('assets/Tracks/mobile development/images/my sql.PNG'),
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