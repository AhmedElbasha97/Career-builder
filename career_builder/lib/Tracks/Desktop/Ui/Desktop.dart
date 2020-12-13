import 'package:careerbuilder/Bottom_Navigation_Bars/MainBottom/main_bottom.dart';
import 'package:careerbuilder/Tracks/Desktop/Ui/Backend.dart';
import 'package:careerbuilder/Tracks/Desktop/Ui/Forntend.dart';
import 'package:careerbuilder/challenge_and_cv/widgets/menu_bar.dart';

import 'package:flutter/material.dart';


void main() => runApp(Desktop());

class Desktop extends StatefulWidget {
  @override
  _DesktopState createState() => _DesktopState();
}

class _DesktopState extends State<Desktop> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(home: Scaffold(
      appBar: AppBar(

        backgroundColor: Color(0xff09d8d2),
        title: Center(
          child: Text('Desktop',style: TextStyle(fontSize: 25.0),),
        ),
        leading: IconButton(
          onPressed: () {
             Navigator.push(
                context, MaterialPageRoute(builder: (context) => MainBottom(numOfPage: 0,)));
          },
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.white,
        ),
      ),
      endDrawer: Menu(),
      body: Column(
        children: <Widget>[
      Container(
      width: MediaQuery.of(context).size.width /1,
      height: MediaQuery.of(context).size.height/2.001,
      child: Stack(



        children: <Widget>[
          Container(

            alignment: Alignment.topCenter,
            decoration: BoxDecoration(
              //ToDo:- ده مكان الصوره الفوق
              image: DecorationImage(
                image: AssetImage('assets/Tracks/desktop/images/Desktop.jpg'),
                fit: BoxFit.contain,
                alignment: Alignment.topCenter,
              ),
            ),

          ),
          //ToDo:- ده مكان الفى الابوت
          Align(
            alignment: Alignment.bottomCenter,

            child:Container(
              height: MediaQuery.of(context).size.height/6.5,
              padding: const EdgeInsets.only(top: 10.0,left: 20.0,right: 20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: Align(
                alignment: Alignment.topCenter,
                child: Row(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topCenter,
                      child: FloatingActionButton(
                        onPressed: null,
                        backgroundColor: Color(0xff09d8d2),
                        child: Text('About'), ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 30,left: 10),

                      child: Align(
                        alignment: Alignment.topCenter,
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            maxHeight: MediaQuery.of(context).size.height/3,
                            maxWidth: MediaQuery.of(context).size.width/1.5,
                          ),
                          // ToDo:- المكان الفى الوصف بتاع المواد كلها
                          child: Text('It runs on a PC operating system (Windows, Mac, Linux, etc). it has a graphical user interface it does not run inside a web browser'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),




        ],
      ),


    ),
          Column(
            children: <Widget>[
              Container(
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(context,new MaterialPageRoute(builder: (context) {return Frontend();}),);
                    print('you clicked frontend');
                  },
                  child: Text(
                    'Frontend',
                    style: TextStyle(
                        fontSize: 25.0,
                        letterSpacing: 1,
                        color: Colors.white), //
                    // عشان تغيز ف خصائص الكلام
                  ),
                  color: Color(0xff09d8d2),
                  padding:
                  EdgeInsets.symmetric(vertical: 30, horizontal: 100),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0)),
                  //دى الى عملتله carve
                ),
              ),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                onPressed: () {Navigator.push(context,new MaterialPageRoute(builder: (context) {return Backend();}),);

                print('you clicked backend');
                },
                child: Text(
                  'Backend',
                  style: TextStyle(
                      fontSize: 25.0, letterSpacing: 1, color: Colors.white),
                ),
                color: Color(0xff09d8d2),
                padding: EdgeInsets.symmetric(vertical: 30, horizontal: 100),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0)),
                //دى الى عملتله carve
              ),
            ],
          ),
        ],
      ),
    ),
    );
  }
}
