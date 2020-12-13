import 'package:careerbuilder/Bottom_Navigation_Bars/MainBottom/main_bottom.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'package:careerbuilder/Profile_Component/Screens/profile_page.dart';
import 'package:careerbuilder/Test_Component/Screens/tests_page.dart';
import 'package:careerbuilder/Tracks/home/screens/dashScreen.dart';

const Color ActiveColor=Color(0xff000000);
const Color inActiveColor = Color(0xffffffff);

class bottomBarTwo extends StatefulWidget {


  @override
  _bottomBarTwoState createState() => _bottomBarTwoState();
}

class _bottomBarTwoState extends State<bottomBarTwo> {



  final _pageController = PageController();

  int _Page=0;

  int _pageIndex =0 ;

  GlobalKey _bottomNavigationKey = GlobalKey();

  Widget _profile = Profile();
  Widget _testPage = TestMePage();
  Widget _login = DashScreen();

  Widget _main=MainBottom();

  Widget _showPage ;

  List<Widget> _pages =[
    Profile(),
    TestMePage(),
    DashScreen(),
  ];


  Color selected; // the color of icon number 1
  Color selected1; // the color of icon number 2
  Color selected2; // the color of icon number 3
  Color selected3; // the color of icon number 4
  Color selected4; // the color of icon number 5

  Widget _pageSelected (int page){

    if(page==0){
      selected=inActiveColor;
      selected1=inActiveColor;
      selected2=inActiveColor;
      selected3=inActiveColor;
      selected4=inActiveColor;

    }
    else if(page==1){
      selected=inActiveColor;
      selected1=inActiveColor;
      selected2=inActiveColor;
      selected3=inActiveColor;
      selected4=inActiveColor;

    }
    else if(page==2){
      selected=inActiveColor;
      selected1=inActiveColor;
      selected2=inActiveColor;
      selected3=inActiveColor;
      selected4=inActiveColor;

    }
    else if(page==3){
      selected=inActiveColor;
      selected1=inActiveColor;
      selected2=inActiveColor;
      selected3=inActiveColor;
      selected4=inActiveColor;

    }
    else if(page==4){
      selected=inActiveColor;
      selected1=inActiveColor;
      selected2=inActiveColor;
      selected3=inActiveColor;
      selected4=inActiveColor;

    }

    switch (page){

      case 0 :{
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return MainBottom(numOfPage: 0,);
        }));
      }break;  // tracks
      case 1 :{  Navigator.push(context, MaterialPageRoute(builder: (context){
        return MainBottom(numOfPage: 1,);
      }));}break; // test me
      case 2 : {Navigator.push(context, MaterialPageRoute(builder: (context){
        return MainBottom(numOfPage:2,);
      }));} break;// home
      case 3 : {Navigator.push(context, MaterialPageRoute(builder: (context){
        return MainBottom(numOfPage: 3,);
      }));} break;// challenge
      case 4 : {Navigator.push(context, MaterialPageRoute(builder: (context){
        return MainBottom(numOfPage: 4,);
      }));}break; // profil
    }

  }

  @override
  Widget build(BuildContext context) {

//    return  ClipRRect(
//      borderRadius: BorderRadius.only(
//        topRight: Radius.circular(40),
//        topLeft: Radius.circular(40),
//      ),
//      child:
    return
      Theme(
          data: Theme.of(context).copyWith(
            // sets the background color of the `BottomNavigationBar`
            canvasColor:Color(0xff09D8D2),
            // sets the active color of the `BottomNavigationBar` if `Brightness` is light
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(40),
              topLeft: Radius.circular(40),
            ),
            child: BottomNavigationBar(

              items: [
                BottomNavigationBarItem(icon: Icon(Icons.import_contacts, size: 30,),title: Container(height: 4.0)),
                BottomNavigationBarItem(icon: Icon(Icons.assignment,size: 30,),title: Container(height: 15.0)),
                BottomNavigationBarItem(icon: Icon(Icons.home, size: 30,),title: Container(height: 15.0)),
                BottomNavigationBarItem(icon: Icon(Icons.flash_on, size: 30 ,),title: Container(height: 15.0)),
                BottomNavigationBarItem(icon: Icon(Icons.perm_identity, size: 30 ,),title: Container(height: 15.0))],
              unselectedItemColor: inActiveColor,
              selectedItemColor: inActiveColor,

              onTap: (tappedIndex) {
                setState(() {
                  _showPage = _pageSelected(tappedIndex);
//              _pageIndex=tappedIndex;
                });
              },
            ),
//         ),
          )
      );


  }
}

