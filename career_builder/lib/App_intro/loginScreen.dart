import 'package:careerbuilder/Bottom_Navigation_Bars/MainBottom/main_bottom.dart';
import 'package:careerbuilder/Home_component/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:careerbuilder/Home_component/components/customTextFormfield.dart';
import 'package:careerbuilder/App_intro/signupscreen.dart';
//import 'home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

//class _LoginScreenState extends State<LoginScreen> {
//  @override
//  Widget build(BuildContext context) {
class _LoginScreenState extends State<LoginScreen> {
  String _email, _password;
  String error = '';

  bool check;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    ClipPath(
                      clipper: RoundedClipper(),
                      child: Container(
                        width: double.infinity,
                        height: 300.0,
                        //   color: Colors.orange,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/images/kik33.png"),
                                fit: BoxFit.cover,
                                alignment: Alignment.topCenter)),
                      ),
                    ),
                    Positioned(
                        height: 500,
                        left: 175, //todo to change the positioned of the button
                        child: FloatingActionButton(
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.clear,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            })),
                  ],
                ),
                // Text('start codindg from here'),
                Form(
                  key: _formKey,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
//                  height: MediaQuery.of(context).size.height ,
//                  width: MediaQuery.of(context).size.width ,

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
//                    crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Welcome",
                            style: TextStyle(
                                color: Colors.blueGrey, fontSize: 20)),
                        SizedBox(height: 20),
//                      ListView(
//                        children: <Widget>[
                        CustomTextFormField(
                          // ignore: missing_return
                          validator: (input) {
                            if (input.isEmpty) {
                              return 'Please enter email';
                            }
                          },
                          onSaved: (innpuutt) {
                            _email = innpuutt;
                          },
                          label: "Email",
                        ),
                        SizedBox(height: 10),

                        CustomTextFormField(
                          // ignore: missing_return
                          validator: (input) {
                            if (input.length < 6) {
                              return 'your password is very short !!!';
                            }
                          },
                          onSaved: (innpuutt) {
                            _password = innpuutt;
                          },
                          label: "Password",
                          isPassword: true,
                          icon: Icon(
                            Icons.https,
                            size: 27,
                            color: Color(0xFFF032f41),
                          ),
                        ),
                        SizedBox(height: 10),
                        Center(
                          child: Container(
                            height: 50,
                            width: 220,
                            child: RaisedButton(
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 20.0),
                                ),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0)),
                                color: Color.fromRGBO(57, 225, 237, 1),
                                onPressed: () {
                                  signIn(context);
                                }),
                          ),
                        ),
                        SizedBox(height: 20),

                        Center(
                          child: InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (_){
                                return Signupscreen();
                              }));
                            },
                            child: Text(
                              'Dont Have Account?',
                              style: TextStyle(
                                fontFamily: 'SFProDisplay-Light',
                                fontSize: 18,
                                color: const Color(0xff000000),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

//
  Future<void> signIn(BuildContext context) async {
    final formState = _formKey.currentState;
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      try {
        AuthResult result = await _auth.signInWithEmailAndPassword(
            email: _email, password: _password);
//        FirebaseUser user = result.user;
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('logged', 'true');
        //todo go to login page

//        Navigator.pop(context);
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
          return MainBottom();
        }));
      } catch (e) {
        print("e.message");
        _showMeTheError(e.message);
      }
    }
  }

  void _showMeTheError(String message) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: Color(0xff06D6D0),
      content: Text(message,style: TextStyle(fontSize: 20),),
    ));
  }

}




//    }
class RoundedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 100);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 100);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}




// try {
//                    setState(() {
//                      wrongEmail = false;
//                      wrongPassword = false;
//                    });
//                    final newUser = await _auth.signInWithEmailAndPassword(
//                        email: email, password: password);
//                    if (newUser != null) {
//                      Navigator.pushNamed(context, Done.id);
//                    }
//                  } catch (e) {
//                    print(e.code);
//                    if (e.code == 'ERROR_WRONG_PASSWORD') {
//                      setState(() {
//                        wrongPassword = true;
//                      });
//                    } else {
//                      setState(() {
//                        emailText = 'User doesn\'t exist';
//                        passwordText = 'Please check your email';
//
//                        wrongPassword = true;
//                        wrongEmail = true;
//                      });
//                    }
//                  }