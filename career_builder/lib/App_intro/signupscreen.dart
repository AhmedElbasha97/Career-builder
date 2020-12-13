import 'package:careerbuilder/Bottom_Navigation_Bars/MainBottom/main_bottom.dart';
import 'package:careerbuilder/Home_component/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:careerbuilder/Home_component/components/buttonLoginAnimation.dart';
import 'package:careerbuilder/Home_component/components/customTextFormfield.dart';
//import 'package:khaledfinalpart/screens/dashScreen.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:careerbuilder/App_intro/loginScreen.dart';



///////////////
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_app/auth.dart';
//import 'package:flutter_app/pages/setup/signIn.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String tImage='https://www.jo1sat.com/images/default.png';

/////////////////////
class Signupscreen extends StatefulWidget {
  @override
  _SignupscreenState createState() => _SignupscreenState();
}


class _SignupscreenState extends State<Signupscreen> {
  String _email, _password,_fname,_lname , _education , _job , _gender , _skills ,_notes,_rePassword;
  var _age,_phone;
//  _OldState createState() => _OldState();

  bool check;
  int maxIDS = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;

//  final BaseAuth authnwe = Auth();
  int score = 0;
  // ignore: non_constant_identifier_names
  final DBRef = FirebaseDatabase.instance.reference();


  File _imageFile;
  String _downloadUrl;

  Future getImage(bool isCamera) async {
    File image; //file is from dart:io package
    if (isCamera) {
      image = await ImagePicker.pickImage(source: ImageSource.camera);
    } else {
      image = await ImagePicker.pickImage(source: ImageSource.gallery);
    }
    setState(() {
      _imageFile = image; //store image in state variable called _imageFile
    });
    uploadImage();
  }

  Future uploadImage() async {
    String fileName = basename(_imageFile.path);
    StorageReference _reference = FirebaseStorage.instance.ref().child(
        fileName);
    StorageUploadTask uploadTask = _reference.putFile(_imageFile);
    StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
    downloadImage();
  }

  Future downloadImage() async {
    String fileName = basename(_imageFile.path);
    StorageReference _reference = FirebaseStorage.instance.ref().child(
        fileName);
    String downloadAddress = await _reference.getDownloadURL();
    setState(() {
      _downloadUrl = downloadAddress;
    });
  }
  var userType;
  int selectedRadio1;
  int selectedRadio2;
  List gender=[];
   _handeleRadioButton(int value){
    setState(() {
      var radioValue=value;
      switch(radioValue){
        case 0:
          userType='female';
          selectedRadio1=0;
          selectedRadio2=0;
          gender.add(userType);
          print(userType);

          break;
        case 1:
          userType='male';
          selectedRadio2=1;
          selectedRadio1=1;
          gender.add(userType);
          print(userType);



          break;

      }
    });
  }

  getTheIds  () async {

    DBRef.child('user_skills').once().then((DataSnapshot snapshot){
      Map<dynamic, dynamic> values = snapshot.value;
      values.forEach((key,values) {

        var id =  values["id"] ;
        print(id);
        if (id > maxIDS){
          maxIDS = id;
        }
      });
      maxIDS = maxIDS + 1;
    });
    print(maxIDS);
  }

  TextEditingController _controller;
  List oldSkills= [];

