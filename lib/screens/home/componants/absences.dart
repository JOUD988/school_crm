import 'package:flutter/material.dart';
import 'package:schoolcrm/constans/box_decoration.dart';
import 'package:pie_chart/pie_chart.dart';



class AbsencesContainer extends StatelessWidget {

 /* final String studentName;
  final int numberOfAbsences;
  const AbsencesContainer({this.studentName,this.numberOfAbsences});
*/
  final dataMap = <String, double>
  {

    "عدد الغيابات": 5,

    "المتبقي": 10,


  };

  final colorList = <Color>[
    Colors.redAccent,
    Colors.green
  ];




  @override
  Widget build(BuildContext context) {
    final  textStyle = TextStyle(fontFamily:"Scheherazade_New" , fontSize: 30,color: Colors.blueGrey.shade800);
    return  Container(
        height: MediaQuery.of(context).size.height * 0.18,
        width: MediaQuery.of(context).size.width ,
        margin: EdgeInsets.all(20),
        decoration: myBoxDecoration,

        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 50,vertical: 10),

          child: PieChart(

            centerText: "15",
            dataMap: dataMap,
            chartType: ChartType.ring,
            baseChartColor: Colors.transparent,
            colorList: colorList,
            centerTextStyle: TextStyle(
                fontSize: 20,
                    color: Colors.lightGreen.shade800,
              fontWeight: FontWeight.bold
            ),
            chartValuesOptions: ChartValuesOptions(
              showChartValuesInPercentage: false,
              decimalPlaces: 0,

            ),
            totalValue: 15,
          ),
        ),




    );

  }
}
/*

Column(
mainAxisAlignment: MainAxisAlignment.center,
children: [
Row(
mainAxisAlignment: MainAxisAlignment.center,
children: [
Text(studentName,style: textStyle,),
Text("غيابات الطالب",style: textStyle,),
],
),
SizedBox(height: 20,),
Row(
mainAxisAlignment: MainAxisAlignment.center,
children: [
Text("غياب", style: textStyle ),
SizedBox(width: 20,),
Text("15", style: textStyle),
SizedBox(width: 2,),
Text("/", style: textStyle),
SizedBox(width: 2,),
Text(numberOfAbsences.toString(),style: textStyle,)
],
),
],

),*/