import 'package:flutter/material.dart';
import 'package:schoolcrm/constans/box_decoration.dart';


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
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.teal.shade200,

            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("ل.س", style: textStyle,),
                Text(paidAmount.toString(),style: textStyle),
                Text(": المبلغ المدفوع",style: textStyle)

              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.teal.shade200,

            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("ل.س",style: textStyle,),
                Text(unpaidAmount.toString(),style: textStyle),
                Text(": المبلغ المتبقي",style: textStyle)

              ],
            ),
          ),
        ],
      ),
    );
  }
}
