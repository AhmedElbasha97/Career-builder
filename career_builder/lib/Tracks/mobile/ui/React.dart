import 'package:careerbuilder/challenge_and_cv/widgets/menu_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'containerOfaboutOfInfo.dart';
import 'ContainerOfFeatures.dart';
import 'ContainerOfLearnAndTestButton.dart';
import 'front.dart';

class React extends StatefulWidget {
  @override
  _React createState() => _React();
}

class _React extends State<React> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff09d8d2),
        title: Center(
          child: Text('React Native'),
        ),
        leading: IconButton(
          icon: Icon(Icons.navigate_before),
          onPressed:
              () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Front()));
          },
        ),
      ),
      endDrawer: Menu(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            containerOfAboutOfInfo('assets/Tracks/mobile development/images/react.PNG',
                "It is used to develop applications for Android, iOS, Web and UWP by enabling developers to use React along with native platform capabilities. An incomplete port for Qt also exists"),
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

                    containerOfFeature("Facebook", "Fast", "ReactNative", "yes", "AndriodStudio"),
                    //Todo:- ده الجزاء الخاص بى الجزاء بتاعالزراير الفى اخر الشاشه
                    ContainerOfLearAndTestButton(5),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
