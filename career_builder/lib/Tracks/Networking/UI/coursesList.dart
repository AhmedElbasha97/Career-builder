import 'package:careerbuilder/challenge_and_cv/widgets/menu_bar.dart';
import 'package:flutter/material.dart';
import 'package:careerbuilder/Tracks/Networking/UI/cellOfCourses.dart';
import '../model/modelofcourses.dart';

class corsesList extends StatefulWidget {
  @override
  _corsesListState createState() => _corsesListState();
}

class _corsesListState extends State<corsesList> {
List<courses> course =[
  courses("Ermin Kreponic", 51.5, "assets/Tracks/Networking/1st instructor bash.jpg", "assets/Tracks/Networking/bash.png", "https://www.udemy.com/course/bash-programming/?utm_source=adwords&utm_medium=udemyads&utm_campaign=LongTail_la.EN_cc.ROW&utm_content=deal4584&utm_term=_._ag_77879424134_._ad_428734577250_._kw__._de_c_._dm__._pl__._ti_dsa-1007766171312_._li_1005386_._pd__._&matchtype=b&gclid=Cj0KCQjw4dr0BRCxARIsAKUNjWTWjZDp29oPvSi5D0MDosK-LptoJvZLoapCJpS-Mf0gpcOLkQ4_T-waAuQmEALw_wcB", 4.2, 51),
  courses("jason canon",2.5, "assets/Tracks/Networking/2nd instractor bash.jpg","assets/Tracks/Networking/bash.png", "https://www.udemy.com/course/bash-scripting/", 4.4, 34),
  courses("jason canon", 11.5,"assets/Tracks/Networking/3rd instractor bash.jpg" ,"assets/Tracks/Networking/bash.png" , "https://www.udemy.com/course/linux-shell-scripting-projects/", 4.5, 48),
  courses("eduonix learning", 9.5, "assets/Tracks/Networking/4th istractor bash.jpg", "assets/Tracks/Networking/bash.png", "https://www.udemy.com/course/linux-shell-programming-for-beginners/", 4.2, 42),
  courses("Ermin Kreponic", 11.5, "assets/Tracks/Networking/5th istractor bash.jpg", "assets/Tracks/Networking/bash.png", "https://www.udemy.com/course/linux-bash-shell-scripting-through-real-life-examples/", 4.5, 42)
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
                        image: AssetImage('assets/Tracks/Networking/bash.png'),
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
