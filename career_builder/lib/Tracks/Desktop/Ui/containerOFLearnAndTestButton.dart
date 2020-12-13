import 'package:careerbuilder/Bottom_Navigation_Bars/MainBottom/main_bottom.dart';
import 'package:careerbuilder/Test_Component/Screens/tests_page.dart';
import 'package:careerbuilder/Tracks/Desktop/Ui/CpulsCourses.dart';
import 'package:careerbuilder/Tracks/Desktop/Ui/CsharpCourses.dart';
import 'package:careerbuilder/Tracks/Desktop/Ui/JavaCourses.dart';
import 'package:careerbuilder/Tracks//Desktop/Ui/MysqlCourses.dart';
import 'package:careerbuilder/Tracks/Desktop/Ui/PythonCourses.dart';
import 'package:flutter/material.dart';
class ContainerOfLearAndTestButton extends StatelessWidget {
  final int Id;

  const ContainerOfLearAndTestButton(this.Id);

  @override

  Widget build(BuildContext context) {

    goToCourseScreen(int Id) {
      switch (Id) {
        case 1:
          {
            Navigator.push(context, new MaterialPageRoute(builder: (context) {
              return JavaCourses();
            }),);
          }
          break;
        case 2:
          {
            Navigator.push(context, new MaterialPageRoute(builder: (context) {
              return CsharpCourses();
            }),);
          }
          break;
        case 3:
          {
            Navigator.push(context, new MaterialPageRoute(builder: (context) {
              return CplusCourses() ;
            }),);
          }
          break;
        case 4:
          {
            Navigator.push(context, new MaterialPageRoute(builder: (context) {
              return PythonCourses();
            }),);
          }
          break;
        case 5:
          {
            Navigator.push(context, new MaterialPageRoute(builder: (context) {
              return MysqlCourses();
            }),);
          }
          break;
        case 6:
          {
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return MainBottom(numOfPage: 1,);
            }));

          }
          break;
      }
    }
    return Container(
      width: MediaQuery
          .of(context)
          .size
          .width / 1,
      height: MediaQuery
          .of(context)
          .size
          .height / 3.75,
      child: Column(
        children: <Widget>[
          Container(
            width: MediaQuery
                .of(context)
                .size
                .width / 1.5,
            height: MediaQuery
                .of(context)
                .size
                .height / 10,
            alignment: Alignment.centerLeft,
            child: new Text(
              "So ! Are You interested ?",
              style: TextStyle(
                fontFamily: "Roboto", fontWeight: FontWeight.w700,
                fontSize: 14,
                color: Color(0xff000000),
              ),
            ),
          ),
          //ToDo:- الجزاء الخاص بى المكان الوخده الزراير والفوق ده الكلام
          Container(
            width: MediaQuery
                .of(context)
                .size
                .width / 1.6,
            height: MediaQuery
                .of(context)
                .size
                .height / 13,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                new Container(
                  alignment: Alignment.centerLeft,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery
                          .of(context)
                          .size
                          .width / 3,
                      maxHeight: MediaQuery
                          .of(context)
                          .size
                          .height / 16,
                    ),
                    child: new RaisedButton(

                      onPressed: () {
                        goToCourseScreen(Id);
                      },
                      color: Color(0xff52c2a0),
                      elevation: 20,
                      child: Text(
                          "Learn more",
                          style: TextStyle(
                            fontFamily: "Roboto",
                            fontSize: 14,
                            color: Color(0xfffffcfc),
                          )
                      ),
                    ),
                  ),
                ),
                new Container(
                  alignment: Alignment.centerRight,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: MediaQuery
                          .of(context)
                          .size
                          .height / 16,
                      maxWidth: MediaQuery
                          .of(context)
                          .size
                          .width / 3,
                    ),
                    child: new RaisedButton(

                      onPressed: () {
                        goToCourseScreen(6);
                      },
                      color: Color(0xff52c2a0),
                      elevation: 20,
                      child: Text(
                        "Test me",
                        style: TextStyle(
                          fontFamily: "Roboto",
                          fontSize: 14,
                          color: Color(0xfffffcfc),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
