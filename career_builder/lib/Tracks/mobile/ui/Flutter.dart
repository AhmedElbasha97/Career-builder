import 'package:careerbuilder/Tracks/mobile/ui/containerOfFeatures.dart';
import 'package:careerbuilder/challenge_and_cv/widgets/menu_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'containerOfaboutOfInfo.dart';
import 'ContainerOfLearnAndTestButton.dart';
import 'Front.dart';

class Flutter extends StatefulWidget {
  @override
  _Flutter createState() => _Flutter();
}

class _Flutter extends State<Flutter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle:true,
        title : Text ("Flutter"),
        backgroundColor: Color(0xff09d8d2),
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
            containerOfAboutOfInfo('assets/Tracks/mobile development/images/flutter.PNG',  "Flutter is an open-source UI software development kit created by Google.It is used to develop applications for Android, iOS, Windows, Mac, Linux, Google Fuchsia and the web.The first version of Flutter was known as codename Sky and ran on the Android operating system.It was unveiled at the 2015 Dart developer summit, with the stated intent of being able to render consistently at 120 frames per second."),
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

                    containerOfFeature("Googel", "Fast", "Dart", "yes", "AndroidStudio"),
                    //Todo:- ده الجزاء الخاص بى الجزاء بتاعالزراير الفى اخر الشاشه
                    ContainerOfLearAndTestButton(1),
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
