import 'dart:core';
import 'dart:io';
import 'package:careerbuilder/Bottom_Navigation_Bars/MainBottom/main_bottom.dart';
import 'package:careerbuilder/Profile_Component/Screens/profile_page.dart';
import 'package:careerbuilder/challenge_and_cv/widgets/menu_bar.dart';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'modelCodeOfDiscount.dart';
import 'cellOfGifts.dart';
import 'modelOfGifts.dart';
import 'package:firebase_database/firebase_database.dart';
class ListOfGifts extends StatefulWidget {

  final int points;
  final String userId;
  const ListOfGifts({Key key, this.points, this.userId}) : super(key: key);


  _ListOfGiftsState createState() => _ListOfGiftsState(points,userId);
}

class _ListOfGiftsState extends State<ListOfGifts> {
  int max = 0;

  String titleOfTheList = "0 points";
  final DBRef = FirebaseDatabase.instance.reference().child("discount");
bool haveNoEnoughPoints = false;
  final int points;
  final String userId;
  String discount = "";
  String giftsurl = "https://career-builder-54d16.firebaseio.com/offers.json";
  String discounturl = "https://career-builder-54d16.firebaseio.com/code_of_discount.json";
  String discountAppliedurl = "https://career-builder-54d16.firebaseio.com/discount.json";
  String myPercentage = "";
  String offersId = "";
  String partnerId = "";
  bool dataHasNotDisplayed = true;
  int id = 0;
  bool interNetConnection = false;
  List<giftsDataBase> listgifts = [];
  List<DiscountDataBadse> listCodes = [];

  final discountController = TextEditingController();
  _ListOfGiftsState(this.points, this.userId);
  //Todo:- save string to the cached memory
  saveToCachedMemory(String somethingNeedToBeSaved, String itSRefrence,) async {

    SharedPreferences prefs = await SharedPreferences
        .getInstance();
    prefs.setString('$itSRefrence', "$somethingNeedToBeSaved");
  }
  //Todo:- get date to send it to the database
  String getDate(){
    DateTime now = new DateTime.now();
    String formatterDate= DateFormat('yMd').format(now);
    return formatterDate;
  }
  //Todo:- get time to send it to the database
 String getTime(){
    DateTime now = new DateTime.now();
   String formatterTime=  DateFormat('jms').format(now);
   return formatterTime;
  }
  //ToDo:- asure there's data in cached memory
  suring() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // ignore: non_constant_identifier_names
    bool CheckValue = prefs.containsKey('value');
    return CheckValue;
  }
  //ToDo:- check connectivity
  checkIfThereIsInternetConnectionOrNot() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('connected');
       interNetConnection = false;
      }
    } on SocketException catch (_) {
      print('not connected');
      interNetConnection = true;
    }
  }
  //ToDo:- get string from cached memory
  getValuesSF(String SavedItemRef,int id) async {

    switch(id){
      case 1:{SharedPreferences prefs = await SharedPreferences.getInstance();
      //Return String
      String stringValue = prefs.getString('$SavedItemRef');
      return stringValue;
      }
      break;
      case 2:{
        SharedPreferences prefs = await SharedPreferences.getInstance();
        //Return bool
        bool boolValue = prefs.getBool('$SavedItemRef');
        return boolValue;
      }
    }
  }
