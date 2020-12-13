
import 'package:careerbuilder/Tracks/mobile/model/Courses.dart';
import 'package:careerbuilder/challenge_and_cv/widgets/menu_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Cell.dart';

class LearnMoreNode extends StatefulWidget {
  @override
  _LearnMoreNode createState() => _LearnMoreNode();
}

class _LearnMoreNode extends State<LearnMoreNode> {
  List<Courses> course =[
    Courses("Emam ", 12, "assets/Tracks/mobile development/images/1024px-Circle-icons-profile.svg.PNG", "assets/Tracks/mobile development/images/node.PNG", "https://www.youtube.com/watch?v=2jbaDlQqcoY&list=PLGhZWewM_75LQf3KvHo6HHSclmDyDazl7", 4.4, 65),
    Courses("Andrew ",8, "assets/Tracks/mobile development/images/1024px-Circle-icons-profile.svg.PNG","assets/Tracks/mobile development/images/node.PNG", "https://www.youtube.com/watch?v=VPEeP8A_4ZE&list=PLjTsdWerYoeVMM_13kmZv4Ki8QZqknM3c", 4.3, 173),
    Courses("Archana", 7,"assets/Tracks/mobile development/images/1024px-Circle-icons-profile.svg.PNG" ,"assets/Tracks/mobile development/images/node.PNG" , "https://www.youtube.com/watch?v=JnvKXcSI7yk", 4.8, 1),
    Courses("FreeCode", 3, "assets/Tracks/mobile development/images/freecodecamp.JPG", "assets/Tracks/mobile development/images/node.PNG", "https://www.youtube.com/watch?v=RLtyhwFtXQA", 4.0, 1),
    Courses("Net Ninga", 6, "assets/Tracks/mobile development/images/1024px-Circle-icons-profile.svg.PNG", "assets/Tracks/mobile development/images/node.PNG", "https://www.youtube.com/watch?v=w-7RQ46RgxU&list=PL4cUxeGkcC9gcy9lrvMJ75z9maRw4byYp", 4.0, 37)
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
                          image: AssetImage('assets/Tracks/mobile development/images/node.PNG'),
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