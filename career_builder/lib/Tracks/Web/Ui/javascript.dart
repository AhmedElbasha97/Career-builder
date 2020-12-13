import 'package:careerbuilder/challenge_and_cv/widgets/menu_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:careerbuilder/Tracks/Web/Ui/containerOfAboutOfInfo.dart';
import 'package:careerbuilder/Tracks/Web/Ui/containerOfFeatures.dart';
import 'package:careerbuilder/Tracks/Web/Ui/container of learn and test button.dart';

class javascript extends StatefulWidget {
  @override
  _javascriptState createState() => _javascriptState();
}

class _javascriptState extends State<javascript> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff09d8d2),
          title:Center(
            child: Text('javascript'),
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
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              containerOfAboutOfInfo('assets/Tracks/Web/jscover.png',  "commonly used as a part of web pages,"
                  " whose implementations allow client-side script "
                  "to interact with the user and make dynamic pages."),
              Align(
                alignment: Alignment.center,
                //ToDo:- حجم الكارد الشايل كل ده
                child: Container(
                  width: MediaQuery.of(context).size.width /1,
                  height: MediaQuery.of(context).size.height/1.6,

                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(color: Colors.black.withOpacity(0.2),
                          blurRadius: 6,
                          offset:Offset(1,1)
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25),
                    ),
                  ),
                  //Todo:- الكارد الشيله الفيتشر كلها
                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[

                      containerOfFeature("Blendan Eich", "moderate", "java/python/schema", "no", "VScode/Atom"),
                      //Todo:- ده الجزاء الخاص بى الجزاء بتاعالزراير الفى اخر الشاشه
                      ContainerOfLearAndTestButton(4),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
