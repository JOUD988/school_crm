import 'package:flutter/material.dart';
import 'package:schoolcrm/controller/program_controller.dart';
import 'package:schoolcrm/view/components/app_bar_style.dart';
import 'package:schoolcrm/view/consatans/colors.dart';
import 'package:schoolcrm/view/consatans/fonts.dart';
import 'package:schoolcrm/view/screens/parent/programs/componants/custom_table.dart';
class StudentsProgram extends StatefulWidget {

  @override
  State<StudentsProgram> createState() => _StudentsProgramState();
}

class _StudentsProgramState extends State<StudentsProgram> {

  ProgramController programController = ProgramController();


  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          shape: shape,
          systemOverlayStyle: systemOverlayStyle,
          centerTitle: true,
          title: Text('البرنامج اليومي',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: readexFont,
            )
            ,
          ),
        ),
        body: SingleChildScrollView(

          child: Center(
              child: FutureBuilder(
                future: programController.getProgram(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.data == null) {
                    return  Align(
                      alignment: Alignment.center,
                      child: Center(
                            child: CircularProgressIndicator(
                              color: primaryColor,

                          )),
                    );
                  } else {
                    return Column(

                        children: <Widget>
                        [
                          CustomTable(day: "الأحد",
                            firstCourse: snapshot.data[0].course,
                            secondCourse: snapshot.data[1].course,
                            thirdCourse: snapshot.data[2].course,
                            fourthCourse: snapshot.data[3].course,
                            fifthCourse: snapshot.data[4].course,
                            sixthCourse: snapshot.data[5].course,),
                          CustomTable(day: "الاثنين",
                            firstCourse: snapshot.data[6].course,
                            secondCourse: snapshot.data[7].course,
                            thirdCourse: snapshot.data[8].course,
                            fourthCourse: snapshot.data[9].course,
                            fifthCourse: snapshot.data[10].course,
                            sixthCourse: snapshot.data[11].course,),
                          CustomTable(day: "الثلاثاء",
                            firstCourse: snapshot.data[12].course,
                            secondCourse: snapshot.data[13].course,
                            thirdCourse: snapshot.data[14].course,
                            fourthCourse: snapshot.data[15].course,
                            fifthCourse: snapshot.data[16].course,
                            sixthCourse: snapshot.data[17].course,),
                          CustomTable(day: "الاربعاء",
                            firstCourse: snapshot.data[18].course,
                            secondCourse: snapshot.data[19].course,
                            thirdCourse: snapshot.data[20].course,
                            fourthCourse: snapshot.data[21].course,
                            fifthCourse: snapshot.data[22].course,
                            sixthCourse: snapshot.data[23].course,),
                          CustomTable(day: "الخميس",
                            firstCourse: snapshot.data[24].course,
                            secondCourse: snapshot.data[25].course,
                            thirdCourse: snapshot.data[26].course,
                            fourthCourse: snapshot.data[27].course,
                            fifthCourse: snapshot.data[28].course,
                            sixthCourse: snapshot.data[29].course,),

                        ]

                    );
                  }
                }
              )
          ),
        ));

  }
}
