import 'package:careerbuilder/App_intro/onBoarding_kh/src/overboard.dart';
import 'package:careerbuilder/App_intro/onBoarding_kh/src/page_model.dart';
import 'package:flutter/material.dart';


import 'homeScreen.dart';

/// this class uses this library flutter_overboard
/// the link to it is https://pub.dev/packages/flutter_overboard#-installing-tab-

class IntroOverboardPage extends StatefulWidget {
  static const routeName = '/IntroOverboardPage';


  @override
  _IntroOverboardPageState createState() => _IntroOverboardPageState();
}

class _IntroOverboardPageState extends State<IntroOverboardPage>
    with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _globalKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    /// -----------------------------------------------
    /// Build main content with Scaffold widget.
    /// -----------------------------------------------
    return Scaffold(
      key: _globalKey,

      /// -----------------------------------------------
      /// Build Into with OverBoard widget.
      /// -----------------------------------------------
      body: OverBoard(
        pages: pages,
        showBullets: true,
        skipCallback: () {
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return  HomeScreen();
          }));
        },
        finishCallback: () {
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return  HomeScreen();
          }));
        },
      ),
    );
  }

  /// -----------------------------------------------
  /// making list of PageModel needed to pass in OverBoard constructor.
  /// -----------------------------------------------
  final pages = [
    new PageModel.withChild(
        color: const Color(0xFF536DFE),
        child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/images/onbord1.png'),fit: BoxFit.cover)
            ),

        ),
        doAnimateChild: false),
    new PageModel.withChild(
        color: const Color(0xFF536DFE),
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/images/onbord2.png'),fit: BoxFit.cover)
          ),
        ),
        doAnimateChild: false),
    new PageModel.withChild(
        color: const Color(0xFF536DFE),
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/images/onbord3.png'),fit: BoxFit.cover)
          ),
        ),
        doAnimateChild: false),
    new PageModel.withChild(
        color: const Color(0xFF536DFE),

        child: Container(

          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/images/onbord4.png'),fit: BoxFit.cover)
          ),
        ),

        doAnimateChild: false),

  ];

}