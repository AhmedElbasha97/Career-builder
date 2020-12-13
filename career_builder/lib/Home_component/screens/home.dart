import 'dart:convert';
import 'package:careerbuilder/Test_Component/Test_models/skill_model.dart';
import 'package:careerbuilder/Test_Component/Test_models/user_data.dart';
import 'package:careerbuilder/challenge_and_cv/widgets/menu_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:careerbuilder/Home_component/animations/fadeAnimation.dart';
import 'package:careerbuilder/Home_component/screens/addNote.dart';
import 'package:careerbuilder/Home_component/widgets/headerWidget.dart';
import 'package:careerbuilder/Home_component/widgets/notesStore.dart';
import 'package:flutter/services.dart';

var skillId;
var skillName;
var skillLevel;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {



  Widget _myAnimatedWidget = Home();
  bool _valueOfCheckbox = false;


//  String noteDescription ;
//  String noteNotes;
//  int noteID ;
//

  final GlobalKey<AnimatedListState> _listKey = GlobalKey();
  List <User> allData = []; // list data in the array
  List <NotesStore> allNotesList =[];

  final _auth = FirebaseAuth.instance;
  final DBRef = FirebaseDatabase.instance.reference();
  FirebaseUser loggedInUser ;
  String UID;
  var idForRemove;
  var theLastOfNoteName;
  var theLastOfNoteID;

//  List <UserSkillIndicTotal> _uSIT=[];
//  List arrayNum=[];
//  List <DailyChall>_DaillyList=[];
//  List <WeeklyChall>_WeeklyList=[];
  String urlSkill = 'https://career-builder-54d16.firebaseio.com/skills.json';
  List <Skill> _skillList=[];

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

//      DBRef.child("user_skills").orderByChild('user_id').equalTo(UID).once().then((DataSnapshot snapshot) {
//        print('Data isssssssss : ${snapshot.value}');
//      });


    if (UID != null) {
      DBRef.child("notes").orderByChild('user_id').equalTo(UID).once().then((
          DataSnapshot snap) {
        var keys = snap.value.keys; //return unique keys
        var data = snap.value;
        for (var key in keys) {

          allNotesList.add(
              NotesStore(
                descriptions: data[key]['descriptions'],
                notes: data[key]['notes'],
                id: data[key]['id'],
                user_id: data[key]['user_id'],
              )

          );

        }

        setState(() {
          print('Length issssssssssssssss : ${allNotesList.length}');
        });

      });
      //todo -------------------------------------
    }
    else {
      print('no UID yet ${allNotesList.length}');

    }
  }

  Future <http.Response> getSkill(String theComeNote) async {
    try {
      var response = await http.get(urlSkill);
      if (response.statusCode == 200) {
        String responeBody = response.body;
        var jsonBody = jsonDecode(responeBody);
        for (var data in jsonBody) {
          if (data['name'] == theComeNote ) {

            theLastOfNoteID=data['id'];
//            _skillList.add(Skill(id: data['id'],level:data['level'],name: data['name'] ));
          }


        }
        print('the id el meeeeeeeee $theLastOfNoteID');
        DBRef.child("user_skills").orderByChild('user_id').equalTo(UID).once().then((DataSnapshot snap) {
          print(UID);
          var keys =snap.value.keys ; //return unique keys
          var data=snap.value;
          for(var key in keys){
            print('an zeheqt $key');
            if(data[key]['skill_id']=='$theLastOfNoteID'){
              print('deleteeeeeeeeeed $theLastOfNoteID');
              DBRef.child('user_skills').child(key).remove();

            }}

        });



      }
    }catch(e){

    }
  }


  @override
  void initState() {
    // TODO: implement initState


    super.initState();
    getCurrentUser();

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );
  }


  @override
  Widget build(BuildContext context) {

    final GlobalKey<ScaffoldState> _scaffoldKey =  GlobalKey<ScaffoldState>();

    return Scaffold(

        endDrawer: Drawer(
          child: Menu(),
        ),

      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/home.jpg"),
                        fit: BoxFit.contain,
                        alignment: Alignment.topCenter)
                ),
                child:Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[

                      Expanded(
                        child: Container(

                          child:
//                          Row(
//                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                            crossAxisAlignment: CrossAxisAlignment.start,
//                            children: <Widget>[
                              FadeAnimation(1.4, HeaderWidget()),
//                              SizedBox(height: 40),
//                            ],
//                          ),
                        ),
                      ),


                          Container(
                            padding:
                                EdgeInsets.symmetric(horizontal: 0, vertical: 25),
                            height: MediaQuery.of(context).size.height * 0.685,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    topRight: Radius.circular(30))),
                            child:  ListView(
                              children: <Widget>[
                                Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                          width: MediaQuery.of(context).size.width-90,
                                          height: 64.0,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(22.0),
                                            color: const Color(0x3fa0a0a0),
                                          ),
                                          child: Row(
                                            children: <Widget>[
                                              Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Text(
                                                  "Create new task",
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.w700,
                                                      fontSize: 20,
                                                      color: Color(0xffAABABA)),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(left: 40.0),
                                                child: FloatingActionButton(
                                                  backgroundColor: Color(0xff04C6BE),
                                                  child: Icon(
                                                    Icons.add,
                                                    color: Colors.white,
                                                  ),
                                                  onPressed: () {
                                                  Navigator.push(context, MaterialPageRoute(builder: (_){
                                                    return AddNote();
                                                  }));
                                                  },
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 30,
                                        ),


                                         SizedBox(
                                           height: 300,
                                           width: 600,
                                           child:
                                           allNotesList.length==0?
                                               Container(
                                                 child: Center(child: Text('No Notes 📝 ',style:TextStyle(fontSize: 30,color: Colors.grey) ,)),
                                                 color: Colors.white,):

                                           AnimatedList(

                                              key: _listKey,
                                              initialItemCount:allNotesList.length,
                                              itemBuilder: (context, index, animation){

                                                print('lolololo ');
                                                  return  NoteList(index,allNotesList[index],animation);


                                                },


                                            ),
                                         ),



//                                  Text("${allNotesList.length}"),


                                        //todo this is a check box !!



                                        //todo text for on boarding

//                     Transform.rotate(angle: - math.pi / 4, child:
//                      Text("create new task",style: TextStyle(
//                            color: Colors.black,
//                            fontSize: 20,
//                            letterSpacing: 1,
//                            fontWeight: FontWeight.bold
//
//
//                    ))),
//                        FadeAnimation(1.8,PopularBeaches()),
//                        SizedBox(height: 18),

//                       FadeAnimation(2,VideoWidget())
                                      ],
                                    ),
                              ],
                            ),
                          ),

                    ],
                  ),

              ),
          ),
        ),
      ),
    );

  }

  Widget NoteList (int index, var item, Animation<double> animation){

    return
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[

          Padding(
            padding: const EdgeInsets.all(20),
            child: ScaleTransition(
              child: Container(
//                height: 100,
                width: 240,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                        Radius.circular(40)),
                    color: Color(0xffBFE6F3)),
                child: ListTile(

                  leading:
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(item.notes,style: TextStyle(fontSize: 20),),
                        ),

                  subtitle: Padding(
                    padding: const EdgeInsets.only(left:0.0,right: 10.0,top: 30.0),
                    child: Text(item.descriptions,style: TextStyle(fontSize: 14),),
                  ),
                ),
              ),
              scale: animation,
            ),
          ),
          InkWell(
              onTap: ()async{
                await getSkill(item.notes);
             RemoveData(item.id,item.notes);
             _removeLastItem(index);
//            theLastOfNoteName=item.notes;

           setState(() {
             allNotesList.length-=1;
           });
print('new ${allNotesList.length}');
              },
              child: Icon(Icons.delete_outline,color: Color(0xffB1B1B1),size: 33,))
        ],
      );

  }

