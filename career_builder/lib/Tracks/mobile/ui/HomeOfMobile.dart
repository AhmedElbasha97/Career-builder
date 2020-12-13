import 'package:careerbuilder/Bottom_Navigation_Bars/MainBottom/main_bottom.dart';
import 'package:careerbuilder/challenge_and_cv/widgets/menu_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Back.dart';
import 'Front.dart';

class HomeOfMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff09d8d2),
          title: Center(
            child: Text('Mobile Development'),
          ),
          leading: IconButton(
            icon: Icon(Icons.navigate_before),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MainBottom(
                            numOfPage: 0,
                          )));
            },
          ),

        ),
        endDrawer: Menu(),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width / 1,
                height: MediaQuery.of(context).size.height / 2.001,
                child: Stack(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.topCenter,
                      decoration: BoxDecoration(
                        //ToDo:- ده مكان الصوره الفوق
                        image: DecorationImage(
                          image: AssetImage(
                              'assets/Tracks/mobile development/images/macbook-pro-2764678.JPG'),
                          fit: BoxFit.fill,
                          alignment: Alignment.topCenter,
                        ),
                      ),
                    ),
                    //ToDo:- ده مكان الفى الابوت
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: MediaQuery.of(context).size.height / 6.5,
                        padding: const EdgeInsets.only(
                            top: 10.0, left: 20.0, right: 20.0),
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
                                  child: Text('About'),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 30, left: 10),
                                child: Align(
                                  alignment: Alignment.topCenter,
                                  child: ConstrainedBox(
                                    constraints: BoxConstraints(
                                      maxHeight:
                                          MediaQuery.of(context).size.height /
                                              3,
                                      maxWidth:
                                          MediaQuery.of(context).size.width /
                                              1.5,
                                    ),
                                    // ToDo:- المكان الفى الوصف بتاع المواد كلها
                                    child: Text(
                                        "It present a pretty unique opportunity for a one-person development team to build an actual ,usable,meaniningful app end-to-end in a relatively short period of time.. "),
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
              Container(
                alignment: Alignment.topCenter,
                padding: EdgeInsets.all(20),
                width: 280,
                height: 1.5,
                color: Color(0xff09d8d2),
              ),
              Container(
                height: 240,
                width: 380,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 10,
                    ),
                    MyButton(),
                    Container(
                      height: 10,
                    ),
                    MyButton1(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Front()));
      },
      child: new Container(
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 100),
        decoration: ShapeDecoration(
          color: Color(0xff09d8d2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(70)),
          ),
        ),
        child: Text('FrontEnd',
            style: TextStyle(
              fontSize: 23,
              backgroundColor: Color(0xff09d8d2),
              color: Colors.white,
              fontWeight: FontWeight.bold,
            )),
      ),
    );
  }
}

class MyButton1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Back()));
      },
      child: new Container(
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 100),
        decoration: ShapeDecoration(
          color: Color(0xff09d8d2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(70)),
          ),
        ),
        child: Text('BackEnd',
            style: TextStyle(
              fontSize: 23,
              backgroundColor: Color(0xff09d8d2),
              color: Colors.white,
              fontWeight: FontWeight.bold,
            )),
      ),
    );
  }
}
