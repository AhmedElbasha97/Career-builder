
// ------------------import packages---------------------
import 'dart:async';

import 'package:careerbuilder/Bottom_Navigation_Bars/MainBottom/main_bottom.dart';
import 'package:careerbuilder/Test_Component/Screens/tests_page.dart';
import 'package:careerbuilder/Test_Component/Test_models/skillInMove.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter_boom_menu/flutter_boom_menu.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'dart:math';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

// -----------------import pages--------------------------------

import 'package:careerbuilder/Test_Component/Screens/congratulation.dart';
import 'package:careerbuilder/Test_Component/Test_models/myQuestionModle.dart';
import 'package:careerbuilder/Profile_Component/Screens/profile_page.dart';
import 'package:careerbuilder/Test_Component/Test_models/user_data.dart';
import 'package:careerbuilder/Test_Component/sql_database/dbmanager.dart';
import 'package:careerbuilder/Test_Component/Test_models/skill_model.dart';


Random random = Random(); // random query
//-----------------question variables--------------------
var myquestion; // to store the random question

var myAnswer;
var storingB;
//--------------------------------------------------
var progressImage;
var progressName;
//------------------------------------
var skillId;
var skillName;
var skillLevel;
//------------------------------------
var skIdFire;


class TheTest extends StatefulWidget {
  final String testName;

  TheTest(this.testName);

  @override
  _TheTestState createState() => _TheTestState();
}

class _TheTestState extends State<TheTest> {
  int maxIDS = 0;
  int randomQS;
  int exit=25;// variable to finish exam
  bool dataHasNotDisplayed=true ;

  var myScore = 0;
//todo --------------Firebase setUp--------------
  final _auth = FirebaseAuth.instance;
  FirebaseUser loggedInUser ; // to store user
  String UID; // to store user.uid
  final DBRef = FirebaseDatabase.instance.reference();

  List <SkInMove> SKlist = []; // list data in the array
  List<String>stringID=[];
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
        SKlist.add(
            SkInMove(
                id: data[key]['id'],
                skill_id: data[key]['skill_id'],
                status: data[key]['status']
            )

        );
        stringID.add(data[key]['skill_id'].toString());

      }
      print('test skill id  $stringID');
    });

  }

  /// --------------end of firebase setup--------------------


  final GlobalKey<AnimatedListState> _listKey = GlobalKey();
  ScrollController scrollController;
  bool scrollVisible = true;

//  bool _firstPrees=true;
  String url = 'https://career-builder-54d16.firebaseio.com/questions.json';
  List<myQuestionModel> _myData = []; // array to store the data come from firebase

  ///---------------------------------------------------------------------------
  final DbStudentManager dbManager=DbStudentManager();
  InPro Inpro;
  String urlach = 'https://career-builder-54d16.firebaseio.com/achievement.json';
  List<InPro> _inProgressList = [];
  ///---------------------------------------------------------------------------
  String urlSkill = 'https://career-builder-54d16.firebaseio.com/skills.json';
  List <Skill> _skillList=[];

  @override
  void initState() {
    super.initState();
    loadData();
    getCurrentUser();
    getTheIds();

  }

  void setDialVisible(bool value) {
    setState(() {
      scrollVisible = value;
    });
  }

  Decision()async{
    // myScore/100 => get percentage;
    if (myScore >= 100) {
      print(myScore);
      await getSkill();
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return Congratulation(myScore, widget.testName);
      }));
    }
    if(myScore<100){
      await getSkill();
      await loadLogo();
      _submentInprogress();
    }

  }

  //TODO 2:  --------------------------- fetching Logo ---------------------------
  Future<http.Response> loadLogo() async {
    try {
      var response = await http.get(urlach);
      if (response.statusCode == 200) {
        String responeBody = response.body;
        var jsonBody = jsonDecode(responeBody);
        for (var data in jsonBody) {
          if (data['languagelogo'] == widget.testName) {
            _inProgressList.add(InPro(inprogressImage: data['image'],nameOfExam: data['languagelogo']));
            progressImage=data['image'];
            progressName=data['languagelogo'];
            print(progressImage);
          }
        }

      } else {
        print(response.statusCode);
      }
    } catch (e) {
      throw 'NO Connection ';
    }
  }
  ///--------------------------- End of fetching Logo ----------------------------------

  void _submentInprogress() {
    if(Inpro==null){

      dbManager.matchINPro(progressName).then((id){
        dbManager.deleteINpro(progressName).then((i){
          InPro sd= InPro(inprogressImage: progressImage,inproScore: myScore,nameOfExam: progressName);
          dbManager.insertInprogress(sd).then((id) { //callback we are choose id or any name else
            print('student added to db ${id}');
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
              return MainBottom(scoreComing: myScore,numOfPage: 4,);
            }));
          });

        });
      });
