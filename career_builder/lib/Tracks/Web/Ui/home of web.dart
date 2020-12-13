import 'package:careerbuilder/Bottom_Navigation_Bars/MainBottom/main_bottom.dart';
import 'package:careerbuilder/challenge_and_cv/widgets/menu_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:careerbuilder/Tracks/Web/Ui/front.dart';
import 'package:careerbuilder/Tracks/Web/Ui/back.dart';
class web extends StatefulWidget {
  @override
  _webState createState() => _webState();
}

class _webState extends State<web> {
  @override
  Widget build(BuildContext context) {
    return
      new MaterialApp(
        home: new Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xff09d8d2),
            title:Center(
              child: Text('Web Development'),
            ),
            leading: IconButton(
              icon: Icon(Icons.navigate_before),
              onPressed: (){
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => MainBottom(numOfPage: 0,)));

              },
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
                          image: AssetImage('assets/Tracks/Web/web.jpeg'),
                          fit: BoxFit.contain,
                          alignment: Alignment.topCenter,
                        ),
                      ),

                    ),
                    //ToDo:- ده مكان الفى الابوت
                    Align(
                      alignment: Alignment.bottomCenter,

                      child:Container(
                        height: MediaQuery.of(context).size.height/5.5,
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
                                    child: Text("Web development refers to building, creating and an maintaining websites. It includes aspects such as web design web publishing, web programming, and database management.. "),
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
                      onPressed: (){  Navigator.push(context, new MaterialPageRoute(builder: (context) {return front() ;}),);
                      },
                      child: Text('Front-End',
                        style: TextStyle(
                            fontSize: 28.0,letterSpacing: 1,
                            color: Colors.white
                        ),),
                      color: Color(0xff09d8d2),
                      padding: EdgeInsets.symmetric(vertical: 30 ,horizontal: 100),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  RaisedButton(
                    onPressed: (){
                      Navigator.push(context, new MaterialPageRoute(builder: (context) {return back() ;}),);
                    },
                    child: Text('Back-End',
                      style: TextStyle(
                          fontSize: 28.0,letterSpacing: 1,
                          color: Colors.white
                      ),),
                    color: Color(0xff09d8d2),
                    padding: EdgeInsets.symmetric(vertical: 30 ,horizontal: 100),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)
                    ),
                  ),


                ],

              )


            ],
          ),

        ),
      );
  }
}