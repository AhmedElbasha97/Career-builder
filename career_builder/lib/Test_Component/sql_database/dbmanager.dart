import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

String tableName='logos';
String tableTwoName='inprogress';
String prfileLogoColumn='prfileLogo';
String nameOfLogoColumn='nameOfLogo';
//-----------------------------------------------------
String inprogressImageColumn='inprogressImage';
String inproScoreColumn='inproScore';
String nameOfExamColumn='nameOfExam';

class DbStudentManager{
  Database _database; //instance


  Future openDB() async {

    if (_database==null){ // if no exist data base please create one
      _database=await openDatabase(
          join(await getDatabasesPath(),"logo.db"),
          version: 1,
          onCreate: (Database db , int version) async{
            await db.execute("CREATE TABLE $tableName (id INTEGER PRIMARY KEY AUTOINCREMENT, $prfileLogoColumn TEXT ,$nameOfLogoColumn TEXT)");
            await db.execute("CREATE TABLE $tableTwoName (id INTEGER PRIMARY KEY AUTOINCREMENT, $inprogressImageColumn TEXT , $inproScoreColumn INTEGER , $nameOfExamColumn TEXT)");
          }
      );
    }}

  Future <int> insertLogo (Logos logoOne) async {
    await openDB();
    return await  _database.insert('$tableName', logoOne.toMap()); // call the toMap function from the Student class
  }
  Future <int> insertInprogress (InPro logoOne) async {
    await openDB();
    return await  _database.insert('$tableTwoName', logoOne.toMapTwo()); // call the toMap function from the Student class
  }

  Future <List <Logos>> getLogoList () async {
    await openDB();
    final List <Map<String,dynamic>> maps =await _database.query('$tableName');
    return List.generate(maps.length, (i){ // i =index
      return Logos(
          id: maps[i]['id'],
          prfileLogo: maps[i]['prfileLogo'],
          nameOfLogo:maps[i]['nameOfLogo']

      );
    });
  }

  Future <List <InPro>> getINList () async {
    await openDB();
    final List <Map<String,dynamic>> maps =await _database.query('$tableTwoName');
    return List.generate(maps.length, (i){ // i =index
      return InPro(
          id: maps[i]['id'],
          inprogressImage: maps[i]['inprogressImage'],
          inproScore: maps[i]['inproScore'],
          nameOfExam:maps[i]['nameOfExam']
      );
    });
  }

  Future <int> updateINpro (InPro student) async {
    await openDB();
    return await _database.update('$tableName', student.toMapTwo(),where: '$nameOfExamColumn =?',whereArgs: [student.nameOfExam]);
  }
  Future <bool> matchINPro (var theNname) async {
    await openDB();
    final List <Map<String,dynamic>> maps = await _database.query('$tableTwoName',where:'$nameOfExamColumn=?',whereArgs: [theNname] );
    return maps.length!=null?true:false;
  }
  Future <int> matchLogo (var theNname) async {
    await openDB();
    final List <Map<String,dynamic>> maps = await _database.query('$tableName',where:'$nameOfLogoColumn=?',whereArgs: [theNname] );
    return maps.length;
  }
//
  Future <void> deleteINpro (String theName)async{
    await openDB();
    return await _database.delete('$tableTwoName', where: '$nameOfExamColumn=?',whereArgs: [theName]);
  }

}


class Logos {

  int id ;
  String prfileLogo; // achiev_logo in database
  String nameOfLogo;



  Logos({ this.id , this.prfileLogo ,this.nameOfLogo});

  Map<String , dynamic> toMap() {
    return {'prfileLogo':prfileLogo,'nameOfLogo':nameOfLogo}; // no id here because the id is autoincrement
  }


}

class InPro {

  int id ;
  String inprogressImage; // inprogress Image in database
  int inproScore;// inProgress in test score
  String nameOfExam; // the name of the test

  InPro({ this.id ,this.inprogressImage,this.inproScore,this.nameOfExam});

  Map<String , dynamic> toMapTwo() {
    return {'inprogressImage':inprogressImage,'inproScore':inproScore,'nameOfExam':nameOfExam}; // no id here because the id is autoincrement
  }



}
