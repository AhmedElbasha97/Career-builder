import 'package:careerbuilder/Home_component/screens/home.dart';
import 'package:careerbuilder/challenge_and_cv/widgets/level_points.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class OldSkills extends StatefulWidget {
  OldSkills({ @required this.style, });
  final TextStyle style;

  @override
  _OldSkillsState createState() => _OldSkillsState();
}

class _OldSkillsState extends State<OldSkills> {
  // final style = TextStyle(color: Colors.black45);
  final List oldSkills = [];
  final List skilldata = [];
  final dbref = FirebaseDatabase.instance.reference().child('user_skills');
  final dbRef2 = FirebaseDatabase.instance.reference().child('skills');
  final Color activeLevel=Color(0xff8CDBD8);
  final Color inactiveLevel=Colors.grey;

  final _auth = FirebaseAuth.instance;
  final DBRef = FirebaseDatabase.instance.reference();
  FirebaseUser loggedInUser ;
  String UID;
  List skillId=[];


  fetchInpro() async {

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


    dbref.orderByChild('user_id').equalTo(UID).once().then((snapshot) {
      if (snapshot.value != null) {

        var respose = snapshot.value.values;
        for (int i = 0; i < respose.length; i++) {
          if (respose.elementAt(i)['status'] == 'old') {
            skillId = respose.elementAt(i)['skill_id'];

            skilldata.add(skillId);
            print('skillll id${skillId.length}');
            print('lllllllllllllllllll$skilldata');
            setState(() {

            });


            oldSkills.add(skillId);
            print("tdataaaaaaa${skilldata[i]}");
          }
        }
      }
      print('skilllll,mmnc$skillId');
      
    });
  }



  @override
  void initState() {
    super.initState();
    fetchInpro();
  }

  @override
  Widget build(BuildContext context) {
     int  skilllength=skillId.length;
             double equation=(skilllength*35).toDouble();
              double sizedboxHeight=50 + equation ;
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            //skills text
            Container(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                'OLD SKILLS',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),

            SizedBox(
              width: 10,
            ),
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Color(0xffA2E8E8),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Icon(
                FontAwesomeIcons.award,
                size: 35,
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
        SizedBox(
            height: sizedboxHeight,
            child: skillId.isNotEmpty
                ? ListView.builder(
                    itemCount: skillId.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
//                      var level=skilldata[index]['level'];
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              child: Text(
                                '${skillId[index]}',
                                style: widget.style,
                              ),
                            ),
                          ),

                        ],
                      );
                    })
                :Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 0),
                  child: Text(
                    "no old skills ",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16,color: Colors.grey),
                  ),
                ))),
      ],
    );
  }
}

