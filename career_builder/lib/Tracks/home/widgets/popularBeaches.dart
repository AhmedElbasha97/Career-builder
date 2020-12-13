import 'package:flutter/cupertino.dart';
import 'package:careerbuilder/Tracks/Networking/UI/homePageOfNetworking.dart';
import 'package:careerbuilder/Tracks/Desktop/Ui/Desktop.dart';
import 'package:careerbuilder/Tracks/mobile/ui/HomeOfMobile.dart';
import 'package:careerbuilder/Tracks/Other/UI/homePageOfOther.dart';
import 'package:careerbuilder/Tracks/Web/Ui/home of web.dart';
import 'package:flutter/material.dart';
import 'package:careerbuilder/Tracks/home/models/beachesModel.dart';
import 'package:flutter/widgets.dart';

class PopularBeaches extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  lanchScreen(int Id){
    switch(Id){
      case 1:{
        Navigator.push(context, new MaterialPageRoute(builder: (context) {return HomeOfMobile();}),);
      }
      break;
      case 2:{
        Navigator.push(context, new MaterialPageRoute(builder: (context) {return web();}),);
      }
      break;

      case 3:{
        Navigator.push(context, new MaterialPageRoute(builder: (context) {return Desktop();}),);
      }
      break;
      case 4:{
        Navigator.push(context, new MaterialPageRoute(builder: (context) {return HomePageOfNetworking();}),);
      }
      break;
      case 5:{
        Navigator.push(context, new MaterialPageRoute(builder: (context) {return HomePageOfOther();}),);
      }
      break;
    }
  }
    return Container(
      height: 300,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemCount: beaches.length,
        itemBuilder: (context, index){
          BeachesModel beachesModel = beaches[index];
          return GestureDetector(
      onTap: (){
        lanchScreen(beachesModel.id);
      },
      child: Container(
        margin: EdgeInsets.only(right: 20),
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color(0xFFF082938)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Container(
                width: 200,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: AssetImage(beachesModel.img),
                    fit: BoxFit.cover,


                  )
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[

                    Text(beachesModel.title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    )),
                    SizedBox(height: 150),
                    Text(beachesModel.desc,style: TextStyle(
                      color: Colors.white,
                      fontSize: 18
                    )),
                    SizedBox(height: 40)
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );

  },
  ),
  );
}

  Widget beacheItemIcon(IconData iconData, String text){
    return Row(
      children: <Widget>[
        Icon(iconData, color: Colors.white),
        SizedBox(width: 2),
        Text(text, style: TextStyle(color: Colors.white))
      ],
    );
  }

}