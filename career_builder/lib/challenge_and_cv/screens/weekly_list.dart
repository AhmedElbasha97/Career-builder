import 'package:careerbuilder/Bottom_Navigation_Bars/MainBottom/main_bottom.dart';
import 'package:careerbuilder/challenge_and_cv/screens/challengeScreen.dart';
import 'package:careerbuilder/challenge_and_cv/screens/weekly_challenge.dart';
import 'package:careerbuilder/challenge_and_cv/widgets/menu_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class Weeklylist extends StatefulWidget {
  @override
  _WeeklylistState createState() => _WeeklylistState();
}

class _WeeklylistState extends State<Weeklylist> {

  //firebase instances
 final dbRef = FirebaseDatabase.instance.reference().child("user_skills");
  final dbRef2 = FirebaseDatabase.instance.reference().child('skills');
 final _auth = FirebaseAuth.instance;
 final DBRef = FirebaseDatabase.instance.reference();
 FirebaseUser loggedInUser ;
 String UID;

  //variables
   var userId;
   var go = 'Go lang';
   var csharp = 'C#';
   var c = 'C++';

  
  //list
  final List weeklyChallengeLang = [
    'java',
    'c_sharp',
    'python',
    'c_plus',
    'javascript',
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
                      return MainBottom(numOfPage: 3,);
                    },
                  ));
}




@override
  void initState() {
   getCurrentUser();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Weekly List'),
          centerTitle: true,
          backgroundColor: Color(0xff09D8D2),
          leading: IconButton(icon: Icon(Icons.arrow_back),onPressed: (){
            Navigator.push(context,
                                    MaterialPageRoute(builder: (context){
                                      return MainBottom(numOfPage: 3,);// back to challenge screen
                                    },));
          },),
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
                      future:
                          dbRef.orderByChild("user_id").equalTo('$userId').once(),
                      builder: (context, AsyncSnapshot<DataSnapshot> snapshot) {
                        var response;
                        if (snapshot.hasData) {
                          if (snapshot.data.value is List) {
                            // print('  data in user skills ${snapshot.data.value}');
                            response = snapshot.data.value;
                          } else if (snapshot.data.value is Map) {
                            print(
                                '  data in user skills ${snapshot.data.value.values}');
                            response = snapshot.data.value.values;
                          }

                          if(snapshot.data.value==null){
                           return Container(child: Text('No challenges yet',
                           style: TextStyle(
                             fontSize: 18,
                             color: Colors.black54,
                             fontWeight: FontWeight.w700
                             ),),);
                         }
                          return ListView.builder(
                            itemCount: response.length,
                            itemBuilder: (BuildContext context, int index) {
                              var skillId = response.toList()[index]['skill_id'];
                              if (response.toList()[index]['status'] ==
                                  'inprogress' || response.toList()[index]['status']=='old') {
                                return Center(child: Container());
                              }
                              // print('skill id $skillId');
                              return FutureBuilder(
                                //deal with skills and fetch lang name and level
                                future: dbRef2.child('$skillId').once(), //0,1,2
                                builder: (context, snapshot2) {

                                  if (snapshot2.hasData) {
//                                    var langName=snapshot2.data.value['name'];
//                                    if(langName!='java'||langName!='c_sharp'||langName!='python'||langName!='c_plus'||langName!='javascript'){
//                                      return Center(child: Container(child: Text('No challenges yet'),),);
//                                    }
                                    print(
                                        '  data in skills ${snapshot2.data.value}');
                                    if (weeklyChallengeLang
                                        .contains(snapshot2.data.value['name'])) {
                                      String text = snapshot2.data.value['name'];
                                      String level =snapshot2.data.value['level'];
                                      if (snapshot2.data.value['name'] ==
                                          'go_lang') {
                                        text = go;
                                      } else if (snapshot2.data.value['name'] ==
                                          'c_plus') {
                                        text = c;
                                      }
                                       else if (snapshot2.data.value['name'] ==
                                          'c_sharp') {
                                        text = csharp;
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
                                                      return WeeklyChallenge(
                                                          snapshot2.data.value['name'] , level, skillId);
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
                          //         return Center(child: CircularProgressIndicator(
                          //   valueColor:  AlwaysStoppedAnimation<Color>(Color(0xff09D8D2)),
                          //   backgroundColor: Colors.white,
                          // ));
                                },
                              );
                            },
                          );
                        }
                        return Center(child: CircularProgressIndicator(
                            valueColor:  AlwaysStoppedAnimation<Color>(Color(0xff09D8D2)),
                            backgroundColor: Colors.white,
                          ));
                      })),
            ),
          ),
        ));
  }
}