//

    }


  }

  //TODO 1:  --------------------------- fetching the question data ---------------------------

  Future<http.Response> loadData() async {
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        String responeBody = response.body;
        var jsonBody = jsonDecode(responeBody);
        for (var data in jsonBody) {
          if (data['test_name'] == widget.testName) {
            if(data['type']=='test'){
              _myData.add(myQuestionModel(data['question'], data['answer'], data['score'],
                  data['test_name'], data['id']));

            }
          }
        }
      } else {
        print(response.statusCode);
        _showMyMessage(context,"please check your internet connection" ,"something went wrong when you try to connect to the server", 1);

      }
    } catch (e) {
      _showMyMessage(context,"please check your internet connection" ,"something went wrong when you tried to connect to the server", 1);
      throw 'NO Connection ';

    }
  }

  ///--------------------------- End of fetching question data ----------------------------------
// Todo:- to get ids from the database and increase it
  getTheIds  () async {

    DBRef.child('user_skills').once().then((DataSnapshot snapshot){
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

  Future <http.Response> getSkill() async {
    try {
      var response = await http.get(urlSkill);
      if (response.statusCode == 200) {
        String responeBody = response.body;
        var jsonBody = jsonDecode(responeBody);
        for (var data in jsonBody) {
          if (data['name'] == widget.testName) {


   ///----------------level zero ----------------------------

            if(myScore < 25){
              print('this my final score $myScore');
              if(data['level']=='0'){
                _skillList.add(Skill(id: data['id'],level:data['level'],name: data['name'] ));
                skillId=data['id'];
                skillName=data['name'];
                skillLevel=data['level'];


                  DBRef.child("user_skills").orderByChild('user_id').equalTo(UID).once().then((DataSnapshot snap) {
                    print(UID);
                    var keys =snap.value.keys ; //return unique keys
                    var data=snap.value;
                    for(var key in keys){
                      if(stringID.contains(skillId)){  // don't repeat the id
                        print('kkkkkkkkk');
                      print('uuuuuuuuuuuuuuuuuuuuuuu$key');
                      if(data[key]['skill_id']==skillId){
                        print(data[key]['skill_id']);
                        DBRef.child('user_skills').child(key).update(
                            {
                              'skill_id': '${skillId}',
                            });
                        print('updated');
                      }
                      }  else {
                        print('f 0');
                        DBRef.child('user_skills').push().set({
                          'id':maxIDS,
                          'skill_id':skillId,
                          'status':"inprogress",
                          'user_id':UID
                        });
                        stringID.add(skillId);
                      }

                    }
                  });
              }
            }



   ///-----------------level zero ---------------------------

           if(myScore>=25 && myScore <=30){
              print('this my final score $myScore');
              if(data['level']=='1'){
                _skillList.add(Skill(id: data['id'],level:data['level'],name: data['name'] ));
                skillId=data['id'];
                skillName=data['name'];
                skillLevel=data['level'];


                DBRef.child("user_skills").orderByChild('user_id').equalTo(UID).once().then((DataSnapshot snap) {
                  print(UID);
                  var keys =snap.value.keys ; //return unique keys
                  var data=snap.value;
                  for(var key in keys){
                    if(stringID.contains(skillId)){  // don't repeat the id
                      print('kkkkkkkkk');
                      print('uuuuuuuuuuuuuuuuuuuuuuu$key');
                      if(data[key]['skill_id']==skillId){
                        print(data[key]['skill_id']);
                        DBRef.child('user_skills').child(key).update(
                            {
                              'skill_id': '${skillId}',
                            });
                        print('updated');
                      }
                    }  else {
                      print('f 1');
                      DBRef.child('user_skills').push().set({
                        'id':maxIDS,
                        'skill_id':skillId,
                        'status':"new",
                        'user_id':UID
                      });
                      stringID.add(skillId);
                    }

                  }
                });
              }
            }
         if(myScore>=31 && myScore <=60){
              print('this my final score $myScore no again?');
              if(data['level']=='2'){
                _skillList.add(Skill(id: data['id'],level:data['level'],name: data['name'] ));
                skillId=data['id'];
                skillName=data['name'];
                skillLevel=data['level'];


                DBRef.child("user_skills").orderByChild('user_id').equalTo(UID).once().then((DataSnapshot snap) {
                  print(UID);
                  var keys =snap.value.keys ; //return unique keys
                  var data=snap.value;
                  for(var key in keys){
                    if(stringID.contains(skillId)){  // don't repeat the id
                      print('kkkkkkkkk');
                      print('uuuuuuuuuuuuuuuuuuuuuuu$key');
                      if(data[key]['skill_id']==skillId){
                        print(data[key]['skill_id']);
                        DBRef.child('user_skills').child(key).update(
                            {
                              'skill_id': '${skillId}',
                            });
                        print('updated');
                      }
                    }  else {
                      print('f 2');
                      DBRef.child('user_skills').push().set({
                        'id':maxIDS,
                        'skill_id':skillId,
                        'status':"new",
                        'user_id':UID
                      });
                      stringID.add(skillId);
                    }

                  }
                });
              }
            }

         if(myScore>=61 ){
              print('this my final score $myScore');
              //   || myScore>=100
              if(data['level']=='3'){
                _skillList.add(Skill(id: data['id'],level:data['level'],name: data['name'] ));
                skillId=data['id'];
                skillName=data['name'];
                skillLevel=data['level'];


                DBRef.child("user_skills").orderByChild('user_id').equalTo(UID).once().then((DataSnapshot snap) {
                  print(UID);
                  var keys =snap.value.keys ; //return unique keys
                  var data=snap.value;
                  for(var key in keys){
                    if(stringID.contains(skillId)){  // don't repeat the id
                      print('kkkkkkkkk');
                      print('uuuuuuuuuuuuuuuuuuuuuuu$key');
                      if(data[key]['skill_id']==skillId){
                        print(data[key]['skill_id']);
                        DBRef.child('user_skills').child(key).update(
                            {
                              'skill_id': '${skillId}',
                            });
                        print('updated');
                      }
                    }  else {
                      print('f 3');
                      DBRef.child('user_skills').push().set({
                        'id':maxIDS,
                        'skill_id':skillId,
                        'status':"new",
                        'user_id':UID
                      });
                      stringID.add(skillId);
                    }

                  }
                });
              }
            }
          }
        }
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      throw 'NO Connection ';
    }
  }

  @override
  Widget build(BuildContext context) {

    _portraitModeOnly();
//    final answer = Provider.of<Check>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff09d8d2),
      ),
      body: SafeArea(
        child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/Test_Result/Task.png"),
                  fit: BoxFit.fitWidth,
                )),
            child:renderBody()
        ),
      ),
      floatingActionButton: BoomMenu(
        animatedIcon: AnimatedIcons.play_pause,
        backgroundColor: Color(0xff09D8D2),
        animatedIconTheme: IconThemeData(size: 22.0),
//        child: Icon(Icons.add),
//        onOpen: () => print('OPENING DIAL'),
//        onClose: () => print('DIAL CLOSED'),
        scrollVisible: scrollVisible,
        overlayColor: Colors.black,
        overlayOpacity: 0.7,
        children: [
          MenuItem(
            child: Icon(Icons.thumb_up, color: Colors.black),
            title: "finish ?",
            titleColor: Colors.white,
            subtitle: "Finish the exam first",
            subTitleColor: Colors.white,
            backgroundColor: Colors.teal[400],
            onTap: () {
              Decision();
            },
          ),
        ],
      ),
    );

  }

  //TODO ----------------- List from database UI & implementation ------------------------------


  Widget renderBody(){

    if (dataHasNotDisplayed==true) {
      const oneSecond = const Duration(milliseconds: 1);
      new Timer.periodic(oneSecond, (Timer t) {
        setState(() {});
        t.cancel();
      });

    }

    if(_myData.length != 0){
      dataHasNotDisplayed=false;
      print(dataHasNotDisplayed);
//      randomQS=random.nextInt(80);
      var shwo=[];

      for(int y =0 ; y<_myData.length;y++){
        randomQS=random.nextInt(_myData.length);
//        print(_myData.length);

        for(int i=0; i<25;i++) {
          if(shwo.contains(randomQS)){
            continue;
          }else{
            shwo.add(randomQS);
//          print( '${shwo}');
          }
        }
      }

      if(exit==0){
        return showProcessingDialog();
      }
      return AnimatedList(

          key: _listKey,
          initialItemCount:25,
          itemBuilder: (context, index, animation){

//            print(shwo[index]);
//          print(_myData.length);
            dataHasNotDisplayed=false;
            return _buildItem(index, _myData[widget.testName=='math'?index:shwo[index]], animation);
          }
      );
    }
    else if (_myData.length==0){
      return Center(
        child: CircularProgressIndicator(),
      );
    }

  }


  Widget _buildItem(int index, var item, Animation<double> animation) {

    dataHasNotDisplayed=false;
    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: ScaleTransition(
        child: Container(
          padding: EdgeInsets.all(8),
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.5),
              borderRadius: BorderRadius.all(Radius.circular(50))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20, right: 210),
                    child: Text('Question:',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.white)),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, bottom: 40),
                child: Text('${item.question}',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white)),
              ),
