import 'package:flutter/material.dart';
import 'package:careerbuilder/Tracks/Networking/UI/infoForLang.dart';
import 'package:careerbuilder/Tracks//Networking/UI/infoForLang2.dart';
import 'package:careerbuilder/Tracks/Networking/UI/infoForLang3.dart';
import 'package:careerbuilder/Tracks/Networking/UI/infoForLang4.dart';
class containerOfButtons extends StatelessWidget {

 final String fristBTNImg;
 final String secondBTNImg;
 final int fristIdRef;
 final int secoundIdRef;
const containerOfButtons(this.fristBTNImg,this.fristIdRef,this.secondBTNImg,this.secoundIdRef);



  @override
  Widget build(BuildContext context) {
    lanchScreen(int id){
      switch(id){
        case 1:{
          Navigator.push(context, new MaterialPageRoute(builder: (context) {return infoForBashLang();}),);
        }
        break;
        case 2:{
          Navigator.push(context, new MaterialPageRoute(builder: (context) {return infoForObjCLang();}),);
        }
        break;

        case 3:{
          Navigator.push(context, new MaterialPageRoute(builder: (context) {return infoForPerlLang();}),);
        }
        break;
        case 4:{
          Navigator.push(context, new MaterialPageRoute(builder: (context) {return infoForCCNALang();}),);
        }
        break;
      }
    }
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,

      children: [
        Container(
          //ToDo:- ده مكان البوردر بتاع الزراير
          width: MediaQuery.of(context).size.width /1,
          height: MediaQuery.of(context).size.height/6.7,
          color: Color.fromRGBO(190, 230, 243, 100),
          child: Container(

            width: MediaQuery.of(context).size.width /1,
            height: MediaQuery.of(context).size.height/9,

            child: Stack(

              children: <Widget>[
                Align(
                  // ToDo:- ده مكان  زرار بالصورة بتاعته
                  alignment: Alignment.centerLeft,
                  child: Container(
                    width: MediaQuery.of(context).size.width /1.9,
                    height: MediaQuery.of(context).size.height/7,
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: (){
                        lanchScreen(fristIdRef);

                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width /0.1,
                        height: MediaQuery.of(context).size.height/7,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            //ToDo:- ديه صورهخ الزرار
                            image: AssetImage(fristBTNImg),
                            fit: BoxFit.fitWidth,

                          ),

                        ),

                      ),
                    ),
                  ),
                ),
                Align(
                  // ToDo:- ده مكان  زرار بالصورة بتاعته
                  alignment: Alignment.bottomRight,
                  child: Container(
                    width: MediaQuery.of(context).size.width /1.8,
                    height: MediaQuery.of(context).size.height/7,

                    child: GestureDetector(
                      onTap: (){
                       lanchScreen(secoundIdRef);

                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width /0.1,
                        height: MediaQuery.of(context).size.height/7,

                        decoration: BoxDecoration(
                          image: DecorationImage(
                            //ToDo:- ديه صورهخ الزرار
                            image: AssetImage(secondBTNImg),
                            fit: BoxFit.fitWidth,

                          ),

                        ),
                      ),
                    ),

                  ),
                ),

              ],
            ),
          ),
        ),
      ],
    );

    }

}