//Todo:- check the code of the discount and apply it
  applyTheCode(String theCode) async {

    int counter = 0;
    discounts:for (var discount in listCodes) {
      if (theCode == discount.code_of_discount) {
        saveToCachedMemory(discount.partener_id, "stringpartenerId");
        var Continue = await getData();
        if (Continue) {
          _showMyMessage(context, points, "the code has entered is wright",
              "the code has been applied succesfully", 2, true, false);
        }
        print(suring());
        break;
      } else {
        //Todo:- to make the code await until the list of the discount come all from database and get the data from it and search in all of it
        if (counter == 30){

          break;
        }

        counter += 1;
        continue discounts;
      }
    }
    // Todo:- to make sure that the loop is finshed
    if (counter == 30){

      _showMyMessage(context,0,"the code has entered is wrong" ,"please check the code you have entred", 1,true,true);

    }
  }
 // Todo:- increment way
 //ToDo:- the counter of id
  Future<int> _getIntFromSharedPref() async {
    final prefs = await SharedPreferences.getInstance();
    final startupNumber = prefs.getInt('startupNumber');
    if (startupNumber == null) {
      return 0;
    }
    return startupNumber;
  }
  //Todo:- to incrsease the id by one
  Future<int> _incrementStartup() async {
    final prefs = await SharedPreferences.getInstance();

    int lastStartupNumber = await _getIntFromSharedPref();
    int currentStartupNumber = ++lastStartupNumber;

    await prefs.setInt('startupNumber', currentStartupNumber);
    return lastStartupNumber;

  }
  //ToDo:- get all of the data come from the app that saved in cached memory
 getData() async {
    bool checkIfThereisItem = await getValuesSF("chooseditem", 2) ?? false;

    if (!checkIfThereisItem){
   _showMyMessage(context,0, "you havent choose item", "please choose any item", 1, true, false);

   return false;
 }else {
      await getTheIds();
      id = max;
      discount = await discountController.text;
      myPercentage = await getValuesSF("stringMyprecentage", 1);
      partnerId = await getValuesSF("stringpartenerId", 1);
      offersId = await getValuesSF("stringItemId", 1);
      sendData();
      print(id);
      print(myPercentage);
      print(partnerId);
      print(offersId);
      print(discount);
   return true;
    }
 }
 // Todo:- to get ids from the database and increase it
  getTheIds  () async {

    DBRef.once().then((DataSnapshot snapshot){
      Map<dynamic, dynamic> values = snapshot.value;
      values.forEach((key,values) {

        var id =  values["id"] ;
        print(id);
        if (id > max){
          max = id;
        }

      });
     max = max + 1;
    });

 }
  //ToDo:- to estimate the stage of the points
  String getpoints(int points){
    if (points < 1000){
      haveNoEnoughPoints = true;

      titleOfTheList = "$points points";
      return "0";
    }else if (points >= 1000 && points < 2000){
      titleOfTheList = "$points points";
      return "1000";
    }else if (points >= 2000 && points < 3000){
      titleOfTheList = "$points points";
      return "2000";
    }else if (points >= 3000 && points < 4000){
      titleOfTheList = "$points points";
      return "3000";
    }else if (points >= 4000 && points < 5000){
      titleOfTheList = "$points points";
      return "4000";
    }else if (points >= 5000 && points < 6000){
      titleOfTheList = "$points points";
      return "5000";
    }else if (points >= 6000 && points < 7000){
      titleOfTheList = "$points points";
      return "6000";
    }else if (points >= 7000 && points < 8000){
      titleOfTheList = "$points points";
      return "7000";
    }else{
      titleOfTheList = "$points points";
      return "8000";
    }
  }
  //Todo:- check if there is enough points and internet
  checkIfThereIsPointsEnought(){
    if(haveNoEnoughPoints) {
      _showMyMessage(context,0, "no enought point for rewards",
          "you can't take any rewards at now please take more exams to take many points",
          2, true, false);
    }
    if(interNetConnection) {
      _showMyMessage(context,0, "you do not have internet connection",
          "please check your connection and come back",
          2, true, false);
    }
    }
