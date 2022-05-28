import 'package:agora_rtm/agora_rtm.dart';
import 'package:flutter/services.dart';
import 'package:flutter_arc_speed_dial/flutter_speed_dial_menu_button.dart';
import 'package:flutter_arc_speed_dial/main_menu_floating_action_button.dart';
import 'package:schoolcrm/constans/app_bar_style.dart';
import 'package:schoolcrm/constans/colors.dart';
import 'package:schoolcrm/constans/time.dart';
import 'package:schoolcrm/models/logs.dart';
import 'package:schoolcrm/screens/home/componants/absences.dart';
import 'package:schoolcrm/screens/home/componants/financial_fees.dart';
import 'package:schoolcrm/screens/home/componants/my_floating_action_button.dart';
import 'package:schoolcrm/screens/home/drawer/drawer.dart';
import 'package:schoolcrm/screens/chat_group/message.dart';
import 'package:flutter/material.dart';
import 'package:schoolcrm/models/message_model.dart';
import 'package:speed_dial_fab/speed_dial_fab.dart';
import 'package:decorative_app_bar/decorative_app_bar.dart';

class Home extends StatefulWidget {
  String userid;

  Home({this.userid});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  AgoraRtmClient _client;
  AgoraRtmChannel _channel;
  ObjectLogController _logController = ObjectLogController();
  LogController _oldLog = LogController();
  String appId = "bb63209254774326bc95604ee1057f2e";

  @override
  void initState() {
    super.initState();
    createClient();
  }

  final Shader linearGradient = LinearGradient(
    colors: <Color>[Colors.white, Color(0xffffccbc)],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));
  bool _isShowDial = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(
        backgroundColor: Colors.transparent,
        child: ManagerDrawer(),
      ),
      appBar: AppBar(
        systemOverlayStyle: systemOverlayStyle,
        shape: shape,
        backgroundColor: primaryColor,
        shadowColor:primaryColor,
      ),


      body: SingleChildScrollView(
        child: Column(
          children: [
            AbsencesContainer(),
          ],

        ),
      ),
      floatingActionButton: MyFloatingActionButton(login: login,context: context,),

    );
  }

  void createClient() async {
    _client = await AgoraRtmClient.createInstance(appId);
    _client.onMessageReceived = (AgoraRtmMessage message, String peerId) {
      _logController.addLog(MessageModel(
          message: message.text,
          userId: peerId,
          time: Time().getCurrentTime()));
    };
  }

  void login(BuildContext context) async {
    String userId = widget.userid;
    try {
      await _client.login(null, userId);
      joinChannel(context);
    } catch (errorCode) {
      print('Login error: ' + errorCode.toString());
    }
  }

  void joinChannel(BuildContext context) async {
    try {
      _channel = await createChannel("School");
      await _channel.join();

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => MessageScreen(
                    client: _client,
                    channel: _channel,
                    userId: widget.userid,
                    logController: _oldLog,
                    objectLogController: _logController,
                  )));
    } catch (errorCode) {
      print('Join channel error: ' + errorCode.toString());
    }
  }

  Future<AgoraRtmChannel> createChannel(String name) async {
    AgoraRtmChannel channel = await _client.createChannel(name);

    channel.onMessageReceived =
        (AgoraRtmMessage message, AgoraRtmMember member) {
      _logController.addLog(MessageModel(
          message: message.text,
          userId: member.userId,
          time: Time().getCurrentTime()));
    };
    return channel;
  }

/*
  Future<bool> isOnline() async {
    Map<dynamic, dynamic> result =
        await _client.queryPeersOnlineStatus([widget.userid]);

    if(result.toString() == "true") {
      print(result.toString());
      return true;
    }
    else
    {
      print(result.toString());
      return false;
    }



  }*/

/*  FloatingActionButton(
  child: Icon(Icons.message),
  onPressed: ()
  {

  login(context);
  },*/
/**/

}
