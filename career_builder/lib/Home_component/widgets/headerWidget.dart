import 'package:careerbuilder/Test_Component/Test_models/user_data.dart';
import 'package:careerbuilder/challenge_and_cv/widgets/menu_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class HeaderWidget extends StatefulWidget {
  @override
  _HeaderWidgetState createState() => _HeaderWidgetState();
}


class _HeaderWidgetState extends State<HeaderWidget> {



  List <User> allData = []; // list data in the array

  final _auth = FirebaseAuth.instance;
  final DBRef = FirebaseDatabase.instance.reference();
  FirebaseUser loggedInUser ;
  String UID;

//  List <UserSkillIndicTotal> _uSIT=[];
//  List arrayNum=[];
//  List <DailyChall>_DaillyList=[];
//  List <WeeklyChall>_WeeklyList=[];

  int scoreNull=0;
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



@override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();
  }



  @override
  Widget build(BuildContext context) {
    dynamic currentTime = DateFormat.jm().format(DateTime.now());
    DateTime now = DateTime.now();
    String formattedDate = DateFormat(' EEE d MMM').format(now);
    var fullDate= DateFormat.yMMMd().format(now);

    return Container(

      padding: EdgeInsets.symmetric(horizontal: 10),
      width: MediaQuery.of(context).size.width*0.94 ,
      height: MediaQuery.of(context).size.height ,
//      Image.asset("assets/images/mask4.png", fit: BoxFit.cover),
//      decoration: BoxDecoration(
//        color: Colors.lightBlue,
//        borderRadius: BorderRadius.only(
//          bottomLeft: Radius.circular(15),
//          bottomRight: Radius.circular(15),
//        ),
//
//        boxShadow: [
//          BoxShadow(
//            color: Color(0xFFF1f94aa).withOpacity(0.5),
//            blurRadius: 5
//          )
//        ]
//      ),
      child: Stack(

        children: <Widget>[
//          Positioned(
//              top: 30,
//              left: 300,
//              child: InkWell(
//                onTap:(){
//                 return Menu();
//                } ,
//                  child: Icon(Icons.menu, color: Colors.white,size: 30))),

         SizedBox(
              width: 300,
              height:160,
              child: allData.length==0?
                  Container()
                  :ListView.builder(
                  itemCount:1,
                  itemBuilder: (_,index){

                    return    profile(userName,userProfileImage);
                  }),
            ),

          Positioned(
              top: 140,
              left: 150,
              child: Text("$currentTime ",style: TextStyle(
                fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white70)
              )
          ),
          Positioned(
              top: 160,
              left: 140,
              child: Text("$fullDate",style: TextStyle(
                  fontWeight: FontWeight.w600,
                fontSize: 16,
                  color: Colors.white70)
              )
          ),

        ],
      ),
    );
  }

  Widget profile(String name , String img){

    return
        Container(
          height: 150,
          child: Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top:50.0),
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(img),

                      )
                  ),
                ),
              ),

              Positioned(
                top:70,
                left: 20,
                child: Padding(
                    padding: const EdgeInsets.only(top:0,left: 40),
                    child: Text("$name ", style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                    )),
                  ),
              ),


              Positioned(
                top:100,
                left: 30,
                child: Padding(
                    padding: const EdgeInsets.only(top:1.0,left: 60),
                    child: Text("your list of today", style: TextStyle(
                        fontSize: 14,
                        color: Colors.white70
                    )),
                  ),
              ),



            ],
          ),
        );




  }

}