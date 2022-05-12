import 'package:agora_rtm/agora_rtm.dart';
import 'package:schoolcrm/constans/time.dart';
import 'package:schoolcrm/models/logs.dart';
import 'package:schoolcrm/screens/home/drawer/drawer.dart';
import 'package:schoolcrm/screens/chat_group/message.dart';
import 'package:flutter/material.dart';
import 'package:schoolcrm/models/message_model.dart';

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
  String appId = "fe0d787be661401fa2b97228ce0f9c56";

  @override
  void initState() {
    super.initState();
    createClient();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.transparent,
        child:  ManagerDrawer(),
      ),
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.message),
        onPressed: ()
        {

          login(context);
        },
      ),
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
                  )
          )
      );

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
}
