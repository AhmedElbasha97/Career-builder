import 'package:careerbuilder/challenge_and_cv/widgets/menu_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:careerbuilder/Tracks/Networking/UI/containerOfaboutOfInfo.dart';
import 'package:careerbuilder/Tracks/Networking/UI/containerOfFeatures.dart';
import 'package:careerbuilder/Tracks/Networking/UI/containerOFLearnAndTestButton.dart';
class infoForPerlLang extends StatefulWidget {
  @override
  _infoForPerlLangState createState() => _infoForPerlLangState();
}

class _infoForPerlLangState extends State<infoForPerlLang> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff09d8d2),
          title:Center(
            child: Text("perl"),
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
             containerOfAboutOfInfo('assets/Tracks/Networking/perl.png',   "Perl is a family of two high-level, general-purpose, interpreted, dynamic programming languages. Perl refers to Perl 5, but from 2000 to 2019 it also referred to its redesigned sister language, Perl 6,before the latter's name was officially changed to "),
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
                    containerOfFeature("Perl Organization", "fast", "perl 5", "yes", "Monks"),

                      //Todo:- ده الجزاء الخاص بى الجزاء بتاعالزراير الفى اخر الشاشه
                    ContainerOfLearAndTestButton(3)
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
