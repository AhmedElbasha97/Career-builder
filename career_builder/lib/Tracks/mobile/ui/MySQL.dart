import 'package:careerbuilder/challenge_and_cv/widgets/menu_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Back.dart';
import 'containerOfaboutOfInfo.dart';
import 'ContainerOfFeatures.dart';
import 'ContainerOfLearnAndTestButton.dart';

class MySQL extends StatefulWidget {
  @override
  _MySQL createState() => _MySQL();
}

class _MySQL extends State<MySQL> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff09d8d2),
        title: Center(
          child: Text('MySQL'),
        ),
        leading: IconButton(
          icon: Icon(Icons.navigate_before),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Back()));
          },
        ),
      ),
      endDrawer: Menu(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            containerOfAboutOfInfo('assets/Tracks/mobile development/images/my sql.PNG',
                "MySQL is free and open-source software under the terms of the GNU General Public License,and is also available under a variety of proprietary licenses.MySQL was owned and sponsored by the Swedish company MySQL AB,which was bought by Sun Microsystems In 2010 .."),
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

                    containerOfFeature("Orcale Org", "Moderate", "SQL", "yes", "Oracle"),
                    //Todo:- ده الجزاء الخاص بى الجزاء بتاعالزراير الفى اخر الشاشه
                    ContainerOfLearAndTestButton(3),
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


