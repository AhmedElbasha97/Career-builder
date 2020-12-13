import 'dart:async';
import 'dart:io';
import 'dart:ui';
import 'package:careerbuilder/Bottom_Navigation_Bars/MainBottom/main_bottom.dart';
import 'package:careerbuilder/Profile_Component/FutureWidget/achievementContainer.dart';
import 'package:careerbuilder/Profile_Component/FutureWidget/inprogressStatus.dart';
import 'package:careerbuilder/Profile_Component/Screens/edit_profile.dart';
import 'package:careerbuilder/Test_Component/Test_models/challengeArrayModels.dart';
import 'package:careerbuilder/Test_Component/Test_models/user_data.dart';
import 'package:careerbuilder/Test_Component/Test_models/user_skill_indic_total.dart';
import 'package:careerbuilder/challenge_and_cv/screens/CvScreen.dart';
import 'package:careerbuilder/challenge_and_cv/widgets/menu_bar.dart';
import 'package:careerbuilder/gifts/listOfGifts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/services.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:careerbuilder/Test_Component/sql_database/dbmanager.dart';


const String weeklyImage =
    'https://cdn11.bigcommerce.com/s-1fg6qbr3wq/images/stencil/1280x1280/products/171/974/BD_EnglishLetters_HighRes_v2_67__21118.1497798604.jpg?c=2&imbypass=on';
const String dailyImage =
    'https://cdn.dribbble.com/users/2900626/screenshots/10701498/media/cf17b8bf99cdb7c89d66dcfbeec89c2e.jpg';

const String tImage='https://www.jo1sat.com/images/default.png';


class Profile extends StatefulWidget {
  //todo 1 : create variable to store variable come from cong or from test direct
  // todo 2: add this variable to score in data base
 int pointsFromGifts;
 final int testScore;

Profile({this.pointsFromGifts,this.testScore});

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final DbStudentManager dbManager = DbStudentManager();

  double DchallengePrecentage=0;
  double WchallengePrecentage=0;
  List<Logos> loglist;  //the list of profile logo
  List<InPro> listTwo;  // the list of in progress logo
  File _imageFile;
  bool _uploaded=false;
  bool _downloaded=false;
  String _downloadUrl;
  bool _refreshState=false;
  bool dataHasNotDisplayed=true ;

  List <User> allData = []; // list data in the array

  final _auth = FirebaseAuth.instance;
  final DBRef = FirebaseDatabase.instance.reference();
  FirebaseUser loggedInUser ;
  String UID;


  int scoreNull=0;
  int scoreFromFirebase;
  String ImageAfterUp;

