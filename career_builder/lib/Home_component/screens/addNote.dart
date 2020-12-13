import 'package:careerbuilder/Bottom_Navigation_Bars/MainBottom/main_bottom.dart';
import 'package:careerbuilder/Test_Component/Test_models/user_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:careerbuilder/Home_component/animations/fadeAnimation.dart';
import 'package:careerbuilder/Home_component/screens/home.dart';
import 'package:careerbuilder/Home_component/widgets/headerWidget.dart';


class AddNote extends StatefulWidget {
  @override
  _AddNoteState createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {


  List <User> allData = []; // list data in the array

  final _auth = FirebaseAuth.instance;
  final DBRef = FirebaseDatabase.instance.reference();
  FirebaseUser loggedInUser ;
  String UID;
  int maxIDS = 0;
  int maxIDSForSkills=0;
  int idFortheInSkill;

  String userProfileImage;
  String ImageAfterUp;
  String userName;

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
          DBRef.child('users').onValue.listen((event) {
            var snapshot = event.snapshot;

            ImageAfterUp = snapshot.value[key]['profile_picture'];
            print('Value is $ImageAfterUp');

          });
          allData.add(
              User(
                  email: data[key]['email'],
                  id: data[key]['id'],
                  password: data[key]['password'],
                  first_name: data[key]['first_name'],
                  last_name: data[key]['last_name'],
                  total_points: data[key]['total_points'],
                  profile_picture: data[key]['profile_picture'],
                  job: data[key]['job']
              )
          );


          userProfileImage = data[key]['profile_picture'];
          userName =data[key]['first_name'];

          print('Score waaaasssssssss $userProfileImage');
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

  getTheIds  () async {

    DBRef.child('notes').once().then((DataSnapshot snapshot){
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


  getTheSkillsIds  () async {

    DBRef.child('user_skills').once().then((DataSnapshot snapshot){
      Map<dynamic, dynamic> values = snapshot.value;
      values.forEach((key,values) {

        var id =  values["id"] ;
        print(id);
        if (id > maxIDSForSkills){
          maxIDSForSkills = id;
        }
      });
      maxIDSForSkills = maxIDSForSkills + 1;
    });
    print(maxIDSForSkills);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();
    getTheIds();
    getTheSkillsIds();
  }

  bool _valueOfCheckbox = false;
  String dropdownValue;
  String dropdownValue2;
  List<String> web=['html','css','bootstrap','javascript','jquery','php','xml'];
  List<String> mobile=['flutter','react_native','ruby','node.js','mysql','jquery'];//
  List<String> desktop=['c_plus','c_sharp','java','mysql','python'];
  List<String> networking=['bash','objective_','perl','ccna',];
  List<String> others=['cloud_comp','big_data','data_minin','datastruct','math'];
  List<String> emptyList=[];
  String selectedTrack;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child:  Column(
              children: <Widget>[
                Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/home.jpg"),
                            fit: BoxFit.contain,
                            alignment: Alignment.topCenter)),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(height: 20),
                          Flexible(
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child:
//                              Column(
////                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
////                                crossAxisAlignment: CrossAxisAlignment.start,
//                                children: <Widget>[
                                  FadeAnimation(1.4, HeaderWidget()),
//
//                                ],
//                              ),
                            ),
                          ),

                              Container(
                                padding:
                                EdgeInsets.symmetric(horizontal: 0, vertical: 25),
                                height: MediaQuery.of(context).size.height * 0.67,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    color: Color(0xffF1F1F1),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(30),
                                        topRight: Radius.circular(30))),
                                child: ListView(
                                    children: <Widget>[
                                  Column(

//                                  crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[

                                  FloatingActionButton(
                                      backgroundColor:Colors.white ,
                                      child: Icon(Icons.clear,color: Colors.black,),
                                      onPressed: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (_){
                                          return MainBottom(numOfPage: 2,);
                                        }));
                                      }
                                  ),

                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Center(child: Text('New Task',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: Colors.teal),)),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(18.0),
                                        child: Text('The journey of a thousand miles begins with a step',style:TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 20,
                                            color: Color(0xffAABABA)),),
                                      ),

                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(10),
                                                topRight: Radius.circular(10),
                                                bottomLeft: Radius.circular(10),
                                                bottomRight: Radius.circular(10)
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey.withOpacity(0.5),
                                                spreadRadius: 5,
                                                blurRadius: 7,
                                                offset: Offset(0, 3), // changes position of shadow
                                              ),
                                            ],
                                          ),
                                          child: DropdownButton<String>(
                                            hint: Text('select track'),
                                            value: selectedTrack,
                                            icon: Icon(Icons.arrow_downward),
                                            iconSize: 24,
                                            elevation: 16,
                                            style: TextStyle(color: Colors.teal,fontSize: 20),
                                            underline: Container(
                                              height: 1,
                                              width: 0.5,
                                              color: Colors.tealAccent,
                                            ),
                                            onChanged: (String newValue) {
                                              setState(() {
                                                selectedTrack = newValue;
                                                if(selectedTrack=='Mobile Development'){
                                                  emptyList=mobile;
                                                  dropdownValue2='flutter';
                                                }else if (selectedTrack=='Web Development'){
                                                  emptyList=web;
                                                  dropdownValue2='html';
                                                }else if (selectedTrack=='Desktop'){
                                                  emptyList=desktop;
                                                  dropdownValue2='java';

                                                }else if (selectedTrack=='Networking'){
                                                  emptyList=networking;
                                                  dropdownValue2='ccna';

                                                }else if (selectedTrack=='other languages'){
                                                  emptyList=others;
                                                  dropdownValue2='math';
                                                }
                                              });
                                            },
                                            items: <String>['Web Development', 'Mobile Development', 'Desktop' , 'Networking', 'other languages']
                                                .map<DropdownMenuItem<String>>((String value) {
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(value), //just display the name Web Development', 'Mobile Development
                                              );
                                            }).toList(),
                                          ),
                                        ),
                                      ),


                                      Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Color(0xffffffff),
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(10),
                                                topRight: Radius.circular(10),
                                                bottomLeft: Radius.circular(10),
                                                bottomRight: Radius.circular(10)
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey.withOpacity(0.5),
                                                spreadRadius: 5,
                                                blurRadius: 7,
                                                offset: Offset(0, 3), // changes position of shadow
                                              ),
                                            ],
                                          ),

                                          child: DropdownButton<String>(hint: Text('select language'),
                                            value: dropdownValue2, //will be default
                                            icon: Icon(Icons.arrow_downward),
                                            iconSize: 24,
                                            elevation: 16,
                                            style: TextStyle(color: Colors.teal,fontSize: 20),
                                            underline: Container(
                                              height: 1,
                                              width: 0.5,
                                              color: Colors.tealAccent,
                                            ),
                                            onChanged: (String newValue) {
                                              setState(() {
                                                dropdownValue2 = newValue;
                                              });
                                            },
                                            items:emptyList.map<DropdownMenuItem<String>>((String value) {
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(value),
                                              );
                                            }).toList(),
                                          ),
                                        ),
                                      ),

                                      Padding(
                                        padding: const EdgeInsets.only(top:20.0),
                                        child: FlatButton(

                                            child: new Text("Save",style: TextStyle(color: Colors.white),),

                                                color: Color(0xff04C6BE),
                                                shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),

                                               onPressed: (){
                                                print(dropdownValue2);
                                                writeData(UID);
                                                Navigator.push(context, MaterialPageRoute(builder: (_){
                                                  return MainBottom(numOfPage: 2,);
                                                }));

                                        }
                                        ),
                                      ),