void RemoveData (var id,String materialName){

  DBRef.child("notes").orderByChild('user_id').equalTo(UID).once().then((DataSnapshot snap) {
    print(UID);
    var keys =snap.value.keys ; //return unique keys
    var data=snap.value;
    for(var key in keys){
      print('uuuuuuuuuuuuuuuuuuuuuuuuuuu$key');
      if(data[key]['id']==id){

        DBRef.child('notes').child(key).remove();
        print('updated');
      }}

  });

  /// delete it from user skills





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

}

//          Padding(
//            padding: const EdgeInsets.all(8.0),
//            child: InkWell(
//              onTap: () {
//                setState(() {
//                  _valueOfCheckbox = !_valueOfCheckbox;
//
//                });
//              },
//              child: Container(
//                decoration: BoxDecoration(
//                    shape: BoxShape.circle,
//                    color:_valueOfCheckbox==false?
//                    Colors.white:Colors.tealAccent),
//                child: Padding(
//                  padding: const EdgeInsets.all(10.0),
//                  child: _valueOfCheckbox
//                      ? Icon(
//                    Icons.check,
//                    size: 30.0,
//                    color: Colors.white,
//                  )
//                      : Icon(
//                    Icons.trip_origin,
//                    size: 33.0,
//                    color: Colors.grey,
//                  ),
//                ),
//              ),
//            ),
//          ),

