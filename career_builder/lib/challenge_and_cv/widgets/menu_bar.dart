import 'package:careerbuilder/App_intro/homeScreen.dart';
import 'package:careerbuilder/Bottom_Navigation_Bars/MainBottom/main_bottom.dart';
import 'package:careerbuilder/Profile_Component/Screens/edit_profile.dart';
import 'package:careerbuilder/Test_Component/Test_models/user_data.dart';
import 'package:careerbuilder/Tracks/home/screens/dashScreen.dart';
import 'package:careerbuilder/challenge_and_cv/screens/challengeScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {

  final dbRef = FirebaseDatabase.instance.reference().child('users');
  List <User> allData = []; // list data in the array

  final _auth = FirebaseAuth.instance;
  final DBRef = FirebaseDatabase.instance.reference();
  FirebaseUser loggedInUser ;
  String UID;
  var fname;
  var email;
  var img;

  var totalscore;


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

    dbRef.orderByChild('id').equalTo(UID).once().then(( snapshot){
      var keys = snapshot.value.keys; //return unique keys
      var data = snapshot.value;
      var userResponse = snapshot.value;
      for (var key in keys) {
        if(userResponse!=null){
          var dailyScoreFromFire= data[key]['total_points'] ;
          var firebaseImage=data[key]['profile_picture'];
          var firbaseFname=data[key]['first_name'];
          var firbaseEmail=data[key]['email'];

          fname=firbaseFname;
          email=firbaseEmail;
          img=firebaseImage;
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
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      decoration: BoxDecoration(
//            borderRadius: BorderRadius. only(
//              bottomLeft: Radius.circular(80)),
        color: Color(0xff222931),
      ),

      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xff09D8D2),
//                  borderRadius: BorderRadius. only(bottomLeft: Radius.circular(50)),
//                  image: DecorationImage(
//                  image: AssetImage('assets/pro.png'),
//                  fit: BoxFit.cover,
//                ),
            ),
            accountName: Text('${fname ??'loading..'}',style: TextStyle(fontSize: 25),),
            accountEmail: Text('${email ??'loading..'}',style: TextStyle(fontSize: 18),),
            currentAccountPicture:ClipOval(
                  child: Image.network(img ??'https://via.placeholder.com/150',
                    width: 300,
                    height: 200,
                    fit: BoxFit.cover,
                    ),
                    ),
          ),
//            DrawerHeader(
//              decoration: BoxDecoration(
//                image: DecorationImage(
//                  image: AssetImage('assets/pro.png'),
//                  fit: BoxFit.cover,
//                ),
//              ),
//
//            ),
          Divider(),
          //profile
          ListTile(
            title: Center(
              child: Container(
                margin: EdgeInsets.only(left: 10,right: 10,bottom: 5,top: 50),
//                  color: Colors.amber,
                height: 50,
                width: 200,
                child: Row(
                  children: <Widget>[
                    Icon(Icons.account_circle,color: Colors.white),
                    SizedBox(width: 20,),
                    Text('Profile',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white)),
                  ],
                ),
              ),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context){
                    return MainBottom(numOfPage: 4,);
                  },));
            },
          ),
          //tracks
          ListTile(
            title: Center(
              child: Container(
                margin: EdgeInsets.only(left: 10,right: 10,bottom: 5,top: 10),
//                  color: Colors.amber,
                height: 50,
                width: 200,
                child: Row(
                  children: <Widget>[
                    Icon(Icons.directions,color: Colors.white,),
                    SizedBox(width: 20,),
                    Text('My Tracks',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white)),
                  ],
                ),
              ),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context){
                    return MainBottom(numOfPage: 0,);
                  },));
            },
          ),


          //setting
          ListTile(
            title: Center(
              child: Container(
                margin: EdgeInsets.only(left: 10,right: 10,bottom: 40,top: 10),
//                  color: Colors.amber,
                height: 50,
                width: 200,
                child: Row(
                  children: <Widget>[
                    Icon(Icons.settings,color: Colors.white),
                    SizedBox(width: 20,),
                    Text('Setting',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white)),
                  ],
                ),
              ),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context){
                    return EditProfile();
                  },));
            },
          ),
          //logoutButton
          Divider(color: Colors.black26,indent: 30,endIndent: 30,),
          Container(

              margin: EdgeInsets.only(left: 50,right: 50,top: 10),
              child:RaisedButton(
                color: Color(0xff09D8D2),
                shape: RoundedRectangleBorder
                  (borderRadius:BorderRadius.all
                  (Radius.circular(30.0))),
                child: Text('LogOut',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),
                ),
                onPressed: ()async{
                  SharedPreferences prefs = await SharedPreferences.getInstance();
                  prefs.remove('logged');
                  Navigator.push(context, MaterialPageRoute(builder: (_){
                    return HomeScreen();
                  }));
                },
              )
          )
        ],
      ),
    );
  }
}