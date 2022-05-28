import 'dart:math';
import 'package:agora_uikit/agora_uikit.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:schoolcrm/constans/app_bar_style.dart';
import 'package:schoolcrm/constans/colors.dart';


const channelName = "school";


class VideoCall extends StatefulWidget {
  @override
  _VideoCallState createState() => _VideoCallState();
}

class _VideoCallState extends State<VideoCall> {
  var  textStyle = TextStyle(fontFamily:"Scheherazade_New" , fontSize: 23,color: Colors.blueGrey.shade800);

  final AgoraClient client = AgoraClient(
    agoraConnectionData: AgoraConnectionData(
      appId: "bb63209254774326bc95604ee1057f2e",
      channelName: "test",
    ),
    enabledPermission: [
      Permission.camera,
      Permission.microphone,
    ],
    agoraEventHandlers: AgoraEventHandlers(

      joinChannelSuccess: (String channel, int uid, int elapsed){
        print("$uid |||||||||||||||||||||||||||||||||||||||||");
      },


    )
  );

  void initAgora() async {
    print("${client.users} +++++++++++++++++++");
    await client.initialize();
    print("${client.users} +++++++++++++++++++");
  }

  @override
  void initState() {
    super.initState();
    initAgora();
  }

  @override
  Widget build(BuildContext context) {
    print("${client.users} +++++++++++++++++++");
    return Scaffold(
      appBar: AppBar(
        title: const Text('مكالمة الفيديو',style: TextStyle(fontFamily:"Aref_Ruqaa" ,fontWeight: FontWeight.bold)),
        centerTitle: true,
        systemOverlayStyle: systemOverlayStyle,
        backgroundColor: primaryColor,
        shadowColor: primaryColor,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Stack(

              children: [
                AgoraVideoViewer(
                    client: client,
                ),
                AgoraVideoButtons(
                  enabledButtons: [
                    BuiltInButtons.toggleMic,
                    BuiltInButtons.callEnd,
                    BuiltInButtons.toggleCamera
                  ],
                    autoHideButtons: true,
                    autoHideButtonTime: 10,
                    client: client)
              ],
            ),
      ),


    );
  }


}