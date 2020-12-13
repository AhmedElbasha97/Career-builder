import 'package:flutter/material.dart';
class ContainerAboutOfMainHome extends StatelessWidget {
  final String textOfAbout;
  final String ImageRefrence;
  const ContainerAboutOfMainHome(this.textOfAbout,this.ImageRefrence);
  @override
  Widget build(BuildContext context) {
    return  Container(
      width: MediaQuery.of(context).size.width /1,
      height: MediaQuery.of(context).size.height/2.001,
      child: Stack(



        children: <Widget>[
          Container(

            alignment: Alignment.topCenter,
            decoration: BoxDecoration(
              //ToDo:- ده مكان الصوره الفوق
              image: DecorationImage(
                image: AssetImage(ImageRefrence),
                fit: BoxFit.contain,
                alignment: Alignment.topCenter,
              ),
            ),

          ),
          //ToDo:- ده مكان الفى الابوت
          Align(
            alignment: Alignment.bottomCenter,

            child:Container(
              height: MediaQuery.of(context).size.height/5,
              padding: const EdgeInsets.only(top: 10.0,left: 20.0,right: 20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: Align(
                alignment: Alignment.topCenter,
                child: Row(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topCenter,
                      child: FloatingActionButton(
                        onPressed: null,
                        backgroundColor: Color(0xff09d8d2),
                        child: Text('About'), ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 30,left: 10),

                      child: Align(
                        alignment: Alignment.topCenter,
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            maxHeight: MediaQuery.of(context).size.height/3,
                            maxWidth: MediaQuery.of(context).size.width/1.5,
                          ),
                          // ToDo:- المكان الفى الوصف بتاع المواد كلها
                          child: Text(textOfAbout),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),




        ],
      ),


    );
  }
}
