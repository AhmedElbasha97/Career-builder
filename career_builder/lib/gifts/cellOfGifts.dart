import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class giftsCard extends StatelessWidget {


  final String name;
  final String range;
  final String  priceBeforeDiscount;
  final String  priceAfterDiscount;
  final String  itemImg;
  final String  itemPoints;
  final String id;
  final String my_percentage;
  const giftsCard({
    Key key,this.name,this.range,this.priceAfterDiscount,this.priceBeforeDiscount,this.itemImg,this.itemPoints, this.id, this.my_percentage}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GestureDetector( //that enable to click on container
        onTap: () {
          _showMyMessage(context,"$priceAfterDiscount", "$itemPoints","$name", "$id","$my_percentage", 1);

        },
        //TODO make the URL as property
        child: SizedBox(
          height: 125,
          child: Container(
              height: 125,
              width: double.infinity,
              decoration: BoxDecoration(


                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Color(0xff749291),
              ),
              child: Container(
                child: ListTile(
                  leading: CircleAvatar(
                    maxRadius: 30,
                    backgroundImage: NetworkImage(

                       itemImg
                    ),
                  ),

                    title: Container(
                      height: 25,
                      width: 70,
                      child: Text(name,
                        style: TextStyle(color: Color(0xff08d8d1),
                            //TODO : make this text as property
                            fontSize: 25,
                            fontWeight: FontWeight.bold),),
                    ),
                    subtitle: Column(

                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[

                        Text(
                          "range between: $range",
                            style: TextStyle(
                              fontFamily: "Roboto",
                              fontSize: 15,
                              color:Color(0xffffffff),
                            )
                        ),
                            Text(
                                "Price Before Discount:$priceBeforeDiscount",
                                style: TextStyle(
                                  fontFamily: "Roboto",
                                  fontSize: 15,
                                  color:Color(0xffffffff),
                                )
                            ),
                              Text(
                                  "Price After Discount:$priceAfterDiscount",
                                  style: TextStyle(
                                    fontFamily: "Roboto",
                                    fontSize: 15,
                                    color:Color(0xffffffff),
                                  )
                              )

                      ],
                    ),

                    ), )
          ),
        ),
      ));

  }
}

void _showMyMessage(BuildContext context,String price,String itemPoints ,String itemName,String itemId,String my_percentage,int id) {
  var alert = new AlertDialog(
    title: new Text("you have choose"),
    content: Container(
      height: 90,
      width: 60,
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "$itemName",
          ),
          Text(
            "you will lose $itemPoints point from your points",
          ),
          Text(
            "you have to pay $price",
          ),
        ],
      ),
    ),
    actions: <Widget>[
            new FlatButton(
              onPressed: () {
                switch(id) {
                  case 1:
                    {
                   savemyprecentegedCachedMemory(my_percentage);
                      saveToitemidCachedMemory(itemId);
                      Navigator.of(context, rootNavigator: true).pop('dialog');
                      choosingItem("chooseditem", true);
                    }
                }
        },
        child: new Text('ok'),
      ),
      new FlatButton(
        onPressed: () {
          switch(id){
            case 1:{
              Navigator.pop(context);
              choosingItem("chooseditem", false);
            }
          }
        },
        child: new Text('cancel'),
      )
    ],
  );
  showDialog(context: context, child: alert);
}
// todo:- ued to save data of item in cached memory as percentage of me an bool that show he choose item or not
saveToitemidCachedMemory(String itemId) async {
  SharedPreferences prefs = await SharedPreferences
      .getInstance();
  prefs.setString('stringItemId', "$itemId");
}

savemyprecentegedCachedMemory(String my_percentage) async {
  SharedPreferences prefs = await SharedPreferences
      .getInstance();
  prefs.setString('stringMyprecentage', "$my_percentage");
}
choosingItem(String strngOfCachedMemory, bool value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool('$strngOfCachedMemory' , value);
}