//                Consumer<Check>(
//                    builder: (context, answer, child) =>
//                    (
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      if (item.answer== 'FALSE') {
//                              answer.chanege1(true);
//                              myScore = answer.score;
                        setState(() {
                          exit -= 1;
                          myScore+=4;
                        });
                        print('right the  is ${item.answer}+$myScore in id ${item.id}');
                        _removeLastItem(index);
                        _myData.removeWhere((ite) => ite.id == '${item.id}');

                              DBRef.child('test').push().set({
                                'duration':'30 minutes', // random
                                'name':'${widget.testName}',
                                'question_id':"${item.id}",
                                'score':'4',
                                'user_id':UID

                              });

                      } else {
//                              answer.chanege1(false);
                        print('false !!!! the correct answer is ${item.answer} in id ${item.id}');
                        _removeLastItem(index);
                        _myData.removeWhere((ite) => ite.id == '${item.id}');
                        setState(() {
                          exit -= 1;
                        });
                              DBRef.child('test').push().set({
                                'duration':'30 minutes', // random
                                'name':'${widget.testName}',
                                'question_id':"${item.id}",
                                'score':'0',//false answer
                                'user_id':UID
                              });
                      }
                    },
                    child: Container(
                      height: 40,
                      width: 70,
                      decoration: BoxDecoration(
                        borderRadius:
                        BorderRadius.all(Radius.circular(10)),
                        color:  Color(0xffB8686B),
                      ),
                      child: Center(
                          child: Text(
                            'False',
//                              ${item.id}
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          )),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (item.answer== 'TRUE') {
//                              answer.chanege1(true);
//                              myScore = answer.score;
                        setState(() {
                          exit -= 1;
                          myScore+=4;
                        });
                        print('right the  is ${item.answer}+$myScore in id ${item.id}');
                        _removeLastItem(index);
                        _myData.removeWhere((ite) => ite.id == '${item.id}');

                              DBRef.child('test').push().set({
                                'duration':'30 minutes', // random
                                'name':'${widget.testName}',
                                'question_id':"${item.id}",
                                'score':'4',
                                'user_id':UID
                              });

                      } else {
//                              answer.chanege1(false);
                        print('false !!!! the correct answer is ${item.answer} in id ${item.id}');
                        _removeLastItem(index);
                        _myData.removeWhere((ite) => ite.id == '${item.id}');
                        setState(() {
                          exit -= 1;
                        });
                              DBRef.child('test').push().set({
                                'duration':'30 minutes', // random
                                'name':'${widget.testName}',
                                'question_id':"${item.id}",
                                'score':'0', //false answer
                                'user_id':UID
                              });
                      }
                    },
                    child: Container(
                      height: 40,
                      width: 70,
                      decoration: BoxDecoration(
                        borderRadius:
                        BorderRadius.all(Radius.circular(10)),
                        color: Color(0xff9BE282) ,
                      ),
                      child: Center(
                          child: Text('True',
//                              ${item.id}
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600))),
                    ),
                  ),
                ],
              )
