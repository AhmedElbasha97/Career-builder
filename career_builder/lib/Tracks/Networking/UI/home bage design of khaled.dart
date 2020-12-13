import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class infoForBashLang extends StatefulWidget {
  @override
  _infoForBashLangState createState() => _infoForBashLangState();
}

class _infoForBashLangState extends State<infoForBashLang> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: new Scaffold(
          backgroundColor: Color.fromRGBO(20, 129, 186, 30),
        appBar: AppBar(
        backgroundColor: Color.fromRGBO(20, 129, 186, 30),
    title:Center(
    child: Text('bash'),
    ),
    // ToDo:- ده الجزاء الخاص بى زرارين الفى الااب بار
    leading: IconButton(
    icon: Icon(Icons.navigate_before),
    onPressed: (){
    Navigator.pop(context);
    },
    ),
    actions: <Widget>[
    IconButton(
    icon: Icon(Icons.menu),
    onPressed: (){
    print("menu has been clicked");
    },
    ),
    ],
    ),
          body: Column(
            children: <Widget>[
              Container(
                height: 300,
                width: 400,
                alignment: Alignment.topCenter,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/Component 19 – 1.png'),
                    fit: BoxFit.fill,
                    alignment: Alignment.topCenter,
                  ),

                ),
               ),
                 Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(left: 30),

                     height: 300,
                   width: 400,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(color: Colors.black.withOpacity(0.2),
                          blurRadius: 6,
                          offset:Offset(1,1)
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),

                    ),
                  ),
                  child: Container(
                    height: 280,
                    width: 350,
                    alignment: Alignment.topCenter,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        Container(
                          width: 160.0,
                          color: Colors.red,
                        ),
                        Container(
                          width: 160.0,
                          color: Colors.blue,
                        ),
                        Container(
                          width: 160.0,
                          color: Colors.green,
                        ),
                        Container(
                          width: 160.0,
                          color: Colors.yellow,
                        ),
                        Container(
                          width: 160.0,
                          color: Colors.orange,
                        ),
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
