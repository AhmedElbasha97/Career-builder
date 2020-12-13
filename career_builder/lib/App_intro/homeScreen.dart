import 'package:careerbuilder/App_intro/components/customButtonAnimation.dart';
import 'package:careerbuilder/Home_component/screens/home.dart';
import 'package:careerbuilder/Tracks/home/animations/fadeAnimation.dart';
import 'package:flutter/material.dart';
import 'package:careerbuilder/App_intro/loginScreen.dart';
import 'package:careerbuilder/App_intro/signupscreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset("assets/images/mask4.png", fit: BoxFit.cover),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
//            color: Color(0xFFF001117).withOpacity(0),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            margin: EdgeInsets.only(top: 80, bottom: 80),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
//                  FadeAnimation(2.4,Text("Best waves for", style: TextStyle(
//                  color: Colors.white,
//                  fontSize: 22,
//                  letterSpacing: 2
//                ))),
//                FadeAnimation(2.6,Text("Career Builder", style: TextStyle(
//                  color: Colors.white,
//                  fontSize: 30,
//                  fontWeight: FontWeight.bold
//                ))),
                  ],
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    FadeAnimation(2.8,CustomButtonAnimation(
                      label: "Log in",
                      backbround: Colors.white,
                      fontColor: Colors.black,
                      borderColor: Colors.white,
                      child: LoginScreen(),
                    )),
                    SizedBox(height: 20),
                    FadeAnimation(3.2,CustomButtonAnimation(
                      label: "Sign up",
                      backbround: Color.fromRGBO(57, 225, 237,1) ,
                      borderColor: Colors.lightBlueAccent,
                      fontColor: Colors.white,
                      child: Signupscreen(),
                    )),
                    SizedBox(height: 30),
//                    FadeAnimation(3.4,Text("Forgot password", style: TextStyle(
//                      color: Colors.white,
//                      fontSize: 17,
//                      decoration: TextDecoration.underline
//                    )))
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}