import 'package:flutter/material.dart';
class Congrate extends StatelessWidget {
  var question1Result;
  var question2Result;
  // Congrate(this.question1Result,this.question2Result);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Column(
          // mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/challenge_cv/congrates3.jpg'),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Congratulations, you completed all challenges. ' ,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black54,
              ),
              
              ),
            ),
            SizedBox(height: 50,),
            GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Container(
                width: 200,
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration( 
                       color:  Color(0xff09D8D2),
                       borderRadius: BorderRadius.all(Radius.circular(20))

                 ),
                child:Text(
                  'Finish',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),)
                ),
            ),
          ],
        ),
      ),
    );
  }
}