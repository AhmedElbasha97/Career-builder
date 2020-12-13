
import 'package:careerbuilder/challenge_and_cv/models/user.dart';
import 'package:careerbuilder/challenge_and_cv/screens/weekly_list.dart';
import 'package:careerbuilder/challenge_and_cv/widgets/menu_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'DailyList.dart';




class ChallengeScreen extends StatefulWidget {
  @override
  _ChallengeScreenState createState() => _ChallengeScreenState();
}

class _ChallengeScreenState extends State<ChallengeScreen> {

final userDbRef = FirebaseDatabase.instance.reference().child('users');
int convertedDailyScoreFromFire;
var totalscore;

List <User> allData = []; // list data in the array

final _auth = FirebaseAuth.instance;
final DBRef = FirebaseDatabase.instance.reference();
FirebaseUser loggedInUser ;
String UID;

getCurrentUser()async {
  try {
    FirebaseUser user = await _auth.currentUser();
    if (user != null) {
      setState(() {
        loggedInUser = user;
        UID = loggedInUser.uid;
      });

      print(loggedInUser.email);
      print(loggedInUser.uid);
    } else {
      setState(() {
        UID = null;
      });
    }
  } catch (e) {
    print(e);
  }

  if (UID != null) {
    DBRef.child("users").orderByKey().equalTo(UID).once().then((
        DataSnapshot snap) {
      var keys = snap.value.keys; //return unique keys
      var data = snap.value;
      for (var key in keys) {

        allData.add(
            User(
                email: data[key]['email'],
                fName: data[key]['first_name'],
                lName: data[key]['last_name'],
                img: data[key]['profile_picture'],
                job: data[key]['job'],
            )
        );

      }
      setState(() {
        print('Length : ${allData.length}');
      });
    });
    //todo -------------------------------------
  }
  else {
    print('no UID yet ${allData.length}');

  }
}

  fetchUser()async{
    try {
      FirebaseUser user = await _auth.currentUser();
      if (user != null) {
        setState(() {
          loggedInUser = user;
          UID = loggedInUser.uid;
        });

        print(loggedInUser.email);
        print(loggedInUser.uid);
      } else {
        setState(() {
          UID = null;
        });
      }
    } catch (e) {
      print(e);
    }

    userDbRef.orderByChild('id').equalTo(UID).once().then(( snapshot){
      var keys = snapshot.value.keys; //return unique keys
      var data = snapshot.value;
   var userResponse = snapshot.value;
      for (var key in keys) {
        if(userResponse!=null){
          var dailyScoreFromFire= data[key]['total_points'] ;
          totalscore=dailyScoreFromFire;
          // convertedDailyScoreFromFire=int.parse(dailyScoreFromFire);
          setState(() {});
          print('daily $dailyScoreFromFire');
        }

      }
     print('userResponse1 $data');

  });
  }

  @override
  void initState() {
    super.initState();
    fetchUser();
    // user= User.fetchUser();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent.withOpacity(0.3),
//      statusBarIconBrightness: Brightness.dark,
//      systemNavigationBarColor: Colors.white,
//      systemNavigationBarIconBrightness: Brightness.dark
    ));
  }
  


  @override

  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(
            endDrawer: Drawer(
              child: Menu(),
            ),

            body: Container(
          color: Color(0xffC4EAEB),
          child: Column(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height*0.40,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/challenge_cv/boy.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Flexible(
                flex: 2,
               child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft:Radius.circular(50.0),
                        topRight: Radius.circular(50.0)),
                    color: Color(0xffEEEEEE),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      //your points
                     totalscore!=null? Card(
                        child: Container(
                          padding: EdgeInsets.only(bottom:4),
                          width:MediaQuery.of(context).size.width - 150,
                          child: Column(
                            children: <Widget>[
//                        text
                              Container(
                                child: Text('Your Points',
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.amber,
                                  ),),
                              ),
//                        points
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Container(
//                              padding: EdgeInsets.only(),
                                      child:Icon(FontAwesomeIcons.award,
                                        size: 40,
                                        color: Color(0xff09D8D2),
                                      )
                                  ),
                                  SizedBox(width: 10,),
                                   Text('$totalscore',
                                      // \nDaily Score :${_score.dailyScore}\nWeekly Score: ${_score.weeklyScore} 
                                        style: TextStyle(
                                            fontSize: 35,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black45 ),),
                                  Text('xp',
                                    style: TextStyle(
                                      color: Colors.black45,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),)
                                ],
                              ),
                            ],
                          ),
                          color: Colors.white,

                        ),
                      ):Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(child: CircularProgressIndicator(
                            valueColor:  AlwaysStoppedAnimation<Color>(Color(0xff09D8D2)),
                            backgroundColor: Colors.white,
                          )),
                      ),
                      //choose
                      Container(  
                        child: Text(
                          'choose your challenge',
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.black45,
                            letterSpacing: 2.0,
                          ),
                        ),
                      ),
//                  challenges
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            RaisedButton(
                              color: Color(0xff09D8D2),
                              shape: RoundedRectangleBorder(borderRadius:BorderRadius.all(Radius.circular(30.0))),
                              onPressed: (){
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context){
                                      return ChallengesList();
                                    },));
                              },
                              child: Column(
                                children: <Widget>[
                                  //image
                                  Container(
                                    margin: EdgeInsets.only(right: 10),
                                    height: 120,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      image:DecorationImage(
                                          image: AssetImage('assets/challenge_cv/education.png'),
                                          fit: BoxFit.contain
                                      ),
                                    ),
                                  ),
//                            text
                                  Container(
                                    margin: EdgeInsets.only(bottom: 15,left: 15),
                                    child: Text('Daily',
                                      style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 40,),
                            RaisedButton(
                              color: Color(0xff09D8D2),
                              shape: RoundedRectangleBorder(borderRadius:BorderRadius.all(Radius.circular(30.0))),
                              onPressed: (){
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context){
                                      return Weeklylist();
                                    },));
                              },
                              child: Column(
                                children: <Widget>[
                                  //image
                                  Container(
                                    height: 120,
                                    width: 105,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(20)),
                                      image:DecorationImage(
                                        image: AssetImage('assets/challenge_cv/Capture.PNG'),
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                  // text
                                  Container(
                                    margin: EdgeInsets.only(bottom: 15),
                                    child: Text('Weekly',
                                      style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}