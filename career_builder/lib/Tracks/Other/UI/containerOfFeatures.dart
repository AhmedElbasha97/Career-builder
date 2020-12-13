import 'package:flutter/material.dart';

class containerOfFeature extends StatelessWidget {
  final String IMGRefRight = 'assets/Tracks/common/survey-tick.png';
  final String IMGRefOfFeature = 'assets/Tracks/common/features.png';
  final String framework;
  final String devolpmentSpeed;
  final String programingLang;
  final String opensource;
  final String IDE;
  const containerOfFeature(this.framework, this.devolpmentSpeed,
      this.programingLang, this.opensource, this.IDE);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 0.7,
      height: MediaQuery.of(context).size.height / 2.8,
      child: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width / 3.07,
            height: MediaQuery.of(context).size.height / 12,
            alignment: Alignment.topCenter,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(IMGRefOfFeature),
                  fit: BoxFit.fill,
                  alignment: Alignment.topCenter),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width / 1.35,
            height: MediaQuery.of(context).size.height / 20,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                bottom: BorderSide(
                  width: 2,
                  color: Color(0xff09d8d2),
                  style: BorderStyle.solid,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
//                ConstrainedBox(
//                  constraints: BoxConstraints(
//                    maxHeight: 40,
//                    maxWidth: 190,
//                  ),
//                  child: Container(
//                    alignment: Alignment.centerLeft,
//                    child: Text(
//                      "framework owner",
//                      style: TextStyle(
//                        fontFamily: "Roboto",
//                        fontSize: 14,
//                        color: Color(0xff000000),
//                      ),
//                    ),
//                  ),
//                ),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: 40,
                    maxWidth: 240,
                  ),
                  child: Container(
                    //alignment: Alignment.center,
                    child: Text(
                      framework,
                      style: TextStyle(
                        fontFamily: "Roboto",
                        fontSize: 14,
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 20,
                  width: 25,
                  alignment: Alignment.centerRight,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(IMGRefRight),
                        fit: BoxFit.fill,
                        alignment: Alignment.topCenter),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width / 1.35,
            height: MediaQuery.of(context).size.height / 20,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                bottom: BorderSide(
                  width: 2,
                  color: Color(0xff09d8d2),
                  style: BorderStyle.solid,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
//                ConstrainedBox(
//                  constraints: BoxConstraints(
//                    maxHeight: 40,
//                    maxWidth: 190,
//                  ),
//                  child: Container(
//                    alignment: Alignment.centerLeft,
//                    child: Text(
//                      "Devolpment Speed",
//                      style: TextStyle(
//                        fontFamily: "Roboto",
//                        fontSize: 14,
//                        color: Color(0xff000000),
//                      ),
//                    ),
//                  ),
//                ),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: 80,
                    maxWidth: 240,
                  ),
                  child: Container(
                    //alignment: Alignment.center,
                    child: Text(
                      devolpmentSpeed,
                      style: TextStyle(
                        fontFamily: "Roboto",
                        fontSize: 14,
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 20,
                  width: 25,
                  alignment: Alignment.centerRight,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(IMGRefRight),
                        fit: BoxFit.fill,
                        alignment: Alignment.topCenter),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width / 1.35,
            height: MediaQuery.of(context).size.height / 20,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                bottom: BorderSide(
                  width: 2,
                  color: Color(0xff09d8d2),
                  style: BorderStyle.solid,
                ),
              ),
            ),
            //Todo:-  ديه الجزاء الخاص بى كل واحده بالفيتشر المفروض ان تانى كونتانر هو الفيه الكلام بتاع كل وحده
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
//                ConstrainedBox(
//                  constraints: BoxConstraints(
//                    maxHeight: 40,
//                    maxWidth: 190,
//                  ),
//                  child: Container(
//                    alignment: Alignment.centerLeft,
//                    child: Text(
//                      "Programming Language",
//                      style: TextStyle(
//                        fontFamily: "Roboto",
//                        fontSize: 14,
//                        color: Color(0xff000000),
//                      ),
//                    ),
//                  ),
//                ),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: 80,
                    maxWidth: 240,
                  ),
                  child: Container(
                    //alignment: Alignment.center,
                    child: Text(
                      programingLang,
                      style: TextStyle(
                        fontFamily: "Roboto",
                        fontSize: 14,
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 20,
                  width: 25,
                  alignment: Alignment.centerRight,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(IMGRefRight),
                        fit: BoxFit.fill,
                        alignment: Alignment.topCenter),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width / 1.35,
            height: MediaQuery.of(context).size.height / 20,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                bottom: BorderSide(
                  width: 2,
                  color: Color(0xff09d8d2),
                  style: BorderStyle.solid,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
//                ConstrainedBox(
//                  constraints: BoxConstraints(
//                    maxHeight: 40,
//                    maxWidth: 190,
//                  ),
//                  child: Container(
//                    alignment: Alignment.centerLeft,
//                    child: Text(
//                      "Open Source",
//                      style: TextStyle(
//                        fontFamily: "Roboto",
//                        fontSize: 14,
//                        color: Color(0xff000000),
//                      ),
//                    ),
//                  ),
//                ),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: 40,
                    maxWidth: 240,
                  ),
                  child: Container(
                    //alignment: Alignment.center,
                    child: Text(
                      opensource,
                      style: TextStyle(
                        fontFamily: "Roboto",
                        fontSize: 14,
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 20,
                  width: 25,
                  alignment: Alignment.centerRight,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(IMGRefRight),
                        fit: BoxFit.fill,
                        alignment: Alignment.topCenter),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width / 1.35,
            height: MediaQuery.of(context).size.height / 20,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                bottom: BorderSide(
                  width: 2,
                  color: Color(0xff09d8d2),
                  style: BorderStyle.solid,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
//                ConstrainedBox(
//                  constraints: BoxConstraints(
//                    maxHeight: 40,
//                    maxWidth: 160,
//                  ),
//                  child: Container(
//                    alignment: Alignment.centerLeft,
//                    child: Text(
//                      "IDE:",
//                      style: TextStyle(
//                        fontFamily: "Roboto",
//                        fontSize: 14,
//                        color: Color(0xff000000),
//                      ),
//                    ),
//                  ),
//                ),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: 60,
                    maxWidth: 240,
                  ),
                  child: Container(
                    //alignment: Alignment.center,
                    child: Text(
                      IDE,
                      style: TextStyle(
                        fontFamily: "Roboto",
                        fontSize: 14,
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 20,
                  width: 25,
                  alignment: Alignment.centerRight,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(IMGRefRight),
                        fit: BoxFit.fill,
                        alignment: Alignment.topCenter),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
