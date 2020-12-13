import 'package:careerbuilder/Tracks/mobile/ui/Flutter.dart';
import 'package:careerbuilder/Tracks/mobile/ui/JQ.dart';
import 'package:careerbuilder/Tracks/mobile/ui/MySQL.dart';
import 'package:careerbuilder/Tracks/mobile/ui/Node.dart';
import 'package:careerbuilder/Tracks/mobile/ui/React.dart';
import 'package:careerbuilder/Tracks/mobile/ui/Ruby.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContainerOfButtons extends StatelessWidget {

  final String fristBTNImg;
  final String secondBTNImg;
  final int fristIdRef;
  final int secoundIdRef;
  const ContainerOfButtons(this.fristBTNImg,this.fristIdRef,this.secondBTNImg,this.secoundIdRef);



  @override
  Widget build(BuildContext context) {
    lanchScreen(int id){
      switch(id){
        case 1:{
          Navigator.push(context, new MaterialPageRoute(builder: (context) {return Flutter();}),);
        }
        break;
        case 2:{
          Navigator.push(context, new MaterialPageRoute(builder: (context) {return JQ();}),);
        }
        break;

        case 3:{
          Navigator.push(context, new MaterialPageRoute(builder: (context) {return MySQL();}),);
        }
        break;
        case 4:{
          Navigator.push(context, new MaterialPageRoute(builder: (context) {return NodeJS();}),);
        }
        break;
        case 5:{
          Navigator.push(context, new MaterialPageRoute(builder: (context) {return React();}),);
        }
        break;
        case 6:{
        Navigator.push(context, new MaterialPageRoute(builder: (context) {return Ruby();}),);
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
