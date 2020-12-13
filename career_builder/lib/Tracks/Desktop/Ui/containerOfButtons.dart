import 'package:careerbuilder/Tracks/Desktop/Ui/Cplus.dart';
import 'package:careerbuilder/Tracks/Desktop/Ui/Csharp.dart';
import 'package:careerbuilder/Tracks/Desktop/Ui/Mysql.dart';
import 'package:careerbuilder/Tracks/Desktop/Ui/Python.dart';
import 'package:flutter/material.dart';
import 'package:careerbuilder/Tracks/Desktop/Ui/Java.dart';

class ContainerOfButtons extends StatelessWidget {

  final String firstBTNImg;
  final String secondBTNImg;
  final int firstIdRef;
  final int SecondIdRef;

  const ContainerOfButtons(this.firstBTNImg, this.firstIdRef, this.secondBTNImg,this.SecondIdRef);


  @override
  Widget build(BuildContext context) {


    lanchScreen(int id) {
      switch (id) {
        case 1:
          {
            Navigator.push(context, new MaterialPageRoute(builder: (context) {
              return Java();
            }),);
          }
          break;
        case 2:
          {
            Navigator.push(context, new MaterialPageRoute(builder: (context) {
              return Csharp();
            }),);
          }
          break;

        case 3:
          {
            Navigator.push(context, new MaterialPageRoute(builder: (context) {
              return Cplus();
            }),);
          }
          break;
        case 4:
          {
            Navigator.push(context, new MaterialPageRoute(builder: (context) {
              return Python();
            }),);
          }
          break;
        case 5:
          {
            Navigator.push(context, new MaterialPageRoute(builder: (context) {
              return Mysql();
            }),);
          }
          break;
      }
    }
      return Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,

        children: [
          Container(
            //ToDo:- ده مكان البوردر بتاع الزراير
            width: MediaQuery
                .of(context)
                .size
                .width / 1,
            height: MediaQuery
                .of(context)
                .size
                .height / 6.7,
            color: Color.fromRGBO(190, 230, 243, 100),
            child: Container(

              width: MediaQuery
                  .of(context)
                  .size
                  .width / 1,
              height: MediaQuery
                  .of(context)
                  .size
                  .height / 9,

              child: Stack(

                children: <Widget>[
                  Align(
                    // ToDo:- ده مكان  زرار بالصورة بتاعته
                    alignment: Alignment.centerLeft,
                    child: Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width / 1.9,
                      height: MediaQuery
                          .of(context)
                          .size
                          .height / 7,
                      alignment: Alignment.centerLeft,
                      child: GestureDetector(
                        onTap: () {
                          lanchScreen(firstIdRef);
                        },
                        child: Container(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width / 0.1,
                          height: MediaQuery
                              .of(context)
                              .size
                              .height / 7,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              //ToDo:- ديه صورهخ الزرار
                              image: AssetImage(firstBTNImg),
                              fit: BoxFit.fitWidth,

                            ),

                          ),

                        ),
                      ),
                    ),
                  ),
                  Align(
                    // ToDo:- ده مكان  زرار بالصورة بتاعته
                    alignment: Alignment.bottomRight,
                    child: Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width / 1.8,
                      height: MediaQuery
                          .of(context)
                          .size
                          .height / 7,

                      child: GestureDetector(
                        onTap: () {
                          lanchScreen(SecondIdRef);
                        },
                        child: Container(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width / 0.1,
                          height: MediaQuery
                              .of(context)
                              .size
                              .height / 7,

                          decoration: BoxDecoration(
                            image: DecorationImage(
                              //ToDo:- ديه صورهخ الزرار
                              image: AssetImage(secondBTNImg),
                              fit: BoxFit.fitWidth,

                            ),

                          ),
                        ),
                      ),

                    ),
                  ),

                ],
              ),
            ),
          ),
        ],
      );
    }
  }

