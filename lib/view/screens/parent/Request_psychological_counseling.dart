import 'package:flutter/material.dart';
import 'package:schoolcrm/view/components/app_bar_style.dart';
import 'package:schoolcrm/view/consatans/colors.dart';
import 'package:schoolcrm/view/consatans/fonts.dart';

class RequestPsychologicalCounseling extends StatefulWidget {
  @override
  State<RequestPsychologicalCounseling> createState() =>
      _RequestPsychologicalCounselingState();
}

class _RequestPsychologicalCounselingState
    extends State<RequestPsychologicalCounseling> {
  TextEditingController counselingType = TextEditingController();
  TextEditingController theCounseling = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        shape: shape,
        systemOverlayStyle: systemOverlayStyle,
        centerTitle: true,
        title: Text(
          "استشارة نفسية",
          style: TextStyle(fontFamily: readexFont, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(20, 40, 20, 0),
        color: secondaryColorLight,
        child: Column(
          children: [
            Container(
                height: screenHeight * 0.10,
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                      color: primaryColor, // set border color
                      width: 3.0), // set border width
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  // set rounded corner radius
                ),
                child: TextField(
                  textAlign: TextAlign.right,
                  cursorColor: primaryColor,
                  controller: counselingType,
                  decoration: InputDecoration(
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      hintText: " طبية, نفسية, سلوكية ",
                      labelText: "نوع الاستشارة",
                      labelStyle: TextStyle(
                        color: primaryColor,
                        fontSize: 19,
                      )),
                )),
            SizedBox(
              height: screenHeight * 0.05,
            ),
            Container(
                height: screenHeight * 0.30,
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                      color: primaryColor, // set border color
                      width: 3.0), // set border width
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  // set rounded corner radius
                ),
                child: TextField(
                  minLines: 2,
                  maxLines: 5,
                  textAlign: TextAlign.right,
                  cursorColor: primaryColor,
                  controller: theCounseling,
                  decoration: InputDecoration(
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      labelText: "الاستشارة",
                      labelStyle: TextStyle(
                        color: primaryColor,
                        fontSize: 19,
                      )),
                )),
            SizedBox(
              height: screenHeight * 0.05,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('ارسال'),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(primaryColor)),
            ),
          ],
        ),
      ),
    );
  }
}
