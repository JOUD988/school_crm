import 'package:flutter/material.dart';
import 'package:schoolcrm/constans/fonts.dart';
import 'package:url_launcher/url_launcher.dart';


_launchCaller() async {
  const url = "tel:0112216753";
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

var callSchoolButton = Container(
  height: 50,
  margin:
  const EdgeInsets.symmetric(horizontal: 50),
  decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(50),
      color: Colors.red.shade400),
  child: TextButton(
    onPressed: () {
      _launchCaller();
    },
    child: Row(
      mainAxisAlignment:
      MainAxisAlignment.spaceEvenly,
      children: [
        Icon(
          Icons.call,
          color: Colors.white,
        ),
        Text(
          "الاتصال بالمدرسة",
          style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontFamily: readexFont),
        ),
      ],
    ),
  ),
);