import 'dart:math';

import 'package:careerbuilder/Bottom_Navigation_Bars/MainBottom/main_bottom.dart';
import 'package:careerbuilder/Test_Component/Test_models/cong_achiev_id.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:careerbuilder/Profile_Component/Screens/profile_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:careerbuilder/Test_Component/sql_database/dbmanager.dart';


var profileImg;
var profileImgName;
var profileImgID;


class Congratulation extends StatefulWidget {

  final int ExamScore; // score of the test
  final String theName;  // test name

  Congratulation( this.ExamScore,this.theName);

  @override
  _CongratulationState createState() => _CongratulationState();
}

class _CongratulationState extends State<Congratulation> {

  final DBRef = FirebaseDatabase.instance.reference();
  @override
  void initState() {
    super.initState();
    getCurrentUser();
    getTheIds();
  }

  final _auth = FirebaseAuth.instance;
  FirebaseUser loggedInUser ; // to store user
  String UID;
  int maxIDS = 0;

  String urlach = 'https://career-builder-54d16.firebaseio.com/achievement.json';

  List UserAchId=[];

  getCurrentUser()async{

    try{
      FirebaseUser user=  await _auth.currentUser();
      if(user!=null){
        setState(() {
          loggedInUser=user;
          UID=loggedInUser.uid;
        });

        print(loggedInUser.email);
        print(loggedInUser.uid);

      }

    }catch(e){
      print(e);
    }
    DBRef.child("user_skills").orderByChild('user_id').equalTo(UID).once().then((DataSnapshot snap) {


      var keys =snap.value.keys ; //return unique keys
      var data=snap.value;

      for(var key in keys){
        UserAchId.add(
            CongAchievId(
              id:data[key]['id'],
            )
        );
      }
      getProfileLogo();

    });

  }



  getTheIds  () async {

    DBRef.child('users_achievement').once().then((DataSnapshot snapshot){
      Map<dynamic, dynamic> values = snapshot.value;
      values.forEach((key,values) {

        var id =  values["id"] ;
        print(id);
        if (id > maxIDS){
          maxIDS = id;
        }
      });
      maxIDS = maxIDS + 1;
    });
    print(maxIDS);
  }


  final DbStudentManager dbManager=DbStudentManager();
  Logos logo;

  ///todo----------------------------Profile Logo-----------------------------------------------
  List<Logos> profileLogo = [];
  ///---------------------------------------------------------------------------

  Future<http.Response> getProfileLogo() async {
    try {
      var response = await http.get(urlach);
      if (response.statusCode == 200) {
        String responeBody = response.body;
        var jsonBody = jsonDecode(responeBody);
        for (var data in jsonBody) {
          if (data['achievementprofile'] == widget.theName) {
            profileLogo.add(Logos(prfileLogo: data['image'],nameOfLogo: data['achievementprofile']));
            profileImg=data['image'];
            profileImgName=data['achievementprofile'];
            profileImgID=data['id'];


            DBRef.child('users_achievement').push().set({  //todo:  uid instead of push
              'achievement_id':'$profileImgID', // random
              'id':maxIDS,
              'take_achievement':"take",
              'user_id':UID,

            });

            print(profileImg);

          }
        }
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      throw 'NO Connection ';
    }
    _submentAchievement();
  }
//-----------------------------------------------------------



  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    return

      Scaffold(
        body: WillPopScope(
            onWillPop: _onBackPressed,
          child: Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/Test_Result/cong.png"),
                    fit: BoxFit.fitHeight
                )
            ),
            child: Stack(
//           mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Positioned(
                    top: height/4,
                    left:width- 280,
                    child: Text('Congratulations ! ',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.teal),)),
                SizedBox(height: 20,),
                Positioned(
                  top: height/4,
                  left:width- 340,
                  child: Container(
                    height: 320,
                    width: 320,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/Test_Result/congratulation-logo/${widget.theName}-cong.png"),

                          fit: BoxFit.fitWidth,
                          //TODO => logo
                        )
                    ),
                  ),
                ),

                Positioned(
                    top: height/1.6,
                    left:width- 280,
                    child: Text(' ${widget.theName} completed! ',style: TextStyle(fontSize: 25,),)
                  //TODO => completed text

                ),
                SizedBox(height: 0,),

                Positioned(
                  top: height/1.4,
                  left: width-300,
                  child: Container(
                    height: height/8,
                    width: width/1.5,
                    //height: 70
                    // width : 200
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.black54.withOpacity(0.5),
                    ),
                    child: Container(
                      height: 100,
                      width: 70,
                      child:
                      ListTile(
                        leading:Image.asset('assets/Test_Result/achiev.png'),
                        title: Text('+ ${widget.ExamScore}',  // score number
                          style: TextStyle(color: Color(0xffD6B485), fontSize: 30,),),
                        subtitle: Text('xp Earned',style: TextStyle(color:Color(0xffD6B485 ),fontSize: 20),
                        ),

                      ),
                    ),
                  ),
                ),

                Positioned(
                  top: height/1.1,
                  left: width-220,
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return MainBottom(scoreComing: widget.ExamScore,numOfPage: 4,);
                      }));
                    },
                    //TODO : go to profile
                    child: Container(
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xff74CDE0).withOpacity(0.8),
                            blurRadius: 10.0,
                            // has the effect of softening the shadow
                            spreadRadius: 0.0,
                            // has the effect of extending the shadow
                            offset: Offset(0, 7),
                          )
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Color(0xff09D8D2),
                      ),
                      child: Center(child: Text('Done',style: TextStyle(color: Colors.white),)),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      );
  }

  void _submentAchievement() { // in congratulation page
    if(logo==null){
      Logos sd= Logos(prfileLogo: profileImg,nameOfLogo: profileImgName);
      dbManager.deleteINpro(profileImgName);
      dbManager.insertLogo(sd).then((id) { //callback we are choose id or any name else
        print('student added to db ${id}');

      });
    }


  }


//  Widget congDisplay(String conImage){
//
//   return  ClipOval(
//     child:
//     Image.network(
//       conImage,
//       width: 50,
//       height: 190,
//       fit: BoxFit.fitWidth,
//     ),
//   );
//
//  }

  Future <bool> _onBackPressed() {
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return MainBottom(scoreComing: widget.ExamScore,numOfPage: 4,);
    }));
  }
}