//Text('data'),
//Text('data'),
//Text('data'),
//Text('data'),
//Text('data'),
//Text('data'),

                                    ],
                                  ),
                                ]),
                              ),
                        ],
                      ),

                  ),
              ],
            ),

          ),
        ),
      ),
    );

  }

  void writeData(String userid) {
    DBRef.child('notes').push().set({
      'descriptions':'$selectedTrack',
      'id':maxIDS,
      'notes':'$dropdownValue2',
      'user_id':userid ,

    });

    switch(dropdownValue2){
      case "flutter":idFortheInSkill=78; break;
      case "react_native":idFortheInSkill=79; break;
      case "mysql":idFortheInSkill=80; break;
      case "jquery":idFortheInSkill=81; break;
      case "node.js":idFortheInSkill=82; break;
      case "ruby":idFortheInSkill=83; break;
      case "html":idFortheInSkill=84; break;
      case "css":idFortheInSkill=85; break;
      case "bootstrap":idFortheInSkill=86; break;
      case "java":idFortheInSkill=87; break;
      case "php":idFortheInSkill=88; break;
      case "xml":idFortheInSkill=89; break;
      case "c_plus":idFortheInSkill=90; break;
      case "c_sharp":idFortheInSkill=91; break;
      case "javascript":idFortheInSkill=92; break;
      case "python":idFortheInSkill=93; break;
      case "bash":idFortheInSkill=94; break;
      case "ccna":idFortheInSkill=95; break;
      case "go_lang":idFortheInSkill=96; break;
      case "objective_":idFortheInSkill=97; break;
      case "perl":idFortheInSkill=98; break;
      case "big_data":idFortheInSkill=99; break;
      case "datastruct":idFortheInSkill=100; break;
      case "cloud_comp":idFortheInSkill=101; break;
      case "data_minin":idFortheInSkill=102; break;
      case "math":idFortheInSkill=103; break;

    }

  DBRef.child('user_skills').push().set({

      'id':maxIDSForSkills,
      'skill_id':"$idFortheInSkill",
      'status':'inprogress',
      'user_id':userid ,


    });


  }
}



