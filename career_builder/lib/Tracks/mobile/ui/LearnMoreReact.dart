
import 'package:careerbuilder/Tracks//mobile/model/Courses.dart';
import 'package:careerbuilder/challenge_and_cv/widgets/menu_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Cell.dart';

class LearnMoreReact extends StatefulWidget {
  @override
  _LearnMoreReact createState() => _LearnMoreReact();
}

class _LearnMoreReact extends State<LearnMoreReact> {
  List<Courses> course =[
    Courses("Net Ninga", 6, "assets/Tracks/mobile development/images/1024px-Circle-icons-profile.svg.PNG", "assets/Tracks/mobile development/images/react.PNG", "https://www.youtube.com/watch?v=ur6I5m2nTvk&list=PL4cUxeGkcC9ixPU-QkScoRBVxtPPzVjrQ ", 4.4, 35),
    Courses("Elshafii",5, "assets/Tracks/mobile development/images/1024px-Circle-icons-profile.svg.PNG","assets/Tracks/mobile development/images/react.PNG", "https://www.youtube.com/watch?v=H6mvkrTnCzM&list=PL_aOZuct6oApk0blD7LT4PtdTxCWwAlnb", 3.9, 11),
    Courses("maxi ", 6,"assets/Tracks/mobile development/images/max.JPG" ,"assets/Tracks/mobile development/images/react.PNG" , "https://www.youtube.com/watch?v=qSRrxpdMpVc", 4.8, 1),
    Courses("CodeMan", 4, "assets/Tracks/mobile development/images/1024px-Circle-icons-profile.svg.PNG", "assets/Tracks/mobile development/images/react.PNG", "https://www.youtube.com/watch?v=EMoXvr0Q9LE&list=PLYxzS__5yYQlHANFLwcsSzt3elIbYTG1h", 4.0, 38),
    Courses("Hossam ", 3, "assets/Tracks/mobile development/images/udemy.PNG", "assets/Tracks/mobile development/images/react.PNG", "https://www.udemy.com/course/create-react-native-app-wordpress-api-from-scratch/", 4.0, 18)
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
              height: 200,
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
                          image: AssetImage('assets/Tracks/mobile development/images/react.PNG'),
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