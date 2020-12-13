
import 'package:careerbuilder/challenge_and_cv/widgets/new_skills.dart';
import 'package:careerbuilder/challenge_and_cv/widgets/old_skills.dart';
import 'package:careerbuilder/challenge_and_cv/widgets/inpro.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:careerbuilder/challenge_and_cv/widgets/achieve_section.dart';


class CvScreen extends StatefulWidget {
  @override
  _CvScreenState createState() => _CvScreenState();
}

class _CvScreenState extends State<CvScreen> {
final  style= TextStyle(color: Colors.black54,fontSize: 16);
 final userDbRef = FirebaseDatabase.instance.reference().child('users');
  List userData=[];
final _auth = FirebaseAuth.instance;
final DBRef = FirebaseDatabase.instance.reference();
FirebaseUser loggedInUser ;
String UID;

var fname;
var email;
var img;
var gender;
var age;
var lname;
var job;
var phone;
var education;
bool datacome=false;

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
        var firebaseImage=data[key]['profile_picture'];
        var firbaseFname=data[key]['first_name'];
        var firbaseLname=data[key]['last_name'];
        var firbaseEmail=data[key]['email'];
        var firbasegender=data[key]['gender'];
        var firbasePhone=data[key]['phone'];
        var firbaseEducation=data[key]['eduvation'];
        var firbaseAge=data[key]['age'];
        var firbasejob=data[key]['job'];




        fname=firbaseFname;
        email=firbaseEmail;
        img=firebaseImage;
         gender=firbasegender;
         age=firbaseAge;
         lname=firbaseLname;
         job=firbasejob;
         phone=firbasePhone;
         education=firbaseEducation;
//        userData.add('1');
        setState(() {
          datacome=true;
        });

        // convertedDailyScoreFromFire=int.parse(dailyScoreFromFire);
        setState(() {});
        print('daily ');
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
    double sliverAppBarHeight=MediaQuery.of(context).size.height * 0.35;
    return Scaffold(
      body: datacome==true ? CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: sliverAppBarHeight,
            floating: true,
            pinned: true,
            snap: true,
            backgroundColor: Color(0xffD5FFFD),
            flexibleSpace: FlexibleSpaceBar(
              background: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        // Circle shape
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 2.0,
                          color: Color(0xff64BFB8),
                        ),
                      ),
                      child: CircleAvatar(
                        radius: 80,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 77,
                          backgroundColor: Colors.amber,
                          backgroundImage: NetworkImage('$img'),
                        ),
                      ),
                    ),
                    //header info
                     Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        datacome==true ?Padding(
                          padding: const EdgeInsets.all(4),
                          child: Container(
                            width: MediaQuery.of(context).size.width*0.40,
                            child: Text(
                              '$fname $lname',
                              style: TextStyle(
                                  fontSize: 18, 
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black54),
                                  textAlign: TextAlign.center,
                            ),
                          ),
                        ):Center(child: CircularProgressIndicator(
                          valueColor:  AlwaysStoppedAnimation<Color>(Color(0xff09D8D2)),
                          backgroundColor: Colors.white,
                        )),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '$job',
                            style: style,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: <Widget>[
                              Text(
                                '$gender',
                                style: style,
                              ),
                              SizedBox(width: 2),
                              Text('|',
                                  style: TextStyle(color: Color(0xff64BFB8))),
                              SizedBox(width: 2),
                              Text(
                                '$age',
                                style: style,
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      //contact  section
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
                              FontAwesomeIcons.addressBook,
                              size: 35,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          //achieve text
                          Container(
                            padding: EdgeInsets.only(top: 20),
//                          margin: EdgeInsets.only(top: 20),
                            child: Text(
                              'CONTACT',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(top: 20),
//                          margin: EdgeInsets.only(top: 20),
                            child: Text(
                              'EDUCATION',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          //skills icon
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Color(0xffA2E8E8),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Icon(
                              FontAwesomeIcons.university,
                              size: 35,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),

                  //vertical line
                  Container(
                      margin: EdgeInsets.only(top: 3),
                      width: MediaQuery.of(context).size.width - 40,
                      height: 2,
                      color: Color(0xff8CDBD8)),
                 
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Flexible(
                        flex: 2,
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              //contact info
                              Row(
                                
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Icon(Icons.email),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 16,bottom: 8),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width*0.35,
                                      child: Text('$email',style: style,)),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Icon(Icons.phone),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text('$phone',style: style,),
                                  ),
                                ],
                              ),


                             SizedBox(height: 30,),


                            // achievements
                            AchieveSection(),
                            SizedBox(height: 30,),
                            //inprogress section
                            Inprog(style: style)
                            ],
                          ),
                        ),
                      ),
                      //horizental line
                      Container(
                          width: 2, height:
                      MediaQuery.of(context).size.height, color: Color(0xff8CDBD8)),
                        // education old & new skills
                      Flexible(
                        flex: 2,
                        child: Container(
                          child: Column(
                            children: <Widget>[
                              //education section
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(top: 16,left: 16),
                                    child: Container(width: MediaQuery.of(context).size.width*0.38,
                                      child: Text('$education',
                                      style: style),
                                    ),
                                  ),
                                ],
                              ),
                             SizedBox(height:30),
                             //OLD SKILLS
                            OldSkills(style: style),
                            SizedBox(height: 30,),
                           //NEW SKILLS
                           NewSkills(style: style),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  
                ],
              ),
            )
          ]))
        ],
      ):Center(child: CircularProgressIndicator(
                          valueColor:  AlwaysStoppedAnimation<Color>(Color(0xff09D8D2)),
                          backgroundColor: Colors.white,
                        )),
    );
  }
}

