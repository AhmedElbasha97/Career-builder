import 'package:careerbuilder/challenge_and_cv/widgets/menu_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:careerbuilder/Tracks/Desktop/Ui/containerOfaboutOfInfo.dart';
import 'package:careerbuilder/Tracks/Desktop//Ui/containerOfFeatures.dart';
import 'package:careerbuilder/Tracks/Desktop//Ui/containerOFLearnAndTestButton.dart';
class Java extends StatefulWidget {
  @override
  _JavaState createState() => _JavaState();
}

class _JavaState extends State<Java> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff09d8d2),
          title:Center(
            child: Text('Java'),
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
              containerOfAboutOfInfo('assets/Tracks/desktop/images/java1.png',  "Java is a set of computer software and specifications developed by James Gosling at Sun Microsystems, which was later acquired by the Oracle Corporation"),
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

                      containerOfFeature("Oracle", "High", "java", "yes", "Eclipse/BlueJ"),
                      //Todo:- ده الجزاء الخاص بى الجزاء بتاعالزراير الفى اخر الشاشه
                      ContainerOfLearAndTestButton(1),
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