//                    )
//                ),
            ],
          ),
        ),
        scale: animation,
      ),
    );
  }

  void _removeLastItem(int id) {
//    var itemToRemove = _myData.removeAt(id); // myallData[0]
    AnimatedListRemovedItemBuilder builder = (context, animation) {
      return  AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          contentPadding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
          content: Container(
              width: 250.0,
              height: 100.0,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircularProgressIndicator(),
                    Text("Loading...",
                        style: TextStyle(
                            fontFamily: "OpenSans",
                            color:  Color(0xFF5B6978)
                        )
                    )
                  ]
              )
          )


      );
      //todo original
//      return _buildItem(id, itemToRemove, animation);
    };
    // todo you can hiden changes
    _listKey.currentState.removeItem(
      id,
      builder,
      duration: const Duration(milliseconds: 250),
    );


  }

  Widget showProcessingDialog (){

    return AlertDialog(
      backgroundColor: Colors.white.withOpacity(0.3),
      elevation: 0.0,
      content: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(70.0),
        ),
        height: 260.0,
        width: 300.0,
        child: Stack(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 400,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top:90.0,left: 20),
                child: Text('please click  "Done" or "finish button" to finish the Exam',style: TextStyle(fontSize: 20),),
              ),
            ),
            Container(
              width: double.infinity,
              height: 50,
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                color: Colors.grey[400] ,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
              ),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "The Exam  has finished",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: InkWell(
                onTap: () {
                  Decision();
                },
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color(0xff09D8D2),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Done",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
//ToDo:- or portrait mode
void _portraitModeOnly() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

void _showMyMessage(BuildContext context,String title ,String message, int id) {

  Dialog fancyDialog = Dialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.0),
    ),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
      ),
      height: 200.0,
      width: 300.0,
      child: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 300,
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top:90.0,left: 20),
              child: Text('$message',style: TextStyle(fontSize: 20),),
            ),
          ),
          Container(
            width: double.infinity,
            height: 50,
            alignment: Alignment.bottomCenter,
            decoration: BoxDecoration(
              color: Color(0xffEF9A9A),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                "$title ⚠",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),textAlign: TextAlign.center,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: InkWell(
              onTap: () {
                switch(id){
                  case 1:{
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return MainBottom(numOfPage: 1,);
                    }));
                  }
                  break;
                }
              },
              child: Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
//                  color: Colors.blue[300],
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Okay",
                    style: TextStyle(
                        color: Color(0xff09D8D2),
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
  showDialog(
      context: context, builder: (BuildContext context) => fancyDialog);
}