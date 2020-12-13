import 'package:careerbuilder/Home_component/screens/home.dart';
import 'package:careerbuilder/challenge_and_cv/screens/challengeScreen.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'package:careerbuilder/Profile_Component/Screens/profile_page.dart';
import 'package:careerbuilder/Test_Component/Screens/tests_page.dart';
import 'package:careerbuilder/Tracks/home/screens/dashScreen.dart';

const Color ActiveColor=Color(0xff000000);
const Color inActiveColor = Color(0xffffffff);


class MainBottom extends StatefulWidget {

  int scoreComing;
  int numOfPage;
  int giftPointComing;
  MainBottom({this.numOfPage,this.scoreComing,this.giftPointComing});

  @override
  _MainBottomState createState() => _MainBottomState();
}

class _MainBottomState extends State<MainBottom> {

  int _pageIndex =0 ;

  GlobalKey _bottomNavigationKey = GlobalKey();

  Widget _profile = Profile();
  Widget _testPage = TestMePage();
  Widget _tracks = DashScreen();
  Widget _challenge= ChallengeScreen();
  Widget _home=Home();

  Widget _showPage ;


  startTime() async {  // method to check the user is  first time or not
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seenTwo = (prefs.getBool('seenTwo') ?? false);
    if (_seenTwo) {// Not first time
      setState(() {
        _showPage=Home();
        // Home
        selected=inActiveColor;
        selected1=inActiveColor;
        selected2=ActiveColor;
        selected3=inActiveColor;
        selected4=inActiveColor;
        _pageIndex=2;
      });

    }  if(!_seenTwo) {// First time
      await prefs.setBool('seenTwo', true);
      setState(() {
        _showPage=DashScreen();
        // trackes;
        selected=ActiveColor;
        selected1=inActiveColor;
        selected2=inActiveColor;
        selected3=inActiveColor;
        selected4=inActiveColor;
        _pageIndex=0;
      });

    }
  }


  @override
  void initState() {
    super.initState();

    startTime();

    Timer(new Duration(milliseconds: 200), () {
      if(widget.numOfPage!=null){
        _pageSelected(widget.numOfPage);
      }



    });

  }


  Color selected; // the color of icon number 1
  Color selected1; // the color of icon number 2
  Color selected2; // the color of icon number 3
  Color selected3; // the color of icon number 4
  Color selected4; // the color of icon number 5


  Widget _pageSelected (int page){

    if(widget.numOfPage==null){
      switch (page){
        case 0 :{
          selected=ActiveColor;
          selected1=inActiveColor;
          selected2=inActiveColor;
          selected3=inActiveColor;
          selected4=inActiveColor;
          return _tracks;// tracks
        }break;
        case 1 : {
          selected=inActiveColor;
          selected1=ActiveColor;
          selected2=inActiveColor;
          selected3=inActiveColor;
          selected4=inActiveColor;
          return _testPage;// test me
        }break;
        case 2 : {
          selected=inActiveColor;
          selected1=inActiveColor;
          selected2=ActiveColor;
          selected3=inActiveColor;
          selected4=inActiveColor;

          return _home;// home
        }break;
        case 3 : {
          selected=inActiveColor;
          selected1=inActiveColor;
          selected2=inActiveColor;
          selected3=ActiveColor;
          selected4=inActiveColor;
          return _challenge;// challenge
        }  break;
        case 4 : {
          selected=inActiveColor;
          selected1=inActiveColor;
          selected2=inActiveColor;
          selected3=inActiveColor;
          selected4=ActiveColor;
          return _profile;// profile
        } break;
      }
    }else if(widget.numOfPage!=null){
      switch (widget.numOfPage){
        case 0 :{

          selected=ActiveColor;
          selected1=inActiveColor;
          selected2=inActiveColor;
          selected3=inActiveColor;
          selected4=inActiveColor;
          setState(() {
            _showPage=DashScreen();// tracks
            _pageIndex=0;
          });
          return _showPage;
        }break;
        case 1 : {
          selected=inActiveColor;
          selected1=ActiveColor;
          selected2=inActiveColor;
          selected3=inActiveColor;
          selected4=inActiveColor;
          setState(() {
            _showPage=TestMePage();// test me
            _pageIndex=1;
          });
          return _showPage;
        }break;
        case 2 : {
          selected=inActiveColor;
          selected1=inActiveColor;
          selected2=ActiveColor;
          selected3=inActiveColor;
          selected4=inActiveColor;
          setState(() {
            _showPage=Home(); // home
            _pageIndex=2;
          });
          return _showPage;
        }break;
        case 3 : {
          selected=inActiveColor;
          selected1=inActiveColor;
          selected2=inActiveColor;
          selected3=ActiveColor;
          selected4=inActiveColor;
          setState(() {
            _showPage=ChallengeScreen(); // challenge
            _pageIndex=3;
          });
          return _showPage;
        }  break;
        case 4 : {
          selected=inActiveColor;
          selected1=inActiveColor;
          selected2=inActiveColor;
          selected3=inActiveColor;
          selected4=ActiveColor;
          setState(() {
            _showPage=Profile(testScore: widget.scoreComing==null? null : widget.scoreComing,
              pointsFromGifts: widget.giftPointComing==null?null :widget.giftPointComing,
            );// profile
            _pageIndex=4;
          });
//          setState(() {
//            widget.ffPage=null;
//          });
          return _showPage;
        } break;
      }

    }



  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      bottomNavigationBar:

      CurvedNavigationBar(
        key: _bottomNavigationKey,
        index:_pageIndex,
        height: 60.0,
        items: <Widget>[
          Icon(Icons.import_contacts, size: 30,color:selected ,),

          Icon(Icons.assignment,size: 30,color:selected1 ),

          Icon(Icons.home, size: 30,color:selected2 ),

          Icon(Icons.flash_on, size: 30 ,color:selected3 ),

          Icon(Icons.perm_identity, size: 30 ,color:selected4 ),

        ],
        color: Color(0xff09D8D2),
        buttonBackgroundColor: Color(0xffFFFFFF).withOpacity(0.8),
        backgroundColor: Colors.white.withOpacity(0),
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 400),
        onTap: (tappedIndex) {
          setState(() {
            widget.numOfPage=tappedIndex;
            _showPage = _pageSelected(tappedIndex) ;
//              _pageIndex=tappedIndex;
          });

        },
      ),


      body:_showPage,
    );
  }}