  /// amany part
  final dbref=FirebaseDatabase.instance.reference().child('user_skills');
  final dbref2=FirebaseDatabase.instance.reference().child('challenge');
  List skillIds=[];// my limit
  List skillIdsDailyTimeStamps=[];
  List skillIdsWeeklyTimeStamps=[];
  Set dailyChallengesDone=Set(); // اقسمه على ال d
  Set weeklyChallengesDone=Set(); // اقسمه على ال d

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
                  job: data[key]['job'],

              )
          );


          scoreFromFirebase = data[key]['total_points'];
          print('Score waaaasssssssss ${data[key]['old_skills']}');
        }
        setState(() {
          print('Length : ${allData.length}');
        });

        updateScoreAfterTest();
        updateGiftPoints();
        fetchFromUserSkills();
      });
      //todo -------------------------------------
    }
    else {
      print('no UID yet ${allData.length}');

    }
  }

  Future getImage (bool isCamera,BuildContext context)async {
    File image ; //file is from dart:io package
    if(isCamera){
      image=await ImagePicker.pickImage(source: ImageSource.camera);
    }else{
      image=await ImagePicker.pickImage(source: ImageSource.gallery);
    }
    setState(() {
      _imageFile=image;  //store image in state variable called _imageFile
    });
    uploadImage(context);
  }

  Future uploadImage(BuildContext context)async{
    String fileName = basename(_imageFile.path);
    StorageReference _reference=FirebaseStorage.instance.ref().child(fileName);
    StorageUploadTask uploadTask=_reference.putFile(_imageFile);
    StorageTaskSnapshot taskSnapshot =await uploadTask.onComplete;

    setState(() {
      _uploaded=true;
    });
    downloadImage(context);
  }

  Future downloadImage(BuildContext context)async{
    String fileName = basename(_imageFile.path);
    StorageReference _reference=FirebaseStorage.instance.ref().child(fileName);
    String downloadAddress=await _reference.getDownloadURL();
    setState(() {
      _downloadUrl=downloadAddress;
    });
    setState(() {
      _downloaded=true;
      print('_dowo is : ${_downloaded}');
    });
    UpdateData(context);
  }
  void UpdateData(BuildContext context) {
    DBRef.child('users').child(UID).update({
      'profile_picture':_downloadUrl
    });
    if (dataHasNotDisplayed==true) {
      const oneSecond = const Duration(seconds: 1);
      new Timer.periodic(oneSecond, (Timer t) {
        setState(() {});
        t.cancel();
      });

    }

  }

  updateGiftPoints(){
if(UID!=null){
  if(widget.pointsFromGifts != null && scoreFromFirebase!=null){
    setState(() {
      scoreFromFirebase-=widget.pointsFromGifts;
    });
    DBRef.child('users').child(UID).update({
      'total_points': scoreFromFirebase
    });
    widget.pointsFromGifts=0;
  }

  else if(widget.pointsFromGifts == null ||scoreFromFirebase==null){
    print('nothing happened');
  }
  }
  }

  updateScoreAfterTest(){
    if (widget.testScore == null || scoreFromFirebase == null) {
      print('Score is nothing ');
    }
    else if (widget.testScore != null && scoreFromFirebase != null) {

      setState(() {
        scoreFromFirebase += widget.testScore+10;
        print('Score is Editing $scoreFromFirebase');
      });
      DBRef.child('users').child(UID).update({
        'total_points': scoreFromFirebase
      });
    }

  }



 calcDailyChallenge(){

    if(dailyChallengesDone.length>0){

    if(dailyChallengesDone.length.toDouble()/skillIds.length >1){
      setState(() {
        DchallengePrecentage=1;
      });

      print('this daily $DchallengePrecentage is 100%');

    }
    else if (dailyChallengesDone.length.toDouble()/skillIds.length <=1){
      setState(() {
        DchallengePrecentage= dailyChallengesDone.length.toDouble()/skillIds.length ;
      });

      print('this daily $DchallengePrecentage  is noooooooooooooot 100%');

    }
    }
    else if(dailyChallengesDone.length==0){
      setState(() {
        DchallengePrecentage=0;
      });
    }
}

 calcWeeklyChallenge(){

    if(weeklyChallengesDone.length>0){

    if(weeklyChallengesDone.length.toDouble()/skillIds.length >1){
      setState(() {
        WchallengePrecentage=1;
      });
      print('this weekly $WchallengePrecentage is 100%');

    }else if(weeklyChallengesDone.length.toDouble()/skillIds.length <=1 ){
      setState(() {
        WchallengePrecentage= weeklyChallengesDone.length.toDouble()/skillIds.length ;
      });
      print('this weekly $WchallengePrecentage is noooooooooooooot 100%');
      }
    }
    else if (weeklyChallengesDone.length==0){
      setState(() {
        WchallengePrecentage=0;
      });
    }

}

  fetchFromUserSkills()async{
    dbref.orderByChild('user_id').equalTo(UID).once().then((userSnapshot){
      if(userSnapshot.value!=null){
        var userResponse=userSnapshot.value.values;
        for (var i = 0; i < userResponse.length; i++) {
          if(userResponse.elementAt(i)['status']=='new'||userResponse.elementAt(i)['status']=='old'){
            skillIds.add(userResponse.elementAt(i)['skill_id']);
            fetchDailyFromChallenge(userResponse.elementAt(i)['skill_id']);
            fetchWeeklyFromChallenge(userResponse.elementAt(i)['skill_id']);
          }
        }
        print('skill ids list $skillIds');
      }
      //  print('${userSnapshot.value.values}');
    });
  }
  fetchDailyFromChallenge(var skillId){
    dbref2.orderByChild('skill_id').equalTo('$skillId').once().then((challengeSnapshot){
      //  print(challengeSnapshot.value.values);
      if(challengeSnapshot.value!=null){
        var challengeResponse=challengeSnapshot.value.values;
        for (var i = 0; i < challengeResponse.length; i++) {
          if(challengeResponse.elementAt(i)['type']=='daily'){
            skillIdsDailyTimeStamps.add({
              'skill_id': challengeResponse.elementAt(i)['skill_id'],
              'timeStamp': challengeResponse.elementAt(i)['time_stamp'],
            });
          }
        }
        print('skill time $skillIdsDailyTimeStamps');

        for (var i = 0; i < skillIdsDailyTimeStamps.length; i++) {
          if(skillIds.contains(skillIdsDailyTimeStamps[i]['skill_id'])){
            var timeStamp=int.parse(skillIdsDailyTimeStamps[i]['timeStamp']);
            DateTime challengeTime=DateTime.fromMillisecondsSinceEpoch(timeStamp);
            DateTime timeNow=DateTime.fromMillisecondsSinceEpoch(DateTime.now().millisecondsSinceEpoch);
            var difference= timeNow.difference(challengeTime).inSeconds;
            print(challengeTime);
            print(difference);

            if(difference < 86400){
              dailyChallengesDone.add(difference);
            }
          }
        }
        print('done daily $dailyChallengesDone');
        calcDailyChallenge();
      }
    });
  }
  fetchWeeklyFromChallenge(var skillId){
    dbref2.orderByChild('skill_id').equalTo('$skillId').once().then((challengeSnapshot){
      //  print(challengeSnapshot.value.values);
      if(challengeSnapshot.value!=null){
        var challengeResponse=challengeSnapshot.value.values;
        for (var i = 0; i < challengeResponse.length; i++) {
          if(challengeResponse.elementAt(i)['type']=='weekly'){
            skillIdsWeeklyTimeStamps.add({
              'skill_id': challengeResponse.elementAt(i)['skill_id'],
              'timeStamp': challengeResponse.elementAt(i)['time_stamp'],
            });
          }
        }
        print('skill time $skillIdsWeeklyTimeStamps');

        for (var i = 0; i < skillIdsWeeklyTimeStamps.length; i++) {
          if(skillIds.contains(skillIdsWeeklyTimeStamps[i]['skill_id'])){
            var timeStamp=int.parse(skillIdsWeeklyTimeStamps[i]['timeStamp']);
            DateTime challengeTime=DateTime.fromMillisecondsSinceEpoch(timeStamp);
            DateTime timeNow=DateTime.fromMillisecondsSinceEpoch(DateTime.now().millisecondsSinceEpoch);
            var difference= timeNow.difference(challengeTime).inSeconds;
            print(challengeTime);
            print(difference);

            if(difference < 604800){
             weeklyChallengesDone.add(difference);
            }
          }
        }
        print('done week $weeklyChallengesDone');
        calcWeeklyChallenge();
      }
    });
  }


  @override
  void initState() {
    super.initState();
    getCurrentUser();
//    fetchFromUserSkills();
//    updateGiftPoints();

  }

  @override
  Widget build(BuildContext context) {
    _portraitModeOnly();
    double width = MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;

    final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();

    return Scaffold(
        endDrawer: Drawer(
          child: Menu(),
        ),

        backgroundColor:Color(0xffD5FFFD),
        body: SafeArea(
          child: Container(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  RefreshIndicator(
                    key: _refreshIndicatorKey,
                    onRefresh: _refresh,
                    child: ClipPath(
                      // the header of profile
                      clipper: HeaderClipper(),
                      child: Container(
                        width: double.infinity,
                        height: height/3.0,
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: Color(0xff09D8D2),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.teal.withOpacity(0.5),
                                blurRadius: 10.0,
                                // has the effect of softening the shadow
                                spreadRadius: 5.0,
                                // has the effect of extending the shadow
                                offset: Offset(0, 7),
                              )
                            ]),
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                                width: 350,
                                top: -60,
                                left: -110,
                                child: SizedBox(
                                    height:300,
                                    width: 300,
                                    child: allData.length==0? Container() :
                                    ListView.builder(
                                        itemCount:1,
                                        itemBuilder: (_,index){

                                          return widgetImageProfile(_downloaded==false?allData[index].profile_picture:ImageAfterUp);
                                        })

                                )
                            ),
                            Positioned(
                                top: 100,
                                left: 140,
                                child:
                                SizedBox(
                                    height: 500,
                                    width: 500,
                                    child: allData.length==0?Container():
                                    ListView.builder(
                                        itemCount:1,
                                        itemBuilder: (_,index){
                                          return widgetName(allData[index].first_name,allData[index].last_name);
                                        })
                                )
                            ),
                            Positioned(
                                top: 124,
                                left: 150,
                                child:  SizedBox(
                                    height: 500,//500
                                    width: 500,//500
                                    child: allData.length==0?

                                    Text(
                                      "No data",
                                      style: TextStyle(color: Colors.white),
                                    )
                                        :
                                    ListView.builder(
                                        itemCount:1,
                                        itemBuilder: (_,index){

                                          return widgetJob(allData[index].job);


                                        })
                                )
                            ),
                            Positioned(
                                top: 150,
                                left: 160,
                                child: Container(
                                    height: 30,
                                    width: 130,
                                    decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.3),
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                    child:  SizedBox(
                                        height: 50,
                                        width: 300,
                                        child: allData.length==0? Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            Image.asset('assets/Test_Result/achiev.png'),
                                            Center(
                                              child: Text(
                                                '0',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16),
                                              ),
                                            )
                                          ],
                                        )
                                            :
                                        // todo if no data show the score = 0 ;

                                        ListView.builder(
                                            itemCount:1,
                                            itemBuilder: (_,index){
                                              return widgetScore(scoreFromFirebase);
                                            })
                                    )
                                )
                            ),
                            Positioned(
                                top: 30,
                                left: 250,
                                child:

                                FlatButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(18.0),
                                        side: BorderSide(color: Colors.tealAccent)
                                    ),
