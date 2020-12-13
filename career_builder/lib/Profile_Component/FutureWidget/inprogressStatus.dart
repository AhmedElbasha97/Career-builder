import 'package:careerbuilder/Test_Component/sql_database/dbmanager.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';


class InProgressStatus extends StatefulWidget {
  @override
  _InProgressStatusState createState() => _InProgressStatusState();
}

class _InProgressStatusState extends State<InProgressStatus> {

  final DbStudentManager dbManager = DbStudentManager();

  List<Logos> loglist;  //the list of profile logo
  List<InPro> listTwo;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
        height: 90,
        width: 700,
        child:
        FutureBuilder(
            future: dbManager.getINList(), // get all record
            builder: (context, snapshot) {

              if (snapshot.hasData&& !snapshot.hasError) {
                listTwo = snapshot.data; // get all data
                if(listTwo.length!=0) {
                  return ListView.builder(
                      scrollDirection:
                      Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: listTwo.length,
                      itemBuilder:
                          (context, index) {
                        InPro lo = listTwo[index];
                        if (lo
                            .inprogressImage !=
                            null &&
                            lo.inproScore !=
                                null) {
                          return Container(
                            width: 400,
                            // todo the width of the card
                            child: Row(
                              children: <
                                  Widget>[
                                Container(
                                  width:
                                  width * 0.9,
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment
                                        .start,
                                    children: <
                                        Widget>[
                                      ListTile(
                                          title:
                                          Text(
                                            '${lo
                                                .nameOfExam} Score',
                                            style:
                                            TextStyle(
                                              color:
                                              Colors
                                                  .lightBlue,
                                              fontSize:
                                              20,
                                            ),
                                          ),
                                          subtitle:
                                          LinearPercentIndicator(
                                            width: MediaQuery
                                                .of(
                                                context)
                                                .size
                                                .width -
                                                150,
                                            animation:
                                            true,
                                            lineHeight:
                                            20.0,
                                            animationDuration:
                                            2000,
                                            percent:
                                            lo
                                                .inproScore /
                                                100,
                                            //todo =>  percentage / 100
                                            center:
                                            Text(
                                                "${lo
                                                    .inproScore}%"),
                                            linearStrokeCap:
                                            LinearStrokeCap
                                                .roundAll,
                                            progressColor:
                                            Colors
                                                .blueAccent[100],
                                          ),
                                          leading:
                                          CircleAvatar(
                                            maxRadius:
                                            25,
                                            backgroundImage:
                                            NetworkImage(
                                                lo
                                                    .inprogressImage),
                                            //TODO : make the AssetImage as property
                                          )),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        }
                        else {
                          return Text('');
                        }
                      }
                  );
                }
                Center(child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text("No progress yet 👷",textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w700,fontSize: 20,color: Color(0xffAABABA)),),
                ));

              }
              return Center(child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text("No progress yet 👷",textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w700,fontSize: 20,color: Color(0xffAABABA)),),
              ));
            }
        )
    );
  }
}
