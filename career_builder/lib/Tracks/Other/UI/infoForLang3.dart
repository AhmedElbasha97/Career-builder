import 'package:careerbuilder/challenge_and_cv/widgets/menu_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:careerbuilder/Tracks/Other/UI/containerOfaboutOfInfo.dart';
import 'package:careerbuilder/Tracks/Other/UI/containerOfFeatures.dart';
import 'package:careerbuilder/Tracks/Other/UI/containerOFLearnAndTestButton.dart';

class infoForDataMiningLang extends StatefulWidget {
  @override
  _infoForDataMiningLangState createState() => _infoForDataMiningLangState();
}

class _infoForDataMiningLangState extends State<infoForDataMiningLang> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff09d8d2),
          title: Center(
            child: Text("Data Mining"),
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
              containerOfAboutOfInfo('assets/Tracks/Other/datamining2.png',
                  "Data mining is a process used by companies to turn raw data into useful information. By using software to look for patterns in large batches of data, businesses can learn more about their customers to develop more effective marketing strategies, increase sales and decrease costs. Data mining depends on effective data collection, warehousing, and computer processing."),
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
                          "Prediction of likely outcomes",
                          "Creation of actionable information",
                          "Focus on large data sets",
                          "Automatic discovery of patterns",
                          "Any SQL expression can be calculated"),

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