//                             color: Colors.amber,
                                    onPressed: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context){
                                        return EditProfile();
                                      }));
                                    },
                                    child:Text('Edit profile',style: TextStyle(
                                        color: Colors.white, fontSize: 15,fontWeight: FontWeight.w500)))
                            ),
                            Positioned(
                              left: 90,
                              top: 130,
                              child:
//                           IconButton(icon: Icon(Icons.camera_alt), onPressed: (){})
                              GestureDetector(
                                onTap: () {
                                  getImage(false,context);//todo make it false
                                },
                                child: Container(
                                  // make refresh is true
                                  margin: EdgeInsets.all(5),
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      color: Color(0xff56C7AF),
                                      borderRadius: BorderRadius.circular(
                                          100),
                                      border: Border.all(
                                          width: 2,
                                          color: Colors.tealAccent)),
                                  child: Icon(
                                    Icons.camera_alt,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  //TODO : ------------------ END OF THE HEADER ---------------------

                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                      width: width,
                      child: Column(
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              topRight: Radius.circular(10.0),
                            ),
                            child: Container(
                                height: height,
                                width: width,
                                color: Colors.white,
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      //----------------------------------states--------------------------------------

                                      // in progress widget
                                      InProgressStatus(),

                                      Status(
                                        nameOfstatus: 'Daily Task',
                                        percentage:DchallengePrecentage,
                                        image: 'assets/profile/dailyImage.jpg',
                                      ),
                                      Status(
                                        nameOfstatus: 'Weekly Task',
                                        percentage:WchallengePrecentage ,
                                        image: 'assets/profile/weeklyImage.jpg',
                                      ),
                                      //-------------------------------------Achievements----------------------------------
                                      Padding(
                                        padding: EdgeInsets.all(8),
                                      ),
                                      ListTile(
                                        leading: CircleAvatar(
                                          maxRadius: 20,
                                          backgroundImage: AssetImage('assets/Test_Result/atchive2.png'),
                                          //TODO : make the AssetImage as property
                                        ),
                                        title: Text(
                                          'Achievements',
                                          style: TextStyle(
                                              color: Colors.lightBlue,
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Divider(
                                        color: Color(0xff09D8D2).withOpacity(0.6),
                                        height: 10,
                                        thickness: 3.5,
                                        endIndent: 20,
                                        indent: 20,
                                      ),

                                      // achievement widget
                                     AchievementContainer(),
                                      Padding(padding: EdgeInsets.all(30)),

                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: GestureDetector(
                                              onTap: () {
                                                Navigator.push(context, MaterialPageRoute(builder: (_){
                                                  return CvScreen();
                                                }));


                                              },
                                              child: Container(
                                                height: 40,
                                                width: 160,
                                                decoration: BoxDecoration(
                                                    color: Color(0xffDDE7FE),
                                                    borderRadius: BorderRadius.all(
                                                        Radius.circular(20)),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Color(0xff97ABDC),
                                                        blurRadius: 10.0,
                                                        // has the effect of softening the shadow
                                                        spreadRadius: 0.0,
                                                        // has the effect of extending the shadow
                                                        offset: Offset(
                                                          5.0,
                                                          // horizontal, move right 10
                                                          2.0, // vertical, move down 10
                                                        ),
                                                      )
                                                    ]),
                                                child: Center(
                                                  child: Text(
                                                    'Show My C.V',
                                                    style: TextStyle(
                                                        color: Color(0xff97ABDC),
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),

                                          Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: GestureDetector(
                                              onTap: () {

                                               Navigator.push(context, MaterialPageRoute(builder: (context){
                                                 return ListOfGifts(userId:UID,points: scoreFromFirebase,);
                                               }));

                                              },
                                              child: Container(
                                                height: 40,
                                                width: 160,
                                                decoration: BoxDecoration(
                                                    color: Color(0xffDDE7FE),
                                                    borderRadius: BorderRadius.all(
                                                        Radius.circular(20)),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Color(0xff97ABDC),
                                                        blurRadius: 10.0,
                                                        // has the effect of softening the shadow
                                                        spreadRadius: 0.0,
                                                        // has the effect of extending the shadow
                                                        offset: Offset(
                                                          5.0,
                                                          // horizontal, move right 10
                                                          2.0, // vertical, move down 10
                                                        ),
                                                      )
                                                    ]),
                                                child: Center(
                                                  child: Text(
                                                    'See your gifts',
                                                    style: TextStyle(
                                                        color: Color(0xff97ABDC),
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
//                                    SizedBox(height: 10,),
//                                    CircleAvatar(child: Image.network("https://i.ibb.co/KhnW2c6/94637809-160560105431476-1640346081625636864-o.jpg")),
//                                      Text('data')
                                    ])
                            ),
                          )
                          //TODO : -------------END OF THE CONTAINER (status + achievements)----------
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        )
    );
  }

  Widget widgetImageProfile ( String profImage ){

    // todo listview.builder
    return  Padding(
      padding: const EdgeInsets.only(left:8.0,top: 120),
      child: Container(
          width: 140,
          height:140 ,
          child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  decoration:BoxDecoration(
                    boxShadow: [
                      BoxShadow(
//                          offset: Offset(2, 2),
                          blurRadius: 10,
                          spreadRadius: 9.0,
                          color: Colors.teal.withOpacity(
                              0.6))
                    ],
                    borderRadius:
                    BorderRadius.all(Radius.circular(75)),
                  ),
                  child: ClipOval(
                    child:
                    Image.network(
                      profImage,
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),

                  ),
                ),
              ]
          )
      ),
    );
  }

  Widget widgetName(String fname,String lname){

    return Text('$fname $lname',
        style: TextStyle(
            color: Colors.white, fontSize: 20,fontWeight: FontWeight.w500)
    );

  }
  Widget widgetJob(String jopName){
    return
      Text(
        "$jopName",
        style: TextStyle(color: Colors.white),
      );
  }

  Widget widgetScore (int score){

    return Container(
      height: 30,
      width: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,

        children: <Widget>[
          Container(child: Image.asset('assets/Test_Result/achiev.png',)),
             Center(
               child: Text(
                ' $score',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16),
            ),
             ),
        ],
      ),
    );
  }

  Widget NoImage(){
    return        Padding(
      padding: const EdgeInsets.only(left:8.0,top: 80),
      child: Container(
          width: 140,
          height:140 ,
          child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  decoration:BoxDecoration(
                    boxShadow: [
                      BoxShadow(
//                          offset: Offset(2, 2),
                          blurRadius: 10,
                          spreadRadius: 9.0,
                          color: Colors.teal.withOpacity(
                              0.6))
                    ],
                    borderRadius:
                    BorderRadius.all(Radius.circular(75)),
                  ),
                  child: ClipOval(
                    child:
                    Image.network(
                      tImage,
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),

                  ),
                ),
              ]
          )
      ),
    );
  }

  Future<Null> _refresh()async{
    await new Future.delayed(new Duration(seconds: 3));
    if (dataHasNotDisplayed==true) {
      const oneSecond = const Duration(milliseconds: 1);
      new Timer.periodic(oneSecond, (Timer t) {
        setState(() {});
        t.cancel();
      });

    }
    return null;
  }
}