  var userInput;
  @override
  void initState() {
    super.initState();
    getTheIds();
    selectedRadio1=1;
    selectedRadio2=0;
    _controller = TextEditingController();
  }
  void dispose(){
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       key: _scaffoldKey,
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height ,
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
                                alignment: Alignment.topCenter
                            )
                        ),
                      ),
                    ),
                    Positioned(
                        width: 100,
                        top: 78,
                        left: 157,
                        child: Column(children: <Widget>[
                          CircleAvatar(
                            radius: 160,
                            backgroundColor: Color(0xff06D6D0),
                            child: ClipOval(
                              child: new SizedBox(
                                width: 95.0,
                                height: 95.0,
                                child: (_imageFile!=null)?Image.file(
                                  _imageFile,
                                  fit: BoxFit.fill,
                                ):Image.network(
                                  "https://www.jo1sat.com/images/default.png",
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                        ])
                    ),
                    Positioned(
                      left: 225,
                      top: 235,
                      child:
//                           IconButton(icon: Icon(Icons.camera_alt), onPressed: (){})
                      GestureDetector(
                        onTap: () {
                          getImage(false); //todo make it false
                        },
                        child: Container(
                          // Camera here
                          margin: EdgeInsets.all(5),
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Color(0xff06D6D0),
                              borderRadius: BorderRadius.circular(
                                  100),
                              border: Border.all(
                                  width: 2,
                                  color: Colors.tealAccent)),
                          child: Icon(
                            Icons.camera_alt,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
//                    Positioned(
//                        height: 500,
//                        left: 183,  //todo to change the positioned of the button
//                        child: FloatingActionButton(
//                            backgroundColor:Colors.grey ,
//                            child: Icon(Icons.clear,color: Colors.white,),
//                            onPressed: (){
//                              Navigator.pop(context);
//                            }
//                        )
//                    ),
                  ],
                ),
               // Text('start codindg from here'),
                Form (key: _formKey,

                 child: Container(
                 padding: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
//                  height: MediaQuery.of(context).size.height ,
//                  width: MediaQuery.of(context).size.width ,

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
//                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[

                      Text("Sign Up Now",style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 20
                      )),
                      SizedBox(height: 20),
//                      ListView(
//                        children: <Widget>[
                       CustomTextFormField(

                        // ignore: missing_return
                        validator: (input) {
                          if (input.isEmpty) {
                            return 'Please enter First your name';
                          }
                        },
                        onSaved: (innpuutt) {
                          _fname = innpuutt;
                        },
                        label: "First Name",
                      ),
                       SizedBox(height: 10),
                       CustomTextFormField(
                        // ignore: missing_return
                        validator: (input) {
                          if (input.isEmpty) {
                            return 'Please enter your Last name';
                          }
                        },
                        onSaved: (innpuutt) {
                          _lname = innpuutt;
                        },
                        label: "Last Name",
                      ),
                      SizedBox(height: 10),
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
                          setState(() {
                            _password=input;
                          });
                        },
                        onSaved: (innpuutt) {
                          _password = innpuutt;
                        },
                        label: "Password",
                        isPassword: true,
                        icon: Icon(Icons.https, size: 27,color: Color(0xFFF032f41),),
                      ),
                      SizedBox(height: 10),
                      CustomTextFormField(

                        onSaved: (innpuutt) {
                          _rePassword = innpuutt;
                        },
                        // ignore: missing_return
                        validator: ( input) {
                          if (input != _password) {
                            print('the pass is $_password and re_pass is $input');
                            return 'your password is Wrong !!!';
                          }
                        },

                        label: "Rep-Password",
                        isPassword: true,
                        icon: Icon(Icons.https, size: 27,color: Color(0xFFF032f41),),
                      ),
                      SizedBox(height: 10),
                      CustomTextFormField(
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          WhitelistingTextInputFormatter.digitsOnly
                        ],
                        // ignore: missing_return
                        validator: (input) {
                          if (input.isEmpty) {
                            return 'Please enter your age ';
                          }
                        },
                        onSaved: (innpuutt) {
                          _age = innpuutt;
                        },

                        label: "Age",
                      ),
                      SizedBox(height: 10),

                   Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: <Widget>[
                       Radio(
                         value: 0,
                         groupValue:selectedRadio1,
                       onChanged:  _handeleRadioButton,
                       ),
                       Text(
                         'Female',
                         style: new TextStyle(fontSize: 17.0),
                       ),
                       Radio(
                         value: 1,
                         groupValue:selectedRadio2,
                         onChanged:  _handeleRadioButton,

                       ),
                       Text(
                         'Male',
                         style: new TextStyle(fontSize: 17.0),
                       ),

                     ],),
                      CustomTextFormField(
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          WhitelistingTextInputFormatter.digitsOnly
                        ],

                        // ignore: missing_return
                        validator: (input) {
                          // ignore: missing_return
                          if (input.isEmpty) {
                            return 'Please enter your Phone number ';
                          }
                        },
                        onSaved: (innpuutt) {
                          _phone = innpuutt;
                        },

                        label: "phone Number",
                      ),
                      SizedBox(height: 15),
                      CustomTextFormField(

                        // ignore: missing_return
                        validator: (input) {
                          // ignore: missing_return
                          if (input.isEmpty) {
                            return 'Please enter your Education ';
                          }
                        },
                        onSaved: (innpuutt) {
                          _education = innpuutt;
                        },

                        label: "Your Education",
                      ),
                      SizedBox(height: 15),
                      CustomTextFormField(

                        // ignore: missing_return
                        validator: (input) {
                          // ignore: missing_return
                          if (input.isEmpty) {
                            return 'Please enter your Job ';
                          }
                        },
                        onSaved: (innpuutt) {
                          _job = innpuutt;
                        },

                        label: "Your Job",
                      ),
                      SizedBox(height: 15),
                      Row(

                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(

                            width: MediaQuery.of(context).size.width*0.69,
                            child: TextField(
                              controller: _controller,
                              cursorColor: Colors.cyan,

                              decoration: InputDecoration(
                                labelText: 'your skills',
                                icon: Icon(Icons.accessibility_new),),
                              maxLength: 15,
                              keyboardType: TextInputType.text,
                              style: TextStyle(color:Colors.black87),

                              onChanged: (text){
                                userInput=text;
                              },
                              onSubmitted: (text){
                                userInput=text;
                                setState(() {
                                  if(oldSkills.contains(userInput)||userInput==null){
                                    return;
                                  }else{
                                    oldSkills.add(userInput);
                                    _controller.clear();
                                    print(oldSkills);
                                  }

                                });
                              },
                            ),
                          ),
                          IconButton(icon: Icon(Icons.add),
                            onPressed: (){
                              setState(() {
                                if(oldSkills.contains(userInput)||userInput==null){
                                  return;
                                }else{
                                  oldSkills.add(userInput);
                                  _controller.clear();
                                  print(oldSkills);
                                }
                              });},)
                        ],
                      ),
                      oldSkills.isNotEmpty? Center(
                        child: SizedBox(
                          height: 200,
                          child: ListView.builder(
                            itemCount: oldSkills.length,
                            itemBuilder: (context,index){
                              return Row(
                                children: <Widget>[
                                  IconButton(
                                    icon: Icon(Icons.close),
                                    onPressed: (){
                                      setState(() {
                                        oldSkills.removeAt(index);
                                        userInput=null;
                                      });
                                    },),
                                  SizedBox(height: 10,),
                                  Text(oldSkills[index]),
                                ],
                              );
                            },
                          ),
                        ),
                      ):Container(),
                       Center(
                   child: Container(
                     height: 50,
                     width: 220,
                     child:RaisedButton(
                          child: Text('Sign up', style: TextStyle(color:Colors.white,fontStyle: FontStyle.normal,fontSize: 20.0),),
                          shape:  RoundedRectangleBorder(
                              borderRadius:  BorderRadius.circular(20.0)),
//                              side: BorderSide(color: Colors.white)),
//                          color: Colors.lightBlueAccent,
                          color: Color.fromRGBO(57, 225, 237,1),
                          onPressed: () {

                            signUP(context);
                          }
                      ),),),
                       SizedBox(height: 15),
