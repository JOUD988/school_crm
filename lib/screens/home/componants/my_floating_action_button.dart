
import 'package:flutter/material.dart';
import 'package:schoolcrm/screens/video_call/video_call.dart';
import 'package:speed_dial_fab/speed_dial_fab.dart';

import '../home.dart';

class MyFloatingActionButton extends StatelessWidget {

  final Function login;
  final BuildContext context;


  MyFloatingActionButton({this.login,this.context});

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
            () => {login(context)},
            () => {Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  VideoCall())),
        },
      ],
      secondaryBackgroundColor: Colors.lightGreen,
      secondaryForegroundColor: Colors.white,
      primaryBackgroundColor: Colors.lightGreen,
      primaryForegroundColor: Colors.white,
    );

  }
}






