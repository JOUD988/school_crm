import 'package:flutter/material.dart';
import 'package:schoolcrm/constans/app_bar_style.dart';
import 'package:schoolcrm/constans/colors.dart';
import 'package:schoolcrm/constans/fonts.dart';
import 'package:schoolcrm/constans/program_text_style.dart';
import 'package:schoolcrm/screens/programs/componants/custom_table.dart';
class StudentsProgram extends StatefulWidget {

  @override
  State<StudentsProgram> createState() => _StudentsProgramState();
}

class _StudentsProgramState extends State<StudentsProgram> {

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          shape: shape,
          systemOverlayStyle: systemOverlayStyle,
          centerTitle: true,
          title: Text('الصف السادس',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: readexFont,
            )
            ,
          ),
        ),
        body: SingleChildScrollView(

          child: Center(
              child: Column(children: <Widget>
              [
                CustomTable(day: "الأحد",firstCourse: "",secondCourse: "",thirdCourse: "",fourthCourse: "",fifthCourse: "",sixthCourse: "",),
                CustomTable(day: "الاثنين",firstCourse: "",secondCourse: "",thirdCourse: "",fourthCourse: "",fifthCourse: "",sixthCourse: "",),
                CustomTable(day: "الثلاثاء",firstCourse: "",secondCourse: "",thirdCourse: "",fourthCourse: "",fifthCourse: "",sixthCourse: "",),
                CustomTable(day: "الاربعاء",firstCourse: "",secondCourse: "",thirdCourse: "",fourthCourse: "",fifthCourse: "",sixthCourse: "",),
                CustomTable(day: "الخميس",firstCourse: "",secondCourse: "",thirdCourse: "",fourthCourse: "",fifthCourse: "",sixthCourse: "",),

              ])
          ),
        ));

  }
}
