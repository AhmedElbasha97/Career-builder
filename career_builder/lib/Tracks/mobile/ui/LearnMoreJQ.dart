import 'package:careerbuilder/Tracks/mobile/model/Courses.dart';
import 'package:careerbuilder/Tracks/mobile/ui/Cell.dart';
import 'package:careerbuilder/challenge_and_cv/widgets/menu_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LearnMoreJQ extends StatefulWidget {
  @override
  _LearnMoreJQ createState() => _LearnMoreJQ();
}

class _LearnMoreJQ extends State<LearnMoreJQ> {
  List<Courses> course =[
    Courses("Unique ",6 , "assets/Tracks/mobile development/images/1024px-Circle-icons-profile.svg.PNG", "assets/Tracks/mobile development/images/jq.PNG", "https://www.youtube.com/watch?v=2v5tZCyX7As&list=PLtFbQRDJ11kFNxjsbgm9uWqTQhtkY0Fzk ", 4.0, 84),
    Courses("ElZero",5.5, "assets/Tracks/mobile development/images/zero1.JPG","assets/Tracks/mobile development/images/jq.PNG", "https://www.youtube.com/watch?v=JLm1ELLqJkA&list=PLDoPjvoNmBAwXDFEEpc8TT6MFbDAC5XNB", 4.2, 53),
    Courses("EJ ", 5,"assets/Tracks/mobile development/images/1024px-Circle-icons-profile.svg.PNG" ,"assets/Tracks/mobile development/images/jq.PNG" , "https://www.youtube.com/watch?v=plLQQmqfdQY&list=PLr6-GrHUlVf_RNxQQkQnEwUiHELmB0fW1", 4.2, 58),
    Courses("mmtuts", 1.5, "assets/Tracks/mobile development/images/1024px-Circle-icons-profile.svg.PNG", "assets/Tracks/mobile development/images/jq.PNG", "https://www.youtube.com/watch?v=BaIgTKj1iCQ&list=PL0eyrZgxdwhy7byLHsVkuhtRV_IpoJU7n", 4.0, 12),
    Courses("Wbsleson", 14, "assets/Tracks/mobile development/images/1024px-Circle-icons-profile.svg.PNG", "assets/Tracks/mobile development/images/jq.PNG", "https://www.youtube.com/watch?v=hvwdgWk1b2o&list=PLxl69kCRkiI1bpvzdSs_FM_lc79Q6UU9y", 4.8, 168)
  ];

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff09d8d2),
          title:Center(
            child: Text('Courses'),
          ),
          // ToDo:- ده الجزاء الخاص بى زرارين الفى الااب بار
          leading: IconButton(
            icon: Icon(Icons.navigate_before),
            onPressed: (){
              Navigator.pop(context);
            },
          ),

        ),
        endDrawer: Menu(),
        body: ListView(
          children: <Widget>[
            Container(
              height: 230,
              width:380,
              child: Stack(
                children: <Widget>[
                  Container(
                    height: 220,
                    width: 380,
                    alignment: Alignment.topCenter,
                    decoration: BoxDecoration(
                      // ToDo:- ده مكان الفيه صوره الكونتانر الفوق
                      image: DecorationImage(
                          image: AssetImage('assets/Tracks/mobile development/images/jq.PNG'),
                          fit: BoxFit.fill,
                          alignment: Alignment.topCenter
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      height: 43,
                      width: 167,
                      alignment: Alignment.center,

                      decoration: BoxDecoration(
                        color: Color(0xff728686),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(50),
                          bottomRight: Radius.circular(50),
                        ),
                      ),
                      child: Text(
                          "Courses",
                          style: TextStyle(
                            fontFamily: "Roboto",fontWeight: FontWeight.w700,
                            fontSize: 24,
                            color:Color(0xffffffff),

                          )
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ListView.builder(
              physics: ScrollPhysics(),
              shrinkWrap: true,
              itemCount: course.length,
              itemBuilder: (BuildContext context, int index) {
                return CoursesCard( vdNum: course[index].vdNum,name: course[index].name,
                    imgCont: course[index].imgCont, rnNumber: course[index].rnNumber,
                    myUrl: course[index].myUrl, imgAva: course[index].imgAva, hrNum: course[index].hrNum );
              },
            ),
          ],
        ),
      ),
    ) ;
  }
}