
import 'package:careerbuilder/challenge_and_cv/widgets/menu_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Back.dart';
import 'containerOfaboutOfInfo.dart';
import 'ContainerOfFeatures.dart';
import 'ContainerOfLearnAndTestButton.dart';

class NodeJS extends StatefulWidget {
  @override
  _NodeJS createState() => _NodeJS();
}

class _NodeJS extends State<NodeJS> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff09d8d2),
        title: Center(
          child: Text('Node.JS'),
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
            containerOfAboutOfInfo('assets/Tracks/mobile development/images/node.PNG',
                "A Node.js app is run in a single process, without creating a new thread for every request.Node.js provides a set of asynchronous I/O primitives in its standard library that prevent JavaScript code from blocking and generally, libraries in Node.js are written using non-blocking paradigms,making blocking behavior the exception rather than the norm.."),
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

                    containerOfFeature("Joyent", "Fast", "C++/JS", "yes", "VScode"),
                    //Todo:- ده الجزاء الخاص بى الجزاء بتاعالزراير الفى اخر الشاشه
                    ContainerOfLearAndTestButton(4),
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
