import 'package:careerbuilder/Bottom_Navigation_Bars/MainBottom/main_bottom.dart';
import 'package:careerbuilder/challenge_and_cv/screens/challengeScreen.dart';
import 'package:careerbuilder/challenge_and_cv/screens/dailyScreen.dart';
import 'package:careerbuilder/challenge_and_cv/widgets/menu_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/services.dart';

class ChallengesList extends StatefulWidget {
  @override
  _ChallengesListState createState() => _ChallengesListState();
}

class _ChallengesListState extends State<ChallengesList> {

  //firebase instances
  final dbRef = FirebaseDatabase.instance.reference().child("user_skills");
  final dbRef2 = FirebaseDatabase.instance.reference().child('skills');
  final _auth = FirebaseAuth.instance;
  final DBRef = FirebaseDatabase.instance.reference();
  FirebaseUser loggedInUser ;
  String UID;


  //TODO: edit user id

  //variables
  var userId ;
  var go = 'Go lang';
  var c = 'C++';
  var dataStructured = 'Data Structured';

  //list
  final List dailyChallengeLang = [
    'java',
    'python',
    'xml',
    'ccna',
    'go_lang',
    'perl',
    'c_plus',
    'bootstrap',
    'javascript',
    'datastruct',
  ];

   getCurrentUser()async{
     try{
     FirebaseUser user = await _auth.currentUser();
       if(user !=null){
         setState(() {
           loggedInUser = user;
           UID = loggedInUser.uid;
         });
         userId=UID;
         print(loggedInUser.uid);
         print(loggedInUser.email);
       }else{
         setState(() {
           UID=null;
         });
       }
     } catch(e){
       print(e);
     }
    
   }

  Future<bool> _onBackPressed(){

     Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return MainBottom(numOfPage: 3,); // back to challenge screen
                    },
                  ));
}

  @override
  void initState() {
    super.initState();

    getCurrentUser();

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Color(0xff09D8D2),
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark));


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Daily List'),
          centerTitle: true,
          backgroundColor: Color(0xff09D8D2),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return MainBottom(numOfPage: 3,);
                },
              ));
            },
          ),
        ),
        endDrawer: Menu(),
        body: WillPopScope(
          onWillPop: _onBackPressed,
                  child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/challenge_cv/programmer.jpg'),
              fit: BoxFit.cover,
            )),
            child: SafeArea(
              child: Center(
                  child: FutureBuilder(
                      //deal with user_skills and fetch every record depend on user id=2
                      future: dbRef
                      //TODO: edit user id
                          .orderByChild("user_id")
                          .equalTo('$userId')
                          .once(),
                      builder: (context, AsyncSnapshot<DataSnapshot> snapshot) {

                        var response;
                        if (snapshot.hasData) {
                          if (snapshot.data.value is List) {
                            print('  data in user skills ${snapshot.data.value}');
                            response = snapshot.data.value;
                          } else if (snapshot.data.value is Map) {
                            print(
                                '  data in user skills ${snapshot.data.value.values}');
                            response = snapshot.data.value.values;
                          }

                          if (snapshot.data.value == null||snapshot.data.value['status']=='old') {
                            return Container(
                              child: Text(
                                'no challenges yet',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w700),
                              ),
                            );
                          }


                          return ListView.builder(
                            itemCount: response.length,
                            itemBuilder: (BuildContext context, int index) {
                              var skillId = response.toList()[index]['skill_id'];
                              if (response.toList()[index]['status'] ==
                                  'inprogress' || response.toList()[index]['status']=='old') {
                                return Container();
                              }
                              print('skill id $skillId');
                              return FutureBuilder(
                                //deal with skills and fetch lang name and level
                                future: dbRef2.child('$skillId').once(), //0,1,2
                                builder: (context, snapshot2) {
                                  if (snapshot2.hasData) {
                                    print(
                                        '  data in skills ${snapshot2.data.value}');
                                    var langName = snapshot2.data.value['name'];
                                    if (dailyChallengeLang.contains(langName)) {
                                      String text = langName;
                                      String level =
                                          snapshot2.data.value['level'];
                                      if (snapshot2.data.value['name'] ==
                                          'go_lang') {
                                        text = go;
                                      } else if (snapshot2.data.value['name'] ==
                                          'c_plus') {
                                        text = c;
                                      } else if (snapshot2.data.value['name'] ==
                                          'datastruct') {
                                        text = dataStructured;
                                      }
                                      return Column(
                                        children: <Widget>[
                                          Container(
                                              margin: EdgeInsets.only(top: 25,bottom: 15),
                                              width: 250,
                                              height: 60,
                                              child: RaisedButton(
                                                  color: Color(0xFF09D8D2),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  30))),
                                                  onPressed: () {
                                                    Navigator.push(context,
                                                        MaterialPageRoute(
                                                            builder: (context) {
                                                      return  DailyScreen( snapshot2.data.value['name'] , level, skillId);
                                                          
                                                    }));
                                                  },
                                                  child: Container(
                                                      margin: EdgeInsets.only(
                                                          bottom: 15),
                                                      child: Text("$text",
                                                          style: TextStyle(
                                                              fontSize: 20,
                                                              color: Colors
                                                                  .white)))))
                                        ],
                                      );
                                    } else {
                                      return Container();
                                    }
                                  }
                                  return Container();
                                  // return Center(
                                  //     child: CircularProgressIndicator(
                                  //   valueColor: AlwaysStoppedAnimation<Color>(
                                  //       Color(0xff09D8D2)),
                                  //   backgroundColor: Colors.white,
                                  // ));
                                },
                              );
                            },
                          );
                        }
                        return Center(
                            child: CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Color(0xff09D8D2)),
                          backgroundColor: Colors.white,
                        ));
                      })),
            ),
          ),
        ));
  }
}
