import 'package:careerbuilder/challenge_and_cv/widgets/menu_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:careerbuilder/Tracks/Networking/UI/containerOfaboutOfInfo.dart';
import 'package:careerbuilder/Tracks/Networking/UI/containerOfFeatures.dart';
import 'package:careerbuilder/Tracks/Networking/UI/containerOFLearnAndTestButton.dart';
class infoForObjCLang extends StatefulWidget {
  @override
  _infoForObjCLangState createState() => _infoForObjCLangState();
}

class _infoForObjCLangState extends State<infoForObjCLang> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff09d8d2),
          title:Center(
            child: Text('Obj-C'),
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
            containerOfAboutOfInfo('assets/Tracks/Networking/obj-c.png', "programming language that is used in the OS X and iOS operating systems and their application programming interfaces (APIs). Objective-C is object oriented, general purpose and adds to new language features in the C programming language.",),
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
                     containerOfFeature("Next", "fast", "R", "yes",
                         "X Code"),
                     
                      //Todo:- ده الجزاء الخاص بى الجزاء بتاعالزراير الفى اخر الشاش
                      ContainerOfLearAndTestButton(2)
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
