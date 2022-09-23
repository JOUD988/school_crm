import 'dart:math';
import 'package:agora_uikit/agora_uikit.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:schoolcrm/view/components/app_bar_style.dart';
import 'package:schoolcrm/view/consatans/colors.dart';
import 'package:schoolcrm/view/consatans/fonts.dart';


const channelName = "school";


class VideoCall extends StatefulWidget {
  @override
  _VideoCallState createState() => _VideoCallState();
}

class _VideoCallState extends State<VideoCall> {

  final AgoraClient client = AgoraClient(
    agoraConnectionData: AgoraConnectionData(
      appId: "bb63209254774326bc95604ee1057f2e",
      channelName: "test",
    ),
    enabledPermission: [
      Permission.camera,
      Permission.microphone,
    ],
    /*agoraEventHandlers: AgoraEventHandlers(
      joinChannelSuccess: (String channel, int uid, int elapsed){
        print("User: $uid is joined");
      },
    )*/
  );

  void _initAgora() async {
    await client.initialize();
  }

  @override
  void initState() {
    super.initState();
    _initAgora();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الاجتماعات',style: TextStyle(fontFamily:readexFont ,fontWeight: FontWeight.bold)),
        centerTitle: true,
        automaticallyImplyLeading: false,
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
                  videoRenderMode: VideoRenderMode.FILL,
                  layoutType: Layout.floating,
                  showNumberOfUsers: true,
                ),
                AgoraVideoButtons(
                  enabledButtons: [
                    BuiltInButtons.toggleMic,
                    BuiltInButtons.callEnd,
                    BuiltInButtons.toggleCamera
                  ],
                    autoHideButtons: true,
                    autoHideButtonTime: 10,
                    client: client
                )
              ],
            ),
      ),


    );
  }


}