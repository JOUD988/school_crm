import 'package:flutter/material.dart';
import 'package:schoolcrm/view/components/box_decoration.dart';
import 'package:schoolcrm/view/consatans/colors.dart';


class FinancialFees extends StatelessWidget {

  final int paidAmount;
  final int unpaidAmount;
  const  FinancialFees({this.paidAmount,this.unpaidAmount});



  @override
  Widget build(BuildContext context) {
    final  textStyle = TextStyle(fontFamily:"Scheherazade_New" , fontSize: 23,color: Colors.blueGrey.shade800);

    return Container(
      height: MediaQuery.of(context).size.height * 0.18,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.all(20),
      decoration: myBoxDecoration,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("ل.س", style: textStyle,),
                Container(
                  padding: EdgeInsets.all(2),

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(style: BorderStyle.solid, color: primaryColor, width: 1),
                    color: Colors.white70,

                  ),
                  child: Text(paidAmount.toString(),
                      style: textStyle),
                ),
                Text(": المبلغ المدفوع",style: textStyle)

              ],
            ),
          ),
          Container(

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("ل.س",style: textStyle,),
                Container(
                  padding: EdgeInsets.all(2),

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(style: BorderStyle.solid, color: primaryColor, width: 1),
                    color: Colors.white70,

                  ),
                  child: Text(unpaidAmount.toString(),
                      style: textStyle),
                ),
                Text(": المبلغ المتبقي",style: textStyle)

              ],
            ),
          ),
        ],
      ),
    );
  }
}
