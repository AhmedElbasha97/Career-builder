import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:url_launcher/url_launcher.dart';

class CoursesCard extends StatelessWidget{
  final String myUrl;
  final String name;
  final String imgCont;
  final String imgAva;
  final int  vdNum;
  final double hrNum;
  final double rnNumber;

  const CoursesCard({
    Key key,this.myUrl,this.name,this.imgCont,this.imgAva,this.vdNum,this.hrNum,this.rnNumber}
      ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: GestureDetector( //that enable to click on container
        onTap: () {
          _launchURL(myUrl);
        },
        //TODO make the URL as property
        child: Container(
            height: 250,
            width: double.infinity,
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
                      height: 140,
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
                    subtitle: SmoothStarRating(
                        allowHalfRating: false,
                        starCount: 5,
                        rating:rnNumber ,
                        size: 30.0,
                        filledIconData: Icons.star,
                        halfFilledIconData: Icons.star_half,
                        color: Color(0xffFFBF00),
                        borderColor: Color(0xffF3C08F),
                        spacing: 0.0
                    ),

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

_launchURL(String myurl) async {
  if (await canLaunch(myurl)) {
    await launch(myurl);
  } else {
    return Alert(title: "re connect the internet please",
        desc: "there's nothing to show").show();
  }
}
