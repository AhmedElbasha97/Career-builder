import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:ui';
import 'package:careerbuilder/Bottom_Navigation_Bars/MainBottom/main_bottom.dart';
import 'package:careerbuilder/Test_Component/Test_models/user_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:firebase_storage/firebase_storage.dart';



const String tImage='https://www.jo1sat.com/images/default.png';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}


class _EditProfileState extends State<EditProfile> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  File _imageFile;
  bool _uploaded = false;
  bool _downloaded = false;
  String _downloadUrl;
  bool interNetConnection = false;

  List <User> allData = []; // list data in the array

  final _auth = FirebaseAuth.instance;
  final DBRef = FirebaseDatabase.instance.reference();
  FirebaseUser loggedInUser;

  String UID;

  int scoreNull = 0;
  int scoreFromFirebase;
  bool dataHasNotDisplayed = true;

  String ImageAfterUp;

  TextEditingController _FNcontroller = TextEditingController();
  TextEditingController _LNcontroller = TextEditingController();
  TextEditingController _Jopcontroller = TextEditingController();
  TextEditingController _Agecontroller = TextEditingController();
  TextEditingController _Phonecontroller = TextEditingController();

  String _jop, _fname, _lname;
  var _age, _phone;


  getCurrentUser() async {
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
      DBRef.child("users").orderByKey().equalTo(UID).once().then((
          DataSnapshot snap) {
        var keys = snap.value.keys; //return unique keys
        var data = snap.value;
        for (var key in keys) {
          DBRef.child('users').onValue.listen((event) {
            var snapshot = event.snapshot;

            ImageAfterUp = snapshot.value[key]['profile_picture'];
            print('Value is $ImageAfterUp');

          });
          allData.add(
              User(
                  email: data[key]['email'],
                  id: data[key]['id'],
                  password: data[key]['password'],
                  first_name: data[key]['first_name'],
                  last_name: data[key]['last_name'],
                  total_points: data[key]['total_points'],
                  profile_picture: data[key]['profile_picture'],
                  job: data[key]['job'],
                  age: data[key]['age'],
                phone_number: data[key]['phone'],
              )
          );
          setState(() {
            _FNcontroller =
                TextEditingController(text: data[key]['first_name'],);
            _LNcontroller =
                TextEditingController(text: data[key]['last_name'],);
            _Agecontroller =
                TextEditingController(text: data[key]['age']);
            _Jopcontroller =
                TextEditingController(text: data[key]['job']);
            _Phonecontroller =
                TextEditingController(text: data[key]['phone']);

          });
        }
        print('Lengthiiiiiiiiiiiiiiii : ${allData.length}');
      });
      //todo -------------------------------------

    }
    else {
      print('no UID yet');
    }
  }

  Future getImage(bool isCamera, BuildContext context) async {
    File image; //file is from dart:io package
    if (isCamera) {
      image = await ImagePicker.pickImage(source: ImageSource.camera);
    } else {
      image = await ImagePicker.pickImage(source: ImageSource.gallery);
    }
    setState(() {
      _imageFile = image; //store image in state variable called _imageFile
    });
//    uploadImage(context);
  }

  Future uploadImage(BuildContext context) async {
    String fileName = basename(_imageFile.path);
    StorageReference _reference = FirebaseStorage.instance.ref().child(
        fileName);
    StorageUploadTask uploadTask = _reference.putFile(_imageFile);
    StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;

    setState(() {
      _uploaded = true;
    });
    downloadImage(context);
  }

  Future downloadImage(BuildContext context) async {
    String fileName = basename(_imageFile.path);
    StorageReference _reference = FirebaseStorage.instance.ref().child(
        fileName);
    String downloadAddress = await _reference.getDownloadURL();
    setState(() {
      _downloadUrl = downloadAddress;
    });
    setState(() {
      _downloaded = true;
      print('_dowo is : ${_downloaded}');
    });
    UpdateImageProfile(context);
  }

  void UpdateImageProfile(BuildContext context) {
    DBRef.child('users').child(UID).update({
      'profile_picture':_downloadUrl
    });
    if (dataHasNotDisplayed==true) {
      const oneSecond = const Duration(milliseconds: 10);
      new Timer.periodic(oneSecond, (Timer t) {
        setState(() {});
        t.cancel();
      });

    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery
        .of(context)
        .size
        .width;
    double height = MediaQuery
        .of(context)
        .size
        .height;


    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff09d8d2),
          title: Center(
            child: Text(
                'Edit Profile',
                style: TextStyle(
                  fontFamily: "Roboto",
                  fontSize: 20,
                  color: Color(0xffffffff),
                )
            ),
          ),

          leading: IconButton(
            icon: Icon(Icons.navigate_before),
            onPressed: () {
              _showBackDialog(context);
            },
          ),
          actions: <Widget>[
            FlatButton(
              child: Text("Save", style: TextStyle(
                fontFamily: "Roboto",
                fontSize: 15,
                color: Color(0xffffffff),
              )),
              onPressed: () {
                //todo add function to save the updates
                SaveFun(context);
              },
            ),
          ],
        ),
        body: SafeArea(
          child: Container(
              child: SingleChildScrollView(
                  child: Column(
                      children: <Widget>[
                        ClipPath(
                          clipper: HeaderClipper(),
                          child: Container(
                            width: double.infinity,
                            height: height /2.3,
                            decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                color: Color(0xff09D8D2),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.teal.withOpacity(0.5),
                                    blurRadius: 10.0,
                                    // has the effect of softening the shadow
                                    spreadRadius: 5.0,
                                    // has the effect of extending the shadow
                                    offset: Offset(0, 7),
                                  )
                                ]),
                            child: Stack(
                              children: <Widget>[
                                Positioned(
                                    width: 350,
                                    top: 30,
                                    left: 10,
                                    child: SizedBox(
                                        height: 300,
                                        width: 300,
                                        child: allData.length == 0 ? NoImage(_imageFile) :

                                        ListView.builder(
                                            itemCount: 1,
                                            itemBuilder: (_, index) {
                                              return widgetImageProfile(allData[index].profile_picture,_imageFile);
                                            })

                                    )
                                ),
                                Positioned(
                                  left: 220,
                                  top: 170,
                                  child:
//                           IconButton(icon: Icon(Icons.camera_alt), onPressed: (){})
                                  GestureDetector(
                                    onTap: () {
                                      getImage(
                                          false, context); //todo make it false
                                    },
                                    child: Container(
                                      // make refresh is true
                                      margin: EdgeInsets.all(5),
                                      padding: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                          color: Color(0xff56C7AF),
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
                              ],
                            ),

                          ),
                        ),


                        Padding(padding: EdgeInsets.all(0)),
              new Theme(
                  data: new ThemeData(
                    hintColor: Colors.teal,

                  ),
                          child: Form(
                              key: _formKey,
                              child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 30, vertical: 10),
//                  height: MediaQuery.of(context).size.height ,
//                  width: MediaQuery.of(context).size.width,
                                  child: Column(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child:
                                             TextFormField(
                                              controller: _FNcontroller,
                                              keyboardType: TextInputType.text,
                                              decoration: new InputDecoration(
                                                labelText: "First Name",
                                                fillColor: Colors.white,
                                                enabled: false,
                                                border: new OutlineInputBorder(
                                                  borderRadius: new BorderRadius.circular(25.0),
                                                  borderSide: new BorderSide(
                                                    color: Color(0xff09D8D2),
                                                  ),
                                                ),
                                                //fillColor: Colors.green
                                              ),
                                              validator: (val) {
                                                if (val.length == 0) {
                                                  return " first name cannot be empty";
                                                }
                                                if (val.runtimeType == int) {
                                                  return " first name must be text";
                                                }
                                                else {
                                                  return null;
                                                }
                                              },
                                              onSaved: (comeinput) {
                                                _fname = comeinput;
                                              },
                                              style: new TextStyle(
                                                fontFamily: "Poppins",
                                              ),
                                            ),

                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: TextFormField(
                                            controller: _LNcontroller,
                                            keyboardType: TextInputType.text,
//                  inputFormatters: <TextInputFormatter>[
//                    WhitelistingTextInputFormatter.digitsOnly
//                  ],
                                            decoration: new InputDecoration(
                                              labelText: "Last Name",
                                              fillColor: Colors.white,
                                              border: new OutlineInputBorder(
                                                borderRadius: new BorderRadius
                                                    .circular(25.0),
                                                borderSide: new BorderSide(
                                                ),
                                              ),
                                              //fillColor: Colors.green
                                            ),
                                            validator: (val) {
                                              if (val.length == 0) {
                                                return " last name cannot be empty";
                                              }
                                              if (val.runtimeType == int) {
                                                return " last name  must be text";
                                              }
                                              else {
                                                return null;
                                              }
                                            },
                                            onSaved: (comeinput) {
                                              _lname = comeinput;
                                            },
                                            style: new TextStyle(
                                              fontFamily: "Poppins",
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: TextFormField(
                                            controller: _Agecontroller,
                                            keyboardType: TextInputType.number,
                                            inputFormatters: <TextInputFormatter>[
                                              WhitelistingTextInputFormatter
                                                  .digitsOnly
                                            ],
                                            decoration: new InputDecoration(
                                              labelText: "Age",
                                              fillColor: Colors.white,
                                              border: new OutlineInputBorder(
                                                borderRadius: new BorderRadius
                                                    .circular(25.0),
                                                borderSide: new BorderSide(
                                                ),
                                              ),
                                              //fillColor: Colors.green
                                            ),
                                            validator: (val) {
                                              if (val.length == 0) {
                                                return " Age cannot be empty";
                                              }
//                    if(val.runtimeType == String ){
//                      return " Age name  must be number";
//                    }
                                              else {
                                                return null;
                                              }
                                            },
                                            onSaved: (comeinput) {
                                              _age = comeinput;
                                            },
                                            style: new TextStyle(
                                              fontFamily: "Poppins",
                                            ),
                                          ),
                                        ),

                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: TextFormField(
                                            controller: _Jopcontroller,
                                            keyboardType: TextInputType.text,
//                  inputFormatters: <TextInputFormatter>[
//                    WhitelistingTextInputFormatter.digitsOnly
//                  ],
                                            decoration: new InputDecoration(
                                              labelText: "Job",
                                              fillColor: Colors.white,
                                              border: new OutlineInputBorder(
                                                borderRadius: new BorderRadius
                                                    .circular(25.0),
                                                borderSide: new BorderSide(
                                                ),
                                              ),
                                              //fillColor: Colors.green
                                            ),
                                            validator: (val) {
                                              if (val.length == 0) {
                                                return " Job cannot be empty";
                                              }
                                              // ignore: missing_return

                                              if (val.runtimeType is int) {
                                                print("not match");
                                                return " Job  must be text";
                                                // ignore: missing_return
                                              }

                                              else {
//                    print("not match");
                                                return null;
                                              }
                                            },
                                            onSaved: (comeinput) {
                                              _jop = comeinput;
                                            },
                                            style: new TextStyle(
                                              fontFamily: "Poppins",
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: TextFormField(
                                            controller: _Phonecontroller,
                                            keyboardType: TextInputType.phone,
                                            inputFormatters: <TextInputFormatter>[
                                              WhitelistingTextInputFormatter
                                                  .digitsOnly
                                            ],
                                            decoration: new InputDecoration(
                                              labelText: "Phone number",
                                              fillColor: Colors.white,
                                              border: new OutlineInputBorder(
                                                borderRadius: new BorderRadius
                                                    .circular(25.0),
                                                borderSide: new BorderSide(
                                                ),
                                              ),
                                              //fillColor: Colors.green
                                            ),
                                            validator: (val) {
                                              if (val.length == 0) {
                                                return " Phone number cannot be empty";
                                              }
//                    if(val.runtimeType == String){
//                      return " Phone number must be number";
//                    }
                                              else {
                                                return null;
                                              }
                                            },
                                            onSaved: (comeinput) {
                                              _phone = comeinput;
                                            },
                                            style: new TextStyle(
                                              fontFamily: "Poppins",
                                            ),
                                          ),
                                        ),

                                      ])
                              )),
                        ),


                      ])
              )
          ),

        )
    );
  }

  Future<void> SaveFun(BuildContext context) async {
    final formState = _formKey.currentState;
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      try {

        if(_imageFile!=null){
          await  uploadImage(context);
        }

     print("the url is ppp  $_downloadUrl ");
        writeData(UID);
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return MainBottom(numOfPage: 4,);
        }));

        //todo go to login page

      } catch (e) {
        print(e.message);
      }
    }
  }

  void writeData(String userid ) {

    DBRef.child('users').child(userid).update({
      'job': '$_jop',
      'phone':'$_phone',
      'first_name': '$_fname',
      'last_name': '$_lname',
      'age': '$_age',

    });
  }