//ToDo:- get the data of the gifts from database
  Future <http.Response> getDataGifts() async {
    try {
      var point = await getpoints(points);

      var response = await http.get(giftsurl);
      if (response.statusCode == 200) {
        String responeBody = response.body;
        var jsonBody = jsonDecode(responeBody);
        for (var gift in jsonBody) {
          if (point == gift["points"]) {
            giftsDataBase listgift = giftsDataBase(
                gift["id"],
                gift["itemname"],
                gift["itempicture"],
                gift["itemprice"],
                gift["itempriceafterdiscount"],
                gift["points"],
                gift["rangeofprice"],
                gift["mypercentage"]);


            listgifts.add(listgift);
          } else {
            continue;
          }
        }
        } else {
       print(response.statusCode);
       _showMyMessage(context,0,"please check your internet connection" ,"something happen wrong when you try to connect to the server", 1,true,true);
      }
        } catch (e) {
      throw 'NO Connection ';
    }
  }



  //Todo:send data to the dat base if the code of discount is wright
  sendData()async{

  DBRef.push().set({
    "code_of_discount":discount,
    "id":id,
    "date":getDate(),
    "time":getTime(),
    "my_percentage":myPercentage,
    "offers_id":offersId,
    "partner_id":partnerId,
    "user_id":"$userId",

  });

  }
  //ToDo:- get the data of discount from databse
  // ignore: missing_return
  Future <http.Response> getDataDiscount() async {
    try {


      var response = await http.get(discounturl);
      if (response.statusCode == 200) {
        String responeBody = response.body;
        var jsonBody = jsonDecode(responeBody);
        for (var discount in jsonBody) {

          DiscountDataBadse listCode = DiscountDataBadse(
            discount['id'],
            discount['code_of_discount'],
            discount['partner_id'],
            discount['value_of_discount'],
          );

           listCodes.add(listCode);
           print(listCode.code_of_discount);

        }
      } else {
        print(response.statusCode);
        _showMyMessage(context,0,"please check your internet connection" ,"something happen wrong when you try to connect to the server", 1,true,true);
      }
    } catch (e) {
      throw 'NO Connection ';
    }
  }
  //ToDo: check if the user choose something or not
  getchooseditem() async {
    var CheckValue = getValuesSF("chooseditem", 2);
    if (CheckValue == null){
      return false;
    }else {
      return CheckValue;
    }
  }
  addBoolToSF() async {
    if(!getchooseditem())
    {SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('chooseditem', false);}
  }


  @override
  void initState() {

    super.initState();
    checkIfThereIsPointsEnought();
    getTheIds();
    addBoolToSF();
    getDataGifts();
    getDataDiscount();

    //ToDo:- to make the screen refresh after time so to ensure if the data come from data base
    if (dataHasNotDisplayed) {
      const oneSecond = const Duration(seconds: 10);
      new Timer.periodic(oneSecond, (Timer t) => setState(() {}));
    }
  }

    @override
    Widget build(BuildContext context) {
      _portraitModeOnly();
    return new MaterialApp(
         home: Scaffold(
           appBar: AppBar(

             backgroundColor: Color(0xff09d8d2),
             title:Center(
               //ToDo:- ده مكان التيتل
               child: Text(
                   'gifts',
                   style: TextStyle(
                     fontFamily: "Roboto",
                     fontSize: 30,
                     color:Color(0xffffffff),
                   )
               ),
             ),
             //ToDo:- ده مكان زرار الباك
             leading: IconButton(
               icon: Icon(Icons.navigate_before),
               onPressed: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context){
                   return MainBottom(numOfPage: 4,);
                 }));
               },
             ),
             //ToDo:- ده مكان زرار المنيو

           ),
           endDrawer: Menu(),
           body: SingleChildScrollView(
             child: Stack(
               children: <Widget>[
                 Container(
                   height: MediaQuery.of(context).size.height * 1,
                   width: MediaQuery.of(context).size.width * 1,
                   decoration: BoxDecoration(
                     //ToDo:- the back ground
                     image: DecorationImage(
                       image: AssetImage("assets/gifts/background.png"),
                       fit: BoxFit.cover,
                     ),
                   ),
                 ),
                 Column(

                   children: <Widget>[
                     //ToDo:- the container
                     Align(
                       alignment: Alignment.topCenter,
                       child: Container(
                         alignment: Alignment.center,
                         height: MediaQuery.of(context).size.height * 0.67,
                         width: MediaQuery.of(context).size.width *  0.885,
                         decoration: BoxDecoration(

                           image: DecorationImage(
                             image: AssetImage("assets/gifts/container shape.png"),
                             fit: BoxFit.cover,
                           ),
                         ),
                         child: Column(
                           children: <Widget>[
                             //Todo: the place you hold the header
                             Align(
                               alignment: Alignment.topCenter,
                               child: Container(
                                 margin: EdgeInsets.only(top: 7),

                                 height: MediaQuery.of(context).size.height * 0.09875,
                                 width: MediaQuery.of(context).size.width *  0.885,
                                 decoration: BoxDecoration(
                                   image: DecorationImage(
                                     image: AssetImage("assets/gifts/header shape.png"),
                                     fit: BoxFit.cover,
                                   ),
                                 ),
                                 child: Align(
                                   alignment: Alignment.center,
                                   child: Text(
                                     //Todo:- the place you hold the points in it
                                       titleOfTheList,

                                       style: TextStyle(
                                         fontFamily: "Roboto",
                                         fontSize: 25,
                                         color:Color(0xffffffff).withOpacity(0.99),
                                       )
                                   ),
                                 ),
                               ),
                             ),
                             //Todo:- the place you hold in it the gifts list
                             Container(
                               child: SizedBox(
                                 height: MediaQuery.of(context).size.height * 0.45,

                                 child: FutureBuilder(
                                     builder: (BuildContext context, AsyncSnapshot snapshot) {
                                       if (listgifts.length == 0) {
                                      // ToDo:- if he have enough point or not
                                         if(haveNoEnoughPoints){
                                           return Center(
                                               child: GestureDetector(
                                                 onTap: (){
                                                   checkIfThereIsPointsEnought();
                                                 },
                                                 child: Container(
                                                   alignment: Alignment.center,
                                                   height: 125,
                                                   width: MediaQuery.of(context).size.width * 0.8,
                                                   decoration: BoxDecoration(
                                                     borderRadius: BorderRadius.all(Radius.circular(10)),
                                                     color: Color(0xff749291),
                                                   ),
                                                   child: Text(
                                                     "you don't have enought point collect more points and come back!",
                                                     style: TextStyle(fontSize: 20,color: Color(0xff08d8d1),

                                                     ),
                                                   ),
                                                 ),
                                               )
                                           );
                                         }
                                         if(interNetConnection){

                                             return Center(
                                                 child: GestureDetector(
                                                   onTap: (){
                                                     checkIfThereIsPointsEnought();
                                                   },
                                                   child: Container(
                                                     alignment: Alignment.center,
                                                     height: 125,
                                                     width: MediaQuery.of(context).size.width * 0.8,
                                                     decoration: BoxDecoration(
                                                       borderRadius: BorderRadius.all(Radius.circular(10)),
                                                       color: Color(0xff749291),
                                                     ),
                                                     child: Text(
                                                       "you do not have internet connection check your connection and come again",
                                                       style: TextStyle(fontSize: 20,color: Color(0xff08d8d1),

                                                       ),
                                                     ),
                                                   ),
                                                 )
                                             );

                                         }
                                         return Center(child: CircularProgressIndicator(),);
                                       } else  {

                                         //Todo:- to make auto refresh stop
                                         dataHasNotDisplayed = false;
                                         return showListOfGifts();
                                       }
                                     }
                                 ),
                               ),
                             ),

                           ],
                         ),
                       ),
                     ),
                     //Todo:- the place you wright the code of discount in it
                     Align(
                       alignment: Alignment.bottomCenter,
                       child: Padding(
                           child: Container(
                             alignment: Alignment.bottomCenter,

                             child: Column(
                               children: <Widget>[
                                 Container(
                                   height: MediaQuery.of(context).size.height * 0.05,
                                   width: MediaQuery.of(context).size.width *  1,
                                   color: Colors.white,
                                   child: TextField(
                                     controller: discountController,

                                     textAlign: TextAlign.center,
                                     decoration: InputDecoration(

                                       border: InputBorder.none,
                                       hintText: 'please enter the code of discount',
                                       hintStyle: TextStyle(color: Colors.grey),
                                     ),
                                   ),
                                 )
                               ],
                             ),
                           ),
                           padding: EdgeInsets.only(

                               bottom: MediaQuery.of(context).viewInsets.bottom)),
                     ),
                     //Todo:buttons of the apply the code
                     GestureDetector(
                       onTap: () {
                         applyTheCode(discountController.text);
                       },
                       child: Container(
                         alignment: Alignment.bottomCenter,
                         margin: EdgeInsets.only(top: 5),
                         height: MediaQuery.of(context).size.height * 0.12,
                         width: MediaQuery.of(context).size.width *  1,
                         decoration: BoxDecoration(
                           image: DecorationImage(
                             //ToDo:- ديه صورهخ الزرار
                             image: AssetImage("assets/gifts/BTNOfApplyTheCode.png"),
                             fit: BoxFit.fill,

                           ),

                         ),
                       ),
                     ),
                   ],
                 ),

               ],
             ),
           ),

         ),
       );
     }

    //Todo:- widget of gifts
    Widget showListOfGifts(){

            return  ListView.builder(
              itemCount: listgifts.length,
              itemBuilder: (BuildContext context, int index) {
                return  giftsCard(name: listgifts[index].item_name,
                  itemImg: listgifts[index].item_picture,
                  range: listgifts[index].range_of_price,
                  priceAfterDiscount: listgifts[index]
                      .item_price_after_discount,
                  priceBeforeDiscount: listgifts[index].item_price,
                  itemPoints: listgifts[index].points,
                  id: listgifts[index].id,
                  my_percentage: listgifts[index].my_percentage,);
              },

            );

    }

  }
// ToDo:- every show massage show in the screen
void _showMyMessage(BuildContext context, int points,String title ,String message, int id,bool applyOkBTN,bool applyCancelBTN) {
  var alert = new AlertDialog(
    title: new Text("$title"),
    content: new Text(message),
    actions: <Widget>[
      new FlatButton(
        onPressed: () {
          switch(id){
            case 1:{
              Navigator.pop(context);
            }
            break;
            case 2:{
              Navigator.push(context, MaterialPageRoute(builder: (context){
              return MainBottom(numOfPage: 4,giftPointComing: points,);
              }));
            }
          }
        },
        child: new Text('ok'),
      ),

        new FlatButton(
          onPressed: () {
     if(applyCancelBTN) {switch (id) {
               case 1:{
               Navigator.of(context, rootNavigator: true).pop('dialog');
                    }
                    break;
                     }
                       }
          },
          child: new Text(applyCancelBTN ? 'cancel' : ''),
        )

    ],
  );
  showDialog(context: context, child: alert);
}
//ToDo:- or portrait mode
void _portraitModeOnly() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}