class Status extends StatelessWidget {
  final String nameOfstatus;
  final double percentage;
  final String image;

  const Status({Key key, this.nameOfstatus, this.percentage, this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(
          nameOfstatus,
          style: TextStyle(
            color: Colors.lightBlue,
            fontSize: 20,
          ),
        ),
        subtitle: LinearPercentIndicator(
          width: MediaQuery.of(context).size.width - 150,
          animation: true,
          lineHeight: 20.0,
          animationDuration: 2000,
          percent: percentage,
          //todo =>  percentage / 100
          center: Text("${(percentage* 100).toStringAsFixed(0) }%"),
          linearStrokeCap: LinearStrokeCap.roundAll,
          progressColor: Colors.blueAccent[100],
        ),
        leading:
            CircleAvatar(maxRadius: 30, backgroundImage: AssetImage(image)),
      ),
    );
  }
}



// TODO :   Clip method :-

class HeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var endPoint = Offset(size.height, size.height);
    var controlPoint = Offset(50, size.height + 140);

    final path = Path();

//    path.lineTo(0,size.height-200);
//    path.quadraticBezierTo(controlPoint.dx-200, controlPoint.dy+210, endPoint.dx+500, endPoint.dy-470);
//    path.lineTo(size.width, size.height);
//    path.lineTo(size.width, 0);
    path.lineTo(8, size.height - 40);
    path.quadraticBezierTo(0, size.height + 50, 590, size.height - 100);
    path.lineTo(size.width, size.height - 200);
    path.lineTo(size.width, 0);
    return path;

    //  path.lineTo(5,size.height-30);
    //    path.quadraticBezierTo(0, size.height+80, 550, size.height-200);
    //    path.lineTo(size.width, size.height-290);
    //    path.lineTo(size.width, 0);
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