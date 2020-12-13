import 'package:careerbuilder/Test_Component/sql_database/dbmanager.dart';
import 'package:flutter/material.dart';


class AchievementContainer extends StatefulWidget {
  @override
  _AchievementContainerState createState() => _AchievementContainerState();
}

class _AchievementContainerState extends State<AchievementContainer> {


  final DbStudentManager dbManager = DbStudentManager();

  List<Logos> loglist;  //the list of profile logo
  List<InPro> listTwo;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 90,
        width: 700,
        child: FutureBuilder(
            future: dbManager.getLogoList(),
            // get all record
            builder: (context, snapshot) {
              if (snapshot.hasData && !snapshot.hasError) {
                loglist = snapshot.data;
                if(loglist.length!=0) {
//                                                    loglist.length != null ?
                  return ListView.builder(
                      scrollDirection:
                      Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: loglist.length,
                      itemBuilder: (context, index) {
                        Logos lo = loglist[index];
                        if (lo.prfileLogo != null) {
                          return Container(
                            child: ClipOval(
                              child: Align(
                                child: Image.network(lo.prfileLogo,
                                  fit: BoxFit.cover,
                                  width: 90.0,
                                  height: 90.0,),
                              ),
                            ),
                          );
                        }
                        else {
                          return Text('');
                        }
                      }
                  );
                }
                return Center(child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text("No achievement yet 🏆",textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w700,fontSize: 20,color: Color(0xffAABABA)),),
                ));
              }
              return
                CircularProgressIndicator();
            }
        )
    );
  }
}
