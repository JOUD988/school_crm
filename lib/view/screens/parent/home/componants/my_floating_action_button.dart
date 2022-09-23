
import 'package:flutter/material.dart';
import 'package:schoolcrm/view/consatans/colors.dart';
import 'package:schoolcrm/view/screens/common/video_call/video_call.dart';
import 'package:speed_dial_fab/speed_dial_fab.dart';

import '../home.dart';

class MyFloatingActionButton extends StatelessWidget {

  final Function(BuildContext) login;

  //final BuildContext context;


  MyFloatingActionButton({this.login});

  @override
  Widget build(BuildContext context) {


    return SpeedDialFabWidget(
      secondaryIconsList: [
        Icons.message,
        Icons.video_call,
      ],
      secondaryIconsText: [
        "message",
        "video_call",
      ],
      secondaryIconsOnPress: [
            () => {
        login(context),
            },
            () => {Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  VideoCall())),
        },
      ],
      secondaryBackgroundColor: primaryColor,
      secondaryForegroundColor: Colors.white,
      primaryBackgroundColor: primaryColor,
      primaryForegroundColor: Colors.white,
    );

  }
}






