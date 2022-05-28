import 'package:flutter/material.dart';
import 'package:schoolcrm/constans/colors.dart';
import 'package:schoolcrm/constans/fonts.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class CustomSlidingUpPanel extends StatelessWidget {

  final String driverName;
  final String driverPhoneNumber;
  CustomSlidingUpPanel({this.driverName,this.driverPhoneNumber});

  Widget _floatingCollapsed(){
    return Container(
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(24.0), topRight: Radius.circular(24.0)),
      ),
      margin: const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 0.0),
      child: Center(
        child: Text(
          "معلومات السائق",
          style: TextStyle(color: Colors.white,
            fontFamily: myFont,
          ),
        ),
      ),
    );
  }

  Widget _floatingPanel(){
    return Container(
      decoration: BoxDecoration(
          color: secondaryColorLight,
          borderRadius: BorderRadius.all(Radius.circular(24.0),),
          border: Border.all(color: primaryColor) ,
          boxShadow: [
            BoxShadow(
              blurRadius: 20.0,
              color: secondaryColor
              ,
            ),
          ]
      ),
      margin: const EdgeInsets.all(24.0),
      child: Container(
        padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(driverName,style: TextStyle(fontSize: 25,fontFamily: myFont,),),
                Text("اسم السائق",style: TextStyle(fontSize: 25,fontFamily: myFont,),),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(driverPhoneNumber,style: TextStyle(fontSize: 25,fontFamily: myFont,),),
                Text("رقم السائق",style: TextStyle(fontSize: 25,fontFamily: myFont,),),
              ],
            ),

          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return SlidingUpPanel(
      maxHeight: 230,
      minHeight: 60,
      renderPanelSheet: false,
      panel: _floatingPanel(),
      collapsed: _floatingCollapsed(),
    );
  }
}
