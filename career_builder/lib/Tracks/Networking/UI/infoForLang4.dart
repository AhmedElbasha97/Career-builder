import 'package:careerbuilder/challenge_and_cv/widgets/menu_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:careerbuilder/Tracks/Networking/UI/containerOfaboutOfInfo.dart';
import 'package:careerbuilder/Tracks/Networking/UI/containerOfFeatures.dart';
import 'package:careerbuilder/Tracks/Networking/UI/containerOFLearnAndTestButton.dart';
class infoForCCNALang extends StatefulWidget {
  @override
  _infoForCCNALangState createState() => _infoForCCNALangState();
}

class _infoForCCNALangState extends State<infoForCCNALang> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff09d8d2),
          title:Center(
            child: Text("CCNA"),
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
              containerOfAboutOfInfo('assets/Tracks/Networking/ccna.png',
                  "CCNA is the composite exam associated with the Cisco Certified "
                      "Network Associate Routing & Switching certification. This "
                      "exam tests a candidate's knowledge and skills required to "
                      "install, operate, and troubleshoot a small to medium size "
                      "enterprise branch network. "
              ),
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

                  
                      //Todo:- ده الجزاء الخاص بى الجزاء بتاعالزراير الفى اخر الشاشه
                     containerOfFeature("cisco", "fast", "Python", "yes", "Python"),
                      ContainerOfLearAndTestButton(4)
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