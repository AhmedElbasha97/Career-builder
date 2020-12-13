
import 'package:careerbuilder/challenge_and_cv/widgets/menu_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Back.dart';
import 'containerOfaboutOfInfo.dart';
import 'ContainerOfFeatures.dart';
import 'ContainerOfLearnAndTestButton.dart';

class JQ extends StatefulWidget {
  @override
  _JQ createState() => _JQ();
}

class _JQ extends State<JQ> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff09d8d2),
        title: Center(
          child: Text('JQuery'),
        ),
        leading: IconButton(
          icon: Icon(Icons.navigate_before),
          onPressed:
              () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Back()));
          },
        ),
      ),
      endDrawer: Menu(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            containerOfAboutOfInfo('assets/Tracks/mobile development/images/jq.PNG',  "jQuery makes things like HTML document traversal and manipulation, event handling,animation, and Ajax much simpler with an easy-to-use API that works across a multitude of browsers. With a combination of versatility and extensibility,jQuery has changed the way that millions of people write JavaScript.."),
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

                    containerOfFeature("JScript Lib", "Fast", "javaScript", "yes", "DreamWaver"),
                    //Todo:- ده الجزاء الخاص بى الجزاء بتاعالزراير الفى اخر الشاشه
                    ContainerOfLearAndTestButton(2),
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
