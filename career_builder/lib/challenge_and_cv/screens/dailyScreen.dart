
import 'package:careerbuilder/challenge_and_cv/models/random_number.dart';
import 'package:careerbuilder/challenge_and_cv/screens/DailyList.dart';
import 'package:careerbuilder/challenge_and_cv/screens/congrate.dart';
import 'package:careerbuilder/challenge_and_cv/widgets/menu_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:careerbuilder/challenge_and_cv/widgets/question_text.dart';
import 'package:careerbuilder/challenge_and_cv/widgets/answer_button.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:intl/intl.dart';
import 'waiting_screen.dart';
import 'package:provider/provider.dart';
import 'package:careerbuilder/challenge_and_cv/widgets/result.dart';
class DailyScreen extends StatefulWidget {
  final String languageName;
  final String langLevel;
  final String skillId;
  
  DailyScreen(this.languageName, this.langLevel, this.skillId);

  @override
  _DailyScreenState createState() => _DailyScreenState(this.languageName);
}

class _DailyScreenState extends State<DailyScreen> {
  _DailyScreenState(this.languageName);


  //firebase instances
  final userDbRef = FirebaseDatabase.instance.reference().child('users');
  final dbRef = FirebaseDatabase.instance.reference().child('challenge');
  final questionsDbRef =FirebaseDatabase.instance.reference().child('questions');
  final challengeDbRef =FirebaseDatabase.instance.reference().child('challenge');
  
  //models instance
  RandomNumber random;

  //list & map & set
  List<Map<bool, Color>> colorsList = [];
  List questions = [];
  List challengeData = [];
  List challengeIds = [];
  List qUserAnswer1 = [];
  List qUserAnswer2 = [];
  List list = [];
  List qIdes = [];
  Map<int, String> questionIdsShown = {};
  var questionData = <Map>[];
  Set<int> answeredIds = Set();
   List answersFromFireBade = [];
  

  //variables
  Color fButtonColor = Color(0xffB8686B);
  Color tButtonColor = Color(0xff9BE282);
  Color activeColor = Colors.blue;
  final String languageName;
  bool show = false;
  var questionId;
  var questiontext;
  var questionAnswer;
  var questionScore;
  var totalscore;
  var qtext;
  var future;
  var future2;

