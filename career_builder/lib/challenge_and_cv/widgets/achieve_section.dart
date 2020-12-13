import 'package:careerbuilder/Test_Component/sql_database/dbmanager.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AchieveSection extends StatefulWidget {
  @override
  _AchieveSectionState createState() => _AchieveSectionState();
}

class _AchieveSectionState extends State<AchieveSection> {
  final dbRef =
      FirebaseDatabase.instance.reference().child('users_achievement');
  final dbRef2 = FirebaseDatabase.instance.reference().child('achievement');
  final List achivementsIds = [];
  final List achivementsData = [];

  final DbStudentManager dbManager = DbStudentManager();

  double DchallengePrecentage = 0;
  double WchallengePrecentage = 0;
  List<Logos> loglist; //the list of profile logo

  final _auth = FirebaseAuth.instance;
  final DBRef = FirebaseDatabase.instance.reference();
  FirebaseUser loggedInUser;

  String UID;

  //fetch from user achievements
  fetchUserAchieve() async {
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
      dbRef.orderByChild('user_id').equalTo(UID).once().then((userSnapshot) {
        print('achivement snapshot ${userSnapshot.value.values}');
        var userResponse = userSnapshot.value.values;
        if (userSnapshot.value != null) {
          for (var i = 0; i < userResponse.length; i++) {
            achivementsIds.add(userResponse.elementAt(i)['achievement_id']);
            var achiveId = achivementsIds[i];
            fetchAchievements(achiveId);
            print('$achivementsIds zeooooooooooooooooooooooo');
          }
          if (achivementsIds.isEmpty) {
            achivementsData.add('No Achievements yet.');
            setState(() {});
          }
          print('achivements list $achivementsIds');
        }
      });
    } else {
      UID = null;
      print('the id iss $UID nulllllllllll');
    }
  }

  //fetch from achivements
  fetchAchievements(var achiveId) {
    dbRef2.child('$achiveId').once().then((achiveSnapshot) {
      print('achievement snapshot ${achiveSnapshot.value}');
      achivementsData.add(achiveSnapshot.value['image']);
      setState(() {});
    });
  }

  @override
  void initState() {
    super.initState();
    fetchUserAchieve();
  }

  @override
  Widget build(BuildContext context) {
////    print('rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrhhhhhhhhhh${loglist.length}');
//    var sizedboxHeight;
//    if(loglist.length!=null){
//      int skilllength = loglist.length;
//      double equation = (skilllength * 60).toDouble();
//      sizedboxHeight = 50 + equation;
//    }else{
//      sizedboxHeight =100 ;
//    }


    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Color(0xffA2E8E8),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Icon(
                FontAwesomeIcons.medal,
                size: 35,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            //sachieve text
            Container(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                'ACHIEVEMENT',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        //vertical
        Container(
            margin: EdgeInsets.only(top: 3),
            width: MediaQuery.of(context).size.width - 60,
            height: 2,
            color: Color(0xff8CDBD8)),
//           achivementsData.isNotEmpty?
//                SizedBox(height: sizedboxHeight,
//                child: ListView.builder(
//                itemCount: ,
//                physics: const NeverScrollableScrollPhysics(),
//                itemBuilder: (context,index){
////               return Container(
////                 width: 80,
////                 height: 80,
////                 child: Image.network('${achivementsData[index]}',),
////                 );
//
//
//                },
//
//              ),
//           ):
//           Center(child: CircularProgressIndicator(
//                          valueColor:  AlwaysStoppedAnimation<Color>(Color(0xff09D8D2)),
//                          backgroundColor: Colors.white,
//                        )
//           ),

        SizedBox(
           height:200,
            child: FutureBuilder(
                future: dbManager.getLogoList(),
                // get all record
                builder: (context, snapshot) {
                  if (snapshot.hasData && !snapshot.hasError) {
                    loglist = snapshot.data;
                    if (loglist.length != 0) {
//                                                    loglist.length != null ?
                      return ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: loglist.length,
                          itemBuilder: (context, index) {
                            Logos lo = loglist[index];
                            if (lo.prfileLogo != null) {
                              return Container(
                                child: ClipOval(
                                  child: Align(
                                    child: Image.network(
                                      lo.prfileLogo,
                                      fit: BoxFit.cover,
                                      width: 90.0,
                                      height: 90.0,
                                    ),
                                  ),
                                ),
                              );
                            } else {
                              return Text('');
                            }
                          });
                    }
                    return Center(
                        child: Padding(
                      padding: const EdgeInsets.only(left: 0),
                      child: Text(
                        "No achievement yet ",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16,color: Colors.grey),
                      ),
                    ));
                  }
                  return CircularProgressIndicator();
                }))
      ],
    );
  }
}
