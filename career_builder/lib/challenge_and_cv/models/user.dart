import 'package:firebase_database/firebase_database.dart';


class User{
  final String fName;
  final String lName;
  final String job;
  final String gender;
  final String education;
  final String email;
  final String phone;
  final String age;
  final String img;
  static final userDbRef = FirebaseDatabase.instance.reference().child('users');


  User({
    this.fName,
    this.lName,
    this.job,
    this.gender,
    this.education,
    this.email,
    this.phone,
    this.age,
    this.img});

        factory User.fromJson(Map<String,dynamic>json){
           return User(
             fName: json['first_name'],
             lName: json['last_name'],
             job: json['job'],
             gender: json['gender'],
             education: json['eduvation'],
             email: json['email'],
             phone: json['phone'],
             age: json['age'],
             img: json['profile_picture'],
             
             );
             
         }
 static fetchUser(){
  userDbRef.child('id').equalTo('0').once().then(( snapshot){
   var userResponse = snapshot.value;
     print('userResponse1 $userResponse');
     return
        User.fromJson(userResponse);        
  });
  }
  }
