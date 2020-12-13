import 'package:flutter/material.dart';
// ignore: camel_case_types
class containerOfAboutOfInfo extends StatelessWidget {
  // ignore: non_constant_identifier_names
  final String IMGRef;
  final String textOfAbout;
  const containerOfAboutOfInfo(this.IMGRef,this.textOfAbout);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width /1,
      height: MediaQuery.of(context).size.height/1.4,
      child: Stack(
        children: <Widget>[
          //ToDo:- ده الجزاء الخاص بى الصوره والستاك بتعها بس غير كده مفيش
          Container(
            width: MediaQuery.of(context).size.width /1,
            height: MediaQuery.of(context).size.height/2.7,
            alignment: Alignment.topCenter,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(IMGRef),
                  fit: BoxFit.fill,
                  alignment: Alignment.topCenter
              ),
            ),
          ),
          //ToDo:- ده الجزاء الفيه الكونتانر بتاع الابوت وفيه الكونتار البعديه ال ستاك ده مبتبدى بالعكس
          Align(
            alignment: Alignment.bottomLeft,
            child: Row(
              children: <Widget>[
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                   width: MediaQuery.of(context).size.width /1,
                   height: MediaQuery.of(context).size.height/2.4,
                    child: Row(
                      children: <Widget>[
                        Stack(
                          children: <Widget>[

                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                margin: EdgeInsets.only(left: 25, top: 50,right: 25,bottom: 30),
                                width: MediaQuery.of(context).size.width /1.17,
                                height: MediaQuery.of(context).size.height/4,

                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(color: Colors.black.withOpacity(0.2),
                                        blurRadius: 6,
                                        offset:Offset(1,1)
                                    ),
                                  ],
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(25),
                                    topRight: Radius.circular(25),
                                    bottomLeft: Radius.circular(25),
                                    bottomRight: Radius.circular(25),
                                  ),
                                ),
                                child:Align(
                                  alignment: Alignment.center,
                                  child: ConstrainedBox(
                                    constraints: BoxConstraints(
                                      maxHeight: MediaQuery.of(context).size.height/9,
                                      maxWidth: MediaQuery.of(context).size.width /1.5,
                                    ),
                                    child: Container(

                                      child: Text(
                                        textOfAbout,
                                        style: TextStyle(
                                          fontFamily: "Roboto",
                                          fontSize: 14,
                                          color:Color(0xff000000),
                                        ),),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                margin: EdgeInsets.only(left:25),
                                width: MediaQuery.of(context).size.width /5,
                                height: MediaQuery.of(context).size.height/5,
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    shape: BoxShape.circle
                                ),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "About",
                                    style: TextStyle(
                                      fontFamily: "Roboto",fontWeight: FontWeight.w700,
                                      fontSize: 22,
                                      color:Color(0xffffffff),
                                    ),),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
