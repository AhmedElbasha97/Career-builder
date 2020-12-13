
import 'package:careerbuilder/Tracks/mobile/model/Courses.dart';
import 'package:careerbuilder/challenge_and_cv/widgets/menu_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Cell.dart';

class LearnMoreRuby extends StatefulWidget {
  @override
  _LearnMoreRuby createState() => _LearnMoreRuby();
}

class _LearnMoreRuby extends State<LearnMoreRuby> {
  List<Courses> course =[
    Courses("FreeCode", 4, "assets/Tracks/mobile development/images/freecodecamp.JPG", "assets/Tracks/mobile development/images/ruby.PNG", "https://www.youtube.com/watch?v=t_ispmWmdjY ", 4.4, 1),
    Courses("Jake ",5, "assets/Tracks/mobile development/images/1024px-Circle-icons-profile.svg.PNG","assets/Tracks/mobile development/images/ruby.PNG", "https://www.youtube.com/watch?v=8I539U5lXWY&list=PLMK2xMz5H5Zv8eC8b4K6tMaE1-Z9FgSOp", 3.9, 37),
    Courses("Bucky ", 6,"assets/Tracks/mobile development/images/1024px-Circle-icons-profile.svg.PNG" ,"assets/Tracks/mobile development/images/ruby.PNG" , "https://www.youtube.com/watch?v=WJlfVjGt6Hg&list=PL1512BD72E7C9FFCA", 4.2, 32),
    Courses("Smrtherd", 6, "assets/Tracks/mobile development/images/1024px-Circle-icons-profile.svg.PNG", "assets/Tracks/mobile development/images/ruby.PNG", "https://www.youtube.com/watch?v=SHzeVBrW_rA&list=PLlxmoA0rQ-Lx45j3D6da7-Iqvo5wtjKBm", 4.3, 64),
    Courses("CS Geeks", 6, "assets/Tracks/mobile development/images/1024px-Circle-icons-profile.svg.PNG", "assets/Tracks/mobile development/images/ruby.PNG", "https://www.youtube.com/watch?v=6GMPxYsvTss&list=PLgPJX9sVy92yefe1xmyxgcyXjxmLHsSEV", 4.0, 25)
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
                          image: AssetImage('assets/Tracks/mobile development/images/ruby.PNG'),
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