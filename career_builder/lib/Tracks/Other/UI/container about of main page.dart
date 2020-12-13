import 'package:flutter/material.dart';

class containerAboutOfMainHome extends StatelessWidget {
  final String textOfAbout;
  final String ImageRefrence;
  const containerAboutOfMainHome(this.textOfAbout, this.ImageRefrence);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1,
      height: MediaQuery.of(context).size.height / 3.050,
      child: Stack(
        children: <Widget>[
          Container(
            alignment: Alignment.topCenter,
            decoration: BoxDecoration(
              //ToDo:- ده مكان الصوره الفوق
              image: DecorationImage(
                image: AssetImage(ImageRefrence),
                fit: BoxFit.fitWidth,
                alignment: Alignment.topCenter,
              ),
            ),
          ),
          //ToDo:- ده مكان الفى الابوت
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 60,
              padding:
                  const EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: Align(
                alignment: Alignment.topCenter,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
