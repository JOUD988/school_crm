import 'package:agora_rtm/agora_rtm.dart';
import 'package:provider/provider.dart';
import 'package:schoolcrm/constans/app_bar_style.dart';
import 'package:schoolcrm/constans/colors.dart';
import 'package:schoolcrm/constans/fonts.dart';
import 'package:schoolcrm/constans/time.dart';
import 'package:schoolcrm/models/logs.dart';
import 'package:schoolcrm/screens/home/componants/absences.dart';
import 'package:schoolcrm/screens/home/componants/exit_app_dialog.dart';
import 'package:schoolcrm/screens/home/componants/financial_fees.dart';
import 'package:schoolcrm/screens/home/componants/my_floating_action_button.dart';
import 'package:schoolcrm/screens/home/componants/open_gmail.dart';
import 'package:schoolcrm/screens/home/drawer/drawer.dart';
import 'package:schoolcrm/screens/chat_group/message.dart';
import 'package:flutter/material.dart';
import 'package:schoolcrm/models/message_model.dart';
import 'package:schoolcrm/screens/login/auth.dart';
import 'package:schoolcrm/screens/programs/students_program.dart';


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
        title:Row(
          children: [
            Icon(Icons.account_circle),
            SizedBox(width: MediaQuery.of(context).size.width * 0.34,),
            Text(Provider.of<Auth>(context,listen: false).getName(),style: TextStyle(
              fontFamily: readexFont,
              fontWeight: FontWeight.w600,
            ),),
      ],

      ),),



      body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20),
            height: MediaQuery.of(context).size.height,
            color: secondaryColorLight,
            child: Column(
              children: [
                AbsencesContainer(),
                SizedBox(height: 30,),
                FinancialFees(paidAmount:50000000 ,unpaidAmount:50000 ,),
                SizedBox(height: 30,),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(primaryColor)),
                    onPressed:() => openGmail(context),
                    child: Text("صندوق البريد",style: TextStyle(fontFamily: readexFont),)

                )

              ],

            ),
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