  final _auth = FirebaseAuth.instance;
  final DBRef = FirebaseDatabase.instance.reference();
  FirebaseUser loggedInUser ;
  String UID;

Future<bool> _onBackPressed(){
     Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return ChallengesList(); // DailyList.dart
                    },
                  ));
}
  
  fetchUser() async {
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
      userDbRef.orderByChild('id').equalTo(UID).once().then((snapshot) {
        var userResponse = snapshot.value;
        var keys = snapshot.value.keys; //return unique keys
        var data = snapshot.value;
        for (var key in keys) {
          print('userResponse1 $userResponse');
          if (data != null) {
            totalscore = data[key]['total_points'];

            // convertedDailyScoreFromFire=int.parse(dailyScoreFromFire);
            setState(() {});
            print('daily  is  >>>>>>>>>> $totalscore');
          }
        }
      });

      future2 = challengeDbRef.orderByChild('user_id').equalTo(UID).once();
      future =
          questionsDbRef.orderByChild('period').equalTo('daily_challenge').once();

    }
    else {
          print('no UID yet ${totalscore}');

    }


  }
  void _showDialog(int result, int whichCorrect) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        Widget content;
        if (result == 1) {
          content = Center(child: Column(children: <Widget>[
                Text(' Your answer is',
                style: TextStyle(
                    color: Color(0xff09D8D2),
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 5,
                ),
                whichCorrect == 1? Column(
                        children: <Widget>[
                          Result(
                            questionnum: 'Question 1',
                          icon: Icons.check,
                          iconColor: Colors.green,
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Result(
                            questionnum: 'Question 2',
                          icon: Icons.close,
                          iconColor: Colors.red,
                          ),
                        ],
                      )
                    : Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Result(
                            questionnum: 'Question 1',
                          icon: Icons.close,
                          iconColor: Colors.red,
                          ),
                            SizedBox(
                              height: 3,
                            ),
                            Result(
                            questionnum: 'Question 2',
                          icon: Icons.check,
                          iconColor: Colors.green,
                          ),
                          ],
                        ),
                      )
              ],
            ),
          );
        } else if (result == 2) {
          content = Center(
            child: Column(
              children: <Widget>[
                Text(
                  'You got it ',
                  style: TextStyle(
                    color: Color(0xff09D8D2),
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 5,
                ),
               Result(
                            questionnum: 'Question 1',
                          icon: Icons.check,
                          iconColor: Colors.green,
                          ),
                SizedBox(
                  height: 3,
                ),
                Result(
                            questionnum: 'Question 2',
                          icon: Icons.check,
                          iconColor: Colors.green,
                          ),
              ],
            ),
          );
        } else {
          content = Center(
            child: Column(
              children: <Widget>[
                Text(
                  ' your answer is',
                  style: TextStyle(
                    color: Color(0xff09D8D2),
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 5,
                ),
                Result(
                            questionnum: 'Question 1',
                          icon: Icons.close,
                          iconColor: Colors.red,
                          ),
                SizedBox(
                  height: 3,
                ),
                Result(
                            questionnum: 'Question 2',
                          icon: Icons.close,
                          iconColor: Colors.red,
                          ),
              ],
            ),
          );
        }
        // return object of type Dialog
        return WillPopScope(onWillPop: _onBackPressed,
                  child: AlertDialog(
            backgroundColor: Color(0xffE0F2F2),
            title: Text(
              "Challenge result",
              style: TextStyle(color: Colors.black54),
              textAlign: TextAlign.center,
            ),
            titlePadding: EdgeInsets.all(20),
            // contentPadding: EdgeInsets.all(30),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            content: SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width * 0.4,
              child: Center(child: content),
            ),
            actions: <Widget>[
              // usually buttons at the bottom of the dialog
              FlatButton(
                  child: Text(
                    "ok",
                    style: TextStyle(fontSize: 20, color: Color(0xff09D8D2)),
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return ChallengesList();
                      },
                    ));
                  })
            ],
          ),
        );
      },
    );
  }

  void initState() {
    super.initState();
    fetchUser();

  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (random == null) {
      print('random constractor called');
      random = Provider.of<RandomNumber>(context, listen: false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daily challenge'),
        centerTitle: true,
        backgroundColor: Color(0xff09D8D2),
      ),
      endDrawer: Menu(),
      body: WillPopScope(
        onWillPop: _onBackPressed,
              child: FutureBuilder(
          future: future2,
          builder: (context, AsyncSnapshot<DataSnapshot> challSnapshot) {


            // challenge has data  check the time if pass 24h
            if (challSnapshot.hasData) {
              // handeled
              if (challSnapshot.data.value != null) {
                var challengeResponse = challSnapshot.data.value.values;

                print('challenge response$challengeResponse');
                for (var i = 0; i < challengeResponse.length; i++) {
                  if (challengeResponse.elementAt(i)['type'] == 'daily') {
                    if (challengeResponse.elementAt(i)['skill_id'] ==
                        widget.skillId) {
                      print(widget.skillId);
                      challengeData.add({
                        'question_id':
                            '${challengeResponse.elementAt(i)['question_id']}',
                        'time_stamp':
                            '${challengeResponse.elementAt(i)['time_stamp']}',
                        'skill_Id':
                            '${challengeResponse.elementAt(i)['skill_id']}',
                      });
                      challengeIds
                          .add(challengeResponse.elementAt(i)['question_id']);
                    }
                  } else {
                    print('no skill id found in challenge');
                    print('skill id from widget${widget.skillId}');
                  }
                  print('skill id from widget${widget.skillId}');
                  print('challenge ids $challengeIds');
                }

                for (Map map in challengeData) {
                  list.add(map['time_stamp']);
                }
                list.sort();
                print('time list $list');
              }

              Future.delayed(Duration(milliseconds: 100), () {
                random.reduceMaxNumber(challengeIds);
              });

              print('after reduce in challenge');

              print('challenge Ids $challengeIds');
              if (list.isNotEmpty) {
                var time = int.parse(list.last);
                print(time);

                DateTime challengeTime =
                    DateTime.fromMillisecondsSinceEpoch(time);
                DateTime timeNow = DateTime.fromMillisecondsSinceEpoch(
                    DateTime.now().millisecondsSinceEpoch);
                var difference = timeNow.difference(challengeTime).inHours;
                print(challengeTime);
                int differenceInt = int.parse(difference.toString());
                int remining = 24 - difference;
                print(differenceInt);
                if (differenceInt < 24) {
                  if (differenceInt == 1) {
                    return Waiting(remining, 'hour');
                  } else {
                    return Waiting(remining, 'hours');
                  }
                }
              }

              return FutureBuilder(
                future: future,
                builder: (context, AsyncSnapshot<DataSnapshot> questionSnapshot) {
                  var lang = languageName;
                  if (languageName == 'go lang') {
                    lang = 'go_lang';
                  } else if (languageName == 'c++') {
                    lang = 'c_plus';
                  }
                  // data from fire
                  if (questionSnapshot.hasData) {
                    var response = questionSnapshot.data.value.values;
                    for (int i = 0; i < response.length; i++) {
                      var langname = response.elementAt(i)['test_name'];
                      var langlevel = response.elementAt(i)['level'];

                      if (langname == lang) {
                        print(response.elementAt(i)['test_name']);
                        if (langlevel == widget.langLevel) {
                          if (challengeData.isNotEmpty) {
                            //exclude and fetch
                            if (challengeIds
                                .contains(response.elementAt(i)['id'])) {
                              continue;
                            } else {
                              questions.add(response.elementAt(i));
                            }
                          } else {
                            // fetch questions
                            questions.add(response.elementAt(i));
                          }
                        }
                      } //first if
                    } //for
                    if (questions.isEmpty) {
                      print(widget.skillId);
                      return Congrate();
                    }
                    return Padding(
                      padding: EdgeInsets.only(bottom: 70),
                      child: ListView.builder(
                          itemCount: 2,
                          itemBuilder: (BuildContext context, index) {
                            int randomNum = random.randomNumber;
                            if (index == 1) {
                              randomNum == questions.length - 1
                                  ? randomNum -= 1
                                  : randomNum += 1;
                            }
                            print('the random number$randomNum');
                            if (questions.isNotEmpty) {
                              questionId = questions[randomNum]['id'];
                              questiontext = questions[randomNum]['question'];
                              questionAnswer = questions[randomNum]['answer'];
                              questionScore = questions[randomNum]['score'];
                              qIdes.insert(index, questions[randomNum]['id']);
                              answersFromFireBade.add(questionAnswer);
                              print(
                                  '$questionId ${questiontext} anser ${questionAnswer}');
                            } else {
                              print('you finish');
                            }
                            if (colorsList.length < 2) {
                              colorsList.add({true: Colors.white, false: Colors.white});
                            }
                            return Padding(
                              padding: const EdgeInsets.all(15),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Color(0xffE0F2F2),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30))),
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Container(
                                            padding: EdgeInsets.only(top: 10),
                                            margin: EdgeInsets.all(10),
                                            child: Text(
                                              'Question ${index +1}',
                                              style: TextStyle(
                                                color: Color(0xff44919B),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 25,
                                              ),
                                            )),

                                        //Container 10 points
                                        Container(
                                          alignment: Alignment.center,
                                          padding: EdgeInsets.all(5),
                                          height: 50,
                                          width: 50,
                                          decoration: BoxDecoration(
                                              color: Color(0xff09D8D2),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(30))),
                                          child: Column(
                                            children: <Widget>[
                                              Text(
                                                questionScore,
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              Text('points',
                                                  style: TextStyle(
                                                      color: Colors.white)),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      child: questionText(questiontext),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    //buttons
                                    Container(
                                      margin:
                                          EdgeInsets.only(top: 20, bottom: 20),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          //false button
                                          answerButton(
                                              buttonColor: colorsList[index] [false],
                                              buttonText: 'False ',
                                              buttonOnpressed: () {
                                                print('answers $answersFromFireBade');
                                                   if(index==0){
                                                     //true
                                                      if(answersFromFireBade.elementAt(0)=='FALSE'){
                                                         print('questionAnswer  index 0 ${answersFromFireBade.elementAt(0)}');
                                                           if (qUserAnswer1.isNotEmpty) {
                                                               qUserAnswer1.clear();
                                                                }
                                                                qUserAnswer1.insert(0, true);// anser 1[true]
                                                                  print('qAnswer1  $qUserAnswer1');
                                                                 }
                                                                 //not true
                                                                 else{
                                                                   print('questionAnswer  index 0 ${answersFromFireBade.elementAt(0)}');
                                                                    qUserAnswer1.clear();
                                                                    print('qAnswer1  $qUserAnswer1'); //anser 1[]
                                                                    print('answer 1$qUserAnswer1');
                                                                    print('answer 2$qUserAnswer2');
                                                                    print('plz try again');
                                                                 }
                                                                  }

                                                      if(index==1){
                                                        //true
                                                          if(answersFromFireBade.elementAt(1)=='FALSE'){
                                                             print('questionAnswer  index 1 ${answersFromFireBade.elementAt(1)}');
                                                             if (qUserAnswer2.isNotEmpty) {
                                                               qUserAnswer2.clear();
                                                                }
                                                            qUserAnswer2.insert(0, true);
                                                            print(
                                                            'qAnswer2  $qUserAnswer2');// asnwer2[true]
                                                          }
                                                          //false
                                                          else{
                                                            print('questionAnswer  index 1 ${answersFromFireBade.elementAt(1)}');
                                                                    qUserAnswer2.clear();
                                                                    print('qAnswer1  $qUserAnswer2'); //anser 2[]
                                                                    print('answer 1$qUserAnswer1');
                                                                   print('answer 2$qUserAnswer2');
                                                                  print('plz try again');
                                                          }
                                                      }
                                                setState(() {
                                                  if (colorsList[index][true] ==
                                                      tButtonColor) {
                                                    colorsList[index][true] =
                                                        Colors.white;
                                                  }
                                                  colorsList[index][false] =
                                                      fButtonColor;
                                                  answeredIds.add(index);
                                                  if (questionIdsShown.length >=
                                                      2) {
                                                    show = true;
                                                  }
                                                });
                                              }),
                                          SizedBox(
                                            width: 30,
                                          ),
                                          answerButton(
                                              buttonColor: colorsList[index]
                                                  [true],
                                              buttonText: 'True',
                                              buttonOnpressed: () {
                                                print('answers $answersFromFireBade');
                                                if(index==0){
                                                     //true
                                                      if(answersFromFireBade.elementAt(0)=='TRUE'){
                                                         print('questionAnswer  index 0 ${answersFromFireBade.elementAt(0)}');
                                                           if (qUserAnswer1.isNotEmpty) {
                                                               qUserAnswer1.clear();
                                                                }
                                                                qUserAnswer1.insert(0, true);// anser 1[true]
                                                                  print('qAnswer1  $qUserAnswer1');
                                                                 }
                                                                 //not true
                                                                 else{
                                                                   print('questionAnswer  index 0 ${answersFromFireBade.elementAt(0)}');
                                                                    qUserAnswer1.clear();
                                                                    print('qAnswer1  $qUserAnswer1'); //anser 1[]
                                                                    print('answer 1$qUserAnswer1');
                                                                    print('answer 2$qUserAnswer2');
                                                                    print('plz try again');
                                                                 }
                                                                  }

                                                      if(index==1){
                                                        //true
                                                          if(answersFromFireBade.elementAt(1)=='TRUE'){
                                                             print('questionAnswer  index 1 ${answersFromFireBade.elementAt(1)}');
                                                             if (qUserAnswer2.isNotEmpty) {
                                                               qUserAnswer2.clear();
                                                                }
                                                            qUserAnswer2.insert(0, true);
                                                            print(
                                                            'qAnswer2  $qUserAnswer2');// asnwer2[true]
                                                          }
                                                          //false
                                                          else{
                                                            print('questionAnswer  index 1 ${answersFromFireBade.elementAt(1)}');
                                                                    qUserAnswer2.clear();
                                                                    print('qAnswer1  $qUserAnswer2'); //anser 2[]
                                                                    print('answer 1$qUserAnswer1');
                                                                   print('answer 2$qUserAnswer2');
                                                                  print('plz try again');
                                                          }
                                                      }
                                                setState(() {
                                                  if (colorsList[index][false] ==
                                                      fButtonColor) {
                                                    colorsList[index][false] =
                                                        Colors.white;
                                                  }
                                                  colorsList[index][true] =
                                                      tButtonColor;
                                                  answeredIds.add(index);
                                                  if (questionIdsShown.length >= 2) {
                                                    show = true;
                                                  }
                                                  print(answeredIds);
                                                });
                                              }),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                    );
                  } else {
                    return Center(
                        child: CircularProgressIndicator(
                      valueColor:
                          AlwaysStoppedAnimation<Color>(Color(0xff09D8D2)),
                      backgroundColor: Colors.white,
                    ));
                  }
                },
              );
            } else {
              return Center(
                        child: CircularProgressIndicator(
                      valueColor:
                          AlwaysStoppedAnimation<Color>(Color(0xff09D8D2)),
                      backgroundColor: Colors.white,
                    ));
              // return Center(
              //   child: Text(
              //     'Check your internet connection please.',
              //     style: TextStyle(color: Colors.black45),
              //   ),
              // );
            }
          },
        ),
      ),
      floatingActionButton: answeredIds.length == 2
          ? FloatingActionButton.extended(
              onPressed: () {
                int convertedQScore = int.parse(questionScore);
                int result;
                int whichIsCorrect;
                //[1data][]
                if (qUserAnswer1.isNotEmpty && qUserAnswer2.isEmpty) {
                  //[true]
                  if (qUserAnswer1[0] == true) {
                    whichIsCorrect = 1;
                    result = 1;
                    print(totalscore);
                    totalscore += convertedQScore;
                    //update total score
                    userDbRef.child(UID).update({'total_points': totalscore});
                  }
                }
                //[2data][]
                if (qUserAnswer2.isNotEmpty && qUserAnswer1.isEmpty) {
                  //[true]
                  if (qUserAnswer2[0] == true) {
                    whichIsCorrect = 2;
                    result = 1;
                    totalscore += convertedQScore;
                    //update total score
                    userDbRef.child(UID).update({'total_points': totalscore});
                  }
                }
                //[data][data]
                if (qUserAnswer1.isNotEmpty && qUserAnswer2.isNotEmpty) {
                  //[true][true]
                  if (qUserAnswer1[0] == true && qUserAnswer2[0] == true) {
                    result = 2;
                    var dailyscore = convertedQScore * 2;
                    totalscore += dailyscore;
                    //update total score
                    userDbRef.child(UID).update({'total_points': totalscore});
                  }
                }

                // send question 1 answer
                if (qUserAnswer1.isNotEmpty) {
                  // send to fire
                  dbRef.push().set({
                    //TODO: fix ids and edit user id
                    'id': '2',
                    'question_id': '${qIdes[0]}',
                    'score': '$questionScore',
                    'user_id': UID,
                    //fixed values
                    'skill_id': '${widget.skillId}',
                    'type': 'daily',
                    'time_stamp':
                        '${DateTime.now().toUtc().millisecondsSinceEpoch}',
                  });
                } else {
                  dbRef.push().set({
                    //TODO: fix ids and edit user id
                    'id': '3',
                    'question_id': '${qIdes[0]}',
                    'score': '',
                    'user_id': UID,
                    //fixed values
                    'skill_id': '${widget.skillId}',
                    'type': 'daily',
                    'time_stamp':
                        '${DateTime.now().toUtc().millisecondsSinceEpoch}',
                  });
                }
                // send question 2 answer
                if (qUserAnswer2.isNotEmpty) {
                  // send to fire
                  dbRef.push().set({
                    //TODO: fix ids and edit user id
                    'id': '4',
                    'question_id': '${qIdes[1]}',
                    'score': '$questionScore',
                    'user_id': UID,
                    //fixed values
                    'skill_id': '${widget.skillId}',
                    'type': 'daily',
                    'time_stamp':
                        '${DateTime.now().toUtc().millisecondsSinceEpoch}',
                  });
                  print('sent sccussfully');
                } else {
                  dbRef.push().set({
                    //TODO: fix ids and edit user id
                    'id': '5',
                    'question_id': '${qIdes[1]}',
                    'score': '',
                    'user_id': UID,
                    //fixed values
                    'skill_id': '${widget.skillId}',
                    'type': 'daily',
                    'time_stamp':
                        '${DateTime.now().toUtc().millisecondsSinceEpoch}',
                  });
                }

                _showDialog(result, whichIsCorrect);
              },
              label: Text('Submit'),
              icon: Icon(Icons.thumb_up),
              backgroundColor: Color(0xff09D8D2),
            )
          : Container(),
    );
  }
}