//  Future<bool> _onBackPressed() {
//    _showBackDialog(context);
//  }
}

  Widget widgetImageProfile(String profImage, File imgfile) {
//if(ImageAfter!=null){
//  print('the image from ImageAfter 3');
//}
    // todo listview.builder
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, top: 40),
      child: Container(
          width: 200,
          height: 170,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  decoration:BoxDecoration(
                    boxShadow: [
                      BoxShadow(
//                          offset: Offset(2, 2),
                          blurRadius: 9,
                          spreadRadius: 9.0,
                          color: Colors.teal.withOpacity(
                              0.6))
                    ],
                    borderRadius:
                    BorderRadius.all(Radius.circular(75)),
                  ),
                  child:
                  ClipOval(
                    child:imgfile==null?
                    Image.network(
                      profImage,
                      width: 120,
                      height: 120,
                      fit: BoxFit.cover,
                    ):
                    Image.file(imgfile, width: 120,
                      height: 120,)

                  ),
                ),
              ]
          )
      ),
    );
  }

  Widget NoImage(File imgfile) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, bottom: 20),
      child: Container(
          width: 200,
          height: 170,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
//                          offset: Offset(2, 2),
                          blurRadius: 10,
                          spreadRadius: 9.0,
                          color: Colors.teal.withOpacity(
                              0.6))
                    ],
                    borderRadius:
                    BorderRadius.all(Radius.circular(75)),
                  ),
                  child: ClipOval(
                    child:
                   imgfile==null?
                    Image.network(
                      tImage,
                      width: 120,
                      height: 120,
                      fit: BoxFit.cover,
                    ):
                   Image.file(imgfile, width: 120,
                     height: 120,)

                  ),
                ),
              ]
          )
      ),
    );
  }


void _showBackDialog(BuildContext context) {
  // flutter defined function
  showDialog(
    context: context,
    builder: (BuildContext context) {
      // return object of type Dialog
      return AlertDialog(
        title: new Text("Edit profile"),
        content: new Text("Discard changes?"),
        actions: <Widget>[
          // usually buttons at the bottom of the dialog
          new FlatButton(
            child: new Text("Cancle"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          new FlatButton(
            child: new Text("Discard"),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return MainBottom(numOfPage: 4,);
              })
              );
            },
          ),
        ],
      );
    },

  );

}
class HeaderClipper extends CustomClipper<Path> {
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
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}