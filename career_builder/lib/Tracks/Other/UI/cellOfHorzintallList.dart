import 'package:flutter/material.dart';
class coursesCard extends StatelessWidget {

  final String myUrl;
  final String name;
  final String imgCont;
  final String imgAva;
  final int  vdNum;
  final double hrNum;
  final double rnNumber;


  const coursesCard({
    Key key,this.myUrl,this.name,this.imgCont,this.imgAva,this.vdNum,this.hrNum,this.rnNumber}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GestureDetector( //that enable to click on container
        onTap: () {

        },
        //TODO make the URL as property
        child: Container(
            height: 150,
            width: 160,
            decoration: BoxDecoration(

              boxShadow: [
                BoxShadow(
                  color: Colors.teal.withOpacity(0.8),
                  blurRadius: 10.0,
                  // has the effect of softening the shadow
                  spreadRadius: 0.0,
                  // has the effect of extending the shadow
                  offset: Offset(0, 7),
                )
              ],
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.white70,
            ),
            child: Column(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8.0),
                    topRight: Radius.circular(8.0),
                  ),
                  child: Image.asset(
                      imgCont,
                      width: 380,
                      height: 170,
                      fit: BoxFit.fill
                  ),
                  //TODO : make this image of the container as property
                ),
                ListTile(
                    leading: CircleAvatar(
                      maxRadius: 30,
                      backgroundImage: AssetImage(imgAva),
                      //TODO : make the AssetImage as property
                    ),

                    title: Text(name,
                      style: TextStyle(color: Colors.lightBlue,
                          //TODO : make this text as property
                          fontSize: 25,
                          fontWeight: FontWeight.bold),),

                    trailing: Column(children: <Widget>[
                      Text('videos : $vdNum'), // TODO make it easier
                      Text('Hours : $hrNum'), //TODO make it easier
                    ],)

                ),
              ],
            )
        ),
      ),
    );
  }
}