// Adobe XD layer: 'New Account' (group)
                    Center(
                           child: InkWell(
                             onTap: (){
                               Navigator.push(context, MaterialPageRoute(builder: (_){
                                 return LoginScreen();
                               }));
                             },
                             child: Text(
                               'Already Have an Account?',
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

Future<void> signUP(BuildContext context) async{
  final formState=_formKey.currentState;
  if(_formKey.currentState.validate()){
    _formKey.currentState.save();
    try{
//        String userId=await authnwe.signUPMethod(_email, _password);
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: _email, password: _password);
      FirebaseUser user = result.user;
      writeData(user.uid);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('logged', 'true');
      //todo go to login page

//        Navigator.pop(context);
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
         return MainBottom();
       }));

    }
    catch(e){
      print(e.message);
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

void writeData(String userid) {
  DBRef.child('users').child(userid).set({
    'email': '$_email',
    'id': '$userid',
    'password': '$_password',
    'first_name':'$_fname',
    'last_name':'$_lname',
    'total_points':score,
    'age':'$_age',
    'phone':'$_phone',
    'profile_picture':_downloadUrl==null?tImage:_downloadUrl,
    'eduvation':_education,
    'job':'$_job',
    'gender':'${gender[0]}',
    'old_skills':oldSkills,
    'notes':_notes,
  });

  DBRef.child('user_skills').child(userid).set({
    'id':maxIDS,
    'skill_id':oldSkills,
    'status':'old',
    'user_id':userid
  });


}

// ignore: non_constant_identifier_names
void ReadData() {
  DBRef.once().then((DataSnapshot snapshot) {
    print('Data : ${snapshot.value}');
  });
}


}
class RoundedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height-100);
    path.quadraticBezierTo(size.width / 2, size.height, size.width, size.height - 100);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}


