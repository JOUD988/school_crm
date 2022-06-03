import 'package:flutter/material.dart';
import 'package:schoolcrm/constans/colors.dart';
import 'package:schoolcrm/constans/program_text_style.dart';

class CustomTable extends StatefulWidget {

  String day;
  String firstCourse;
  String secondCourse;
  String thirdCourse;
  String fourthCourse;
  String fifthCourse;
  String sixthCourse;
CustomTable({this.day,this.firstCourse,this.secondCourse,this.thirdCourse,this.fourthCourse,this.fifthCourse,this.sixthCourse});

  @override
  State<CustomTable> createState() => _CustomTableState();
}

class _CustomTableState extends State<CustomTable> {

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      color: secondaryColorLight,

      margin: EdgeInsets.all(20),


      child: Table(
        defaultColumnWidth: FixedColumnWidth(screenWidth * 0.43),

        border: TableBorder.all(
          color: primaryColor,
          style: BorderStyle.solid,
          width: 2,
          borderRadius: BorderRadius.circular(10),

        ),
        children: [
          TableRow(
              children: [
                Column(children:[Text(widget.day, style: programTextStyle)]),
                Column(children:[Text("المادة", style: programTextStyle)]),

              ]),
          TableRow( children: [
            Column(children:[Text('8:00-8:45',style: programTextStyle,),]),
            Column(children:[Text(widget.firstCourse,style: programTextStyle)]),

          ]),
          TableRow(
              children: [
                Column(children:[Text('8:45-9:30', style: programTextStyle)]),
                Column(children:[Text(widget.secondCourse, style: programTextStyle)]),

              ]),
          TableRow( children: [
            Column(children:[Text('9:45-10:30',style: programTextStyle,),]),
            Column(children:[Text(widget.thirdCourse,style: programTextStyle)]),

          ]),
          TableRow(
              children: [
                Column(children:[Text('10:30-11:15', style: programTextStyle)]),
                Column(children:[Text(widget.fourthCourse, style: programTextStyle)]),

              ]),
          TableRow( children: [
            Column(children:[Text('11:30-12:15',style: programTextStyle,),]),
            Column(children:[Text(widget.fifthCourse,style: programTextStyle)]),

          ]),
          TableRow( children: [
            Column(children:[Text('12:15-1:00',style: programTextStyle,),]),
            Column(children:[Text(widget.sixthCourse,style: programTextStyle)]),

          ]),




        ],
      ),
    );

  }
}
