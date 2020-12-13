
import 'package:careerbuilder/Test_Component/sql_database/dbmanager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'the_test.dart';
import 'package:flutter/cupertino.dart';



class TestMePage extends StatefulWidget {


  @override
  _TestMePageState createState() => _TestMePageState();
}

class _TestMePageState extends State<TestMePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final DbStudentManager dbManager=DbStudentManager();

  void _showScaffold(String message) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: Color(0xff06D6D0),
      content: Text(message,style: TextStyle(fontSize: 20),),
    ));
  }

  @override
  Widget build(BuildContext context) {
    _portraitModeOnly();
    double width = MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;

    return new Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: new Column(
              children: <Widget>[
                ClipPath( // the header of profile
                  clipper: MessageClipper(),
                  child: Container(
                    width: width,
                    height: height/3.2,
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Color(0xff09D8D2),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.teal.withOpacity(0.5),
                            blurRadius: 120.0, // has the effect of softening the shadow
                            spreadRadius: 5.0, // has the effect of extending the shadow
                            offset:  Offset(0, 7),
                          )
                        ]),
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                            top: 50,
                            left: 40,
                            child: Text('Test Me',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 30,fontStyle: FontStyle.italic))
                        ),
                      ],
                    ),
                  ),
                ),
//todo :---------------------- yyyyyyyyyyyyyyyyyyyyyyyyyyy---------------------------
                Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: Text('Choose your test',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 20,color: Color(0xffAABABA)),textAlign: TextAlign.left,),
                              ),
                              testCard(testN: 'bash', num: 1,onPressed: (){
                                var e= dbManager.matchLogo('bash').then((ids){
                                  if(ids!= 0){
                                    print('nooo${ids}');
                                    _showScaffold("You have already achieved this skill.");
                                  }else {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                                      return TheTest('bash');
                                    }));
                                  }
                                });
                              },
                              ),

                              testCard(testN: 'node.js', num: 2,onPressed: (){
                                var e= dbManager.matchLogo('node.js').then((ids){
                                  if(ids!= 0){
                                    print('nooooo ${ids}');
                                    _showScaffold("You have already achieved this skill.");
                                  }else {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                                      return TheTest('node.js');
                                    }));
                                  }
                                });
                              }
                              ),

                              testCard(testN: 'Flutter', num: 3,onPressed: (){
                                // ignore: unnecessary_statements, unrelated_type_equality_checks
                                var e= dbManager.matchLogo('flutter').then((ids){
                                  if(ids!= 0){
                                    print('nooooo ${ids}');
                                    _showScaffold("You have already achieved this skill.");
                                  }else {
                                    Navigator.push(
                                        context, MaterialPageRoute(builder: (context) {
                                      return TheTest('flutter');
                                    }));
                                  }
                                });
                              },
                              ),

                              testCard(testN: 'big data', num: 4,onPressed: (){
                                var e= dbManager.matchLogo('big_data').then((ids){
                                  if(ids!= 0){
                                    print('nooooo ${ids}');
                                    _showScaffold("You have already achieved this skill.");
                                  }else {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                                      return TheTest('big_data');
                                    }));
                                  }
                                });
                              }
                              ),

                              testCard(testN: 'bootstrap', num: 5,onPressed: (){
                                var e= dbManager.matchLogo('bootstrap').then((ids){
                                  if(ids!= 0){
                                    print('noooo ${ids}');
                                    _showScaffold("You have already achieved this skill.");
                                  }else {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                                      return TheTest('bootstrap');
                                    }));
                                  }
                                });
                              }
                              ),

                              testCard(testN: 'C++', num: 6,onPressed: (){
                                var e= dbManager.matchLogo('c_plus').then((ids){
                                  if(ids!= 0){
                                    print('nooooo ${ids}');
                                    _showScaffold("You have already achieved this skill.");
                                  }else {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                                      return TheTest('c_plus');
                                    }));
                                  }
                                });
                              }
                              ),

                              testCard(testN: 'C#', num: 7,onPressed: (){
                                var e= dbManager.matchLogo('c_sharp').then((ids){
                                  if(ids!= 0){
                                    print('noooooo ${ids}');
                                    _showScaffold("You have already achieved this skill.");
                                  }else {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                                      return TheTest('c_sharp');
                                    }));
                                  }
                                });
                              }
                              ),

                              testCard(testN: 'CCNA', num: 8,onPressed: (){
                                var e= dbManager.matchLogo('ccna').then((ids){
                                  if(ids!= 0){
                                    print('nooooo ${ids}');
                                    _showScaffold("You have already achieved this skill.");
                                  }else {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                                      return TheTest('ccna');
                                    }));
                                  }
                                });
                              }
                              ),

                              testCard(testN: 'Cloud computing', num: 9,
                                  onPressed: (){
                                    var e= dbManager.matchLogo('cloud_comp').then((ids){
                                      if(ids!= 0){
                                        print('noooo ${ids}');
                                        _showScaffold("You have already achieved this skill.");
                                      }else {
                                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                                          return TheTest('cloud_comp');
                                        }));
                                      }
                                    });
                                  }
                              ),

                              testCard(testN: 'Css', num: 10,onPressed: (){
                                var e= dbManager.matchLogo('css').then((ids){
                                  if(ids!= 0){
                                    print('noooo ${ids}');
                                    _showScaffold("You have already achieved this skill.");
                                  }else {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                                      return TheTest('css');
                                    }));
                                  }
                                });
                              }
                              ),

                              testCard(testN: 'data mining', num: 11,onPressed: (){
                                var e= dbManager.matchLogo('data_minin').then((ids){
                                  if(ids!= 0){
                                    print('noooo ${ids}');
                                    _showScaffold("You have already achieved this skill.");
                                  }else {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                                      return TheTest('data_minin');
                                    }));
                                  }
                                });
                              }
                              ),

                              testCard(testN: 'data structure', num: 12,onPressed: (){
                                var e= dbManager.matchLogo('datastruct').then((ids){
                                  if(ids!= 0){
                                    print('noooo ${ids}');
                                    _showScaffold("You have already achieved this skill.");
                                  }else {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                                      return TheTest('datastruct');
                                    }));
                                  }
                                });
                              }
                              ),

                              testCard(testN: 'Xml', num: 13, onPressed: (){
                                var e= dbManager.matchLogo('xml').then((ids){
                                  if(ids!= 0){
                                    print('noooo ${ids}');
                                    _showScaffold("You have already achieved this skill.");
                                  }else {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                                      return TheTest('xml');
                                    }));
                                  }
                                });
                              }
                              ),

                              testCard(testN: 'Ruby', num: 14,onPressed: (){
                                var e= dbManager.matchLogo('ruby').then((ids){
                                  if(ids!= 0){
                                    print('noooo ${ids}');
                                    _showScaffold("You have already achieved this skill.");
                                  }else {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                                      return TheTest('ruby');
                                    }));
                                  }
                                });
                              }
                              ),

                              testCard(testN: 'Python', num: 15,onPressed: (){
                                var e= dbManager.matchLogo('python').then((ids){
                                  if(ids!= 0){
                                    print('nooo ${ids}');
                                    _showScaffold("You have already achieved this skill.");
                                  }else {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                                      return TheTest('python');
                                    }));
                                  }
                                });
                              }
                              ),

                              testCard(testN: 'php', num: 16,onPressed: (){
                                var e= dbManager.matchLogo('php').then((ids){
                                  if(ids!= 0){
                                    print('nooooo${ids}');
                                    _showScaffold("You have already achieved this skill.");
                                  }else {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                                      return TheTest('php');
                                    }));
                                  }
                                });
                              }
                              ),

                              testCard(testN: 'perl', num: 17,onPressed: (){
                                var e= dbManager.matchLogo('perl').then((ids){
                                  if(ids!= 0){
                                    print('nooooo ${ids}');
                                    _showScaffold("You have already achieved this skill.");
                                  }else {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                                      return TheTest('perl');
                                    }));
                                  }
                                });
                              }
                              ),

                              testCard(testN: 'objective c', num: 18,onPressed: (){

                                var e= dbManager.matchLogo('objective_').then((ids){
                                  if(ids!= 0){
                                    print('nooooo ${ids}');
                                    _showScaffold("You have already achieved this skill.");
                                  }else {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                                      return TheTest('objective_');
                                    }));
                                  }
                                });
                              }
                              ),

                              testCard(testN: 'mySql', num: 19,onPressed: (){
                                var e= dbManager.matchLogo('mysql').then((ids){
                                  if(ids!= 0){
                                    print('noooo ${ids}');
                                    _showScaffold("You have already achieved this skill.");
                                  }else {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                                      return TheTest('mysql');
                                    }));
                                  }
                                });
                              }
                              ),

                              testCard(testN: 'jQuery', num: 20,onPressed: (){
                                var e= dbManager.matchLogo('jquery').then((ids){
                                  if(ids!= 0){
                                    print('noooo ${ids}');
                                    _showScaffold("You have already achieved this skill.");
                                  }else {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                                      return TheTest('jquery');
                                    }));
                                  }
                                });
                              }
                              ),

                              testCard(testN: 'javaScript', num: 21,onPressed: (){
                                var e= dbManager.matchLogo('javascript').then((ids){
                                  if(ids!= 0){
                                    print('nooooo ${ids}');
                                    _showScaffold("You have already achieved this skill.");
                                  }else {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                                      return TheTest('javascript');
                                    }));
                                  }
                                });
                              }
                              ),

                              testCard(testN: 'java', num: 22,onPressed: (){
                                var e= dbManager.matchLogo('java').then((ids){
                                  if(ids!= 0){
                                    print('nooo ${ids}');
                                    _showScaffold("You have already achieved this skill.");
                                  }else {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                                      return TheTest('java');
                                    }));
                                  }
                                });
                              }
                              ),

                              testCard(testN: 'Html', num: 23,onPressed: (){
                                var e= dbManager.matchLogo('html').then((ids){
                                  if(ids!= 0){
                                    print('nooo ${ids}');
                                    _showScaffold("You have already achieved this skill.");
                                  }else {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                                      return TheTest('html');
                                    }));
                                  }
                                });
                              }
                              ),

                              testCard(testN: 'go language', num: 24,onPressed: (){
                                var e= dbManager.matchLogo('go_lang').then((ids){
                                  if(ids!= 0){
                                    print('noooo ${ids}');
                                    _showScaffold("You have already achieved this skill.");
                                  }else {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                                      return TheTest('go_lang');
                                    }));
                                  }
                                });
                              }
                              ),

                              testCard(testN: 'react native', num: 25,onPressed: (){
                                var e= dbManager.matchLogo('react_native').then((ids){
                                  if(ids!= 0){
                                    print('nooo ${ids}');
                                    _showScaffold("You have already achieved this skill.");
                                  }else {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                                      return TheTest('react_native');
                                    }));
                                  }
                                });
                              }
                              ),

                              testCard(testN: 'math', num: 26,onPressed: (){
                                var e= dbManager.matchLogo('math').then((ids){
                                  if(ids!= 0){
                                    print('noooo ${ids}');
                                    _showScaffold("You have already achieved this skill.");
                                  }else {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                                      return TheTest('math');
                                    }));
                                  }
                                });

                              },
                              ),




                            ]
                        )
                    )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}



