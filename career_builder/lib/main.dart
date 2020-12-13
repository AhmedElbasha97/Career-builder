import 'package:careerbuilder/App_intro/fastDecision.dart';
import 'package:careerbuilder/App_intro/homeScreen.dart';
import 'package:careerbuilder/App_intro/signupscreen.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:careerbuilder/Tracks/home/screens/dashScreen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Bottom_Navigation_Bars/MainBottom/main_bottom.dart';
import 'Home_component/screens/home.dart';
import 'challenge_and_cv/models/random_number.dart';


var logged;

Future<void> main()async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
   logged = prefs.getString('logged');
  print(logged);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [

        ChangeNotifierProvider(create: (context) => RandomNumber()),
      ],
      child: MaterialApp(
        title: 'other',
        debugShowCheckedModeBanner:false,
//        theme: ThemeData(primarySwatch: Colors.deepPurple),
        home:SplashScreen(), // here if null go to on boarding  else go to Home();
        //todo    logged ==null? HomeScreen():MainBottom(numOfPage: 2,),   => in splash screen
//SplashScreen(),
      ),
    );
  }
}


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 8), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => logged ==null? FastDecision():MainBottom(),
          ));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlareActor("assets/logoanmi.flr", alignment:Alignment.center, fit:BoxFit.cover, animation:"logoanmi"),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Home Page"),
      ),
    );
  }
}
//      HomeScreen(),
//    );
//  }
//}