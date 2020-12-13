import 'package:careerbuilder/challenge_and_cv/widgets/menu_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:careerbuilder/Tracks/home/animations/fadeAnimation.dart';

import 'package:careerbuilder/Tracks/home/widgets/popularBeaches.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class DashScreen extends StatefulWidget {
  @override
  _DashScreenState createState() => _DashScreenState();
}

class _DashScreenState extends State<DashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(
        child: Menu(),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/Tracks/home/tech3.png"),
                      fit: BoxFit.contain,
                      alignment: Alignment.topCenter

                  )
              ),
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    SizedBox(height: 20),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[


                          ],
                        ),
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 0,vertical: 50),
                      height: MediaQuery.of(context).size.height * 0.685,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30)
                          )
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[

                          Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              height: MediaQuery.of(context).size.height / 16,
                              padding: EdgeInsets.only(left: 19),
                              child: Text("Choose your path",style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.bold


                              )),
                            ),
                          ),
                          FadeAnimation(1.8,PopularBeaches()),
                         SizedBox(height: 18),
//                       FadeAnimation(2,VideoWidget())
                        ],

                      ),

                    )

                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );

  }
}