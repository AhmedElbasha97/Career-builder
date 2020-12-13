import 'package:careerbuilder/challenge_and_cv/widgets/menu_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:careerbuilder/Tracks/Other/UI/containerOfaboutOfInfo.dart';
import 'package:careerbuilder/Tracks/Other/UI/containerOfFeatures.dart';
import 'package:careerbuilder/Tracks/Other/UI/containerOFLearnAndTestButton.dart';

class infoForBigDataLang extends StatefulWidget {
  @override
  _infoForBigDataLangState createState() => _infoForBigDataLangState();
}

class _infoForBigDataLangState extends State<infoForBigDataLang> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff09d8d2),
          title: Center(
            child: Text('Big Data'),
          ),
          // ToDo:- ده الجزاء الخاص بى زرارين الفى الااب بار
          leading: IconButton(
            icon: Icon(Icons.navigate_before),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        endDrawer: Menu(),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              containerOfAboutOfInfo(
                'assets/Tracks/Other/bigdata2.png',
                "Big data is a term that describes the large volume of data – both structured and unstructured – that inundates a business on a day-to-day basis. But it’s not the amount of data that’s important. It’s what organizations do with the data that matters. Big data can be analyzed for insights that lead to better decisions and strategic business moves.",
              ),
              Align(
                alignment: Alignment.center,
                //ToDo:- حجم الكارد الشايل كل ده
                child: Container(
                  width: MediaQuery.of(context).size.width / 1,
                  height: MediaQuery.of(context).size.height / 1.6,

                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 6,
                          offset: Offset(1, 1)),
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      containerOfFeature(
                          "Predictive Applications",
                          "Scalability",
                          "Technologies Support",
                          "Easy Result Formats",
                          "Raw data Processing"),

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