//todo------------------------ custom card -------------------------

class testCard extends StatelessWidget {

  final String testN;
  final int num;
  final Function onPressed;

  const testCard({Key key, this.testN, this.num,this.onPressed}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onPressed,
      child: Container(
          margin: const EdgeInsets.only(
            top: 16.0,
            bottom: 16.0,
            left: 12.0,
            right: 4.0,
          ),
          child: new Stack(
            children: <Widget>[
              // ---------------------------card------------------------------------
              Container(
                height: 80.0,
                width: double.infinity,
                margin: new EdgeInsets.only(left: 15.0,right: 0),
                decoration: new BoxDecoration(
                  color: Color(0xffD5FFFD),
                  shape: BoxShape.rectangle,
                  borderRadius: new BorderRadius.circular(8.0),
                  boxShadow: <BoxShadow>[
                    new BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10.0,
                      offset: new Offset(0.0, 10.0),
                    ),
                  ],
                ),
                child:ListTile(
                    title: Padding(
                      padding: const EdgeInsets.only(left:40.0,top: 6),
                      child: Text('$testN',style: TextStyle(fontSize: 20,),),
                    ), // todo make it easy
                    trailing:Text('25 questions' ,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color:Color(0xff18D3C5)),)
                ),

              ),
              //---------------------------------circle-------------------------------------
              Positioned(
                left: 0,
                top: 17,
                child: Container(
                  height: 50,
                  width: 50,
                  decoration:BoxDecoration(
                      color: Color(0xff18D3C5),
                      borderRadius: BorderRadius.all(Radius.circular(50))
                  ),

                  child: Center(child: Text('$num',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),)), //todo make it easy
                ),
              ),
            ],
          )
      ),
    );
  }
}
















//Todo ----------------------------------clip-------------------------------------------

class MessageClipper extends CustomClipper<Path> {

  @override
  Path getClip(Size size) {

    var endPoint= Offset(size.height,size.height);
    var controlPoint=Offset(50,size.height+140);

    final path = Path();

//    path.lineTo(0,size.height-80);
//    path.quadraticBezierTo(-120, size.height+550, 550, size.height-500);
//    path.lineTo(size.width-400, size.height-290);
//    path.lineTo(size.width-100,0);
//    return path;


//    Path getClip(Size size) {
    path.lineTo(-100.0, size.height - 380);
    path.quadraticBezierTo(size.width -500, size.height-340, size.width-500 , size.height,);
    path.quadraticBezierTo(size.width - (size.width -200), size.height+50, size.width-110, size.height - 250,);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

void _portraitModeOnly() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}