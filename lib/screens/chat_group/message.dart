import 'package:agora_rtm/agora_rtm.dart';
import 'package:schoolcrm/constans/app_bar_style.dart';
import 'package:schoolcrm/constans/colors.dart';
import 'package:schoolcrm/constans/time.dart';
import 'package:schoolcrm/models/logs.dart';
import 'package:schoolcrm/models/message_model.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:intl/intl.dart';
import 'package:schoolcrm/screens/chat_group/custom_ui/emoji_keyboard.dart';
import 'package:schoolcrm/screens/chat_group/custom_ui/own_message_card.dart';
import 'package:schoolcrm/screens/chat_group/custom_ui/reply_card.dart';

class MessageScreen extends StatefulWidget {
  final AgoraRtmClient client;
  final AgoraRtmChannel channel;
  final ObjectLogController objectLogController;
  final LogController logController;
  final String userId;

  MessageScreen({
    this.client,
    this.channel,
    this.logController,
    this.objectLogController,
    this.userId,
  });

  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  final _peerUserId = TextEditingController();
  final _peerMessage = TextEditingController();
  TextEditingController _channelMessageController = TextEditingController();
  bool emojiPickerIsShowed = false;
  FocusNode focusNode = FocusNode();
  ScrollController scrollController = ScrollController();

  scrollToBottom() {
    scrollController.addListener(() {
      scrollController.jumpTo(scrollController.position.maxScrollExtent);
    });
  }

  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setState(() {
          emojiPickerIsShowed = false;
        });
      }
    });
  }

  void _isUserOnline() async {
    if (_peerUserId.text.isEmpty) {
      widget.logController.addLog('Please input peer user id to query.');
      return;
    }
    try {
      Map<dynamic, dynamic> result =
          await widget.client.queryPeersOnlineStatus([_peerUserId.text]);

      widget.logController.addLog('Query result: ' + result.toString());
    } catch (errorCode) {
      widget.logController.addLog('Query error: ' + errorCode.toString());
    }
  }

  void _sendPeerMessage() async {
    if (_peerUserId.text.isEmpty) {
      widget.logController.addLog('Please input peer user id to send message.');
      return;
    }
    if (_peerMessage.text.isEmpty) {
      widget.logController.addLog('Please input text to send.');
      return;
    }

    try {
      AgoraRtmMessage message = AgoraRtmMessage.fromText(_peerMessage.text);
      await widget.client.sendMessageToPeer(_peerUserId.text, message, false);
      widget.logController.addLog('Send peer message success.');
    } catch (errorCode) {
      widget.logController
          .addLog('Send peer message error: ' + errorCode.toString());
    }
  }

  void _sendChannelMessage() async {
    if (_channelMessageController.text.isEmpty) {
      widget.logController.addLog('Please input text to send.');
      print('Please input text to send.');
      return;
    }
    try {
      await widget.channel.sendMessage(
          AgoraRtmMessage.fromText(_channelMessageController.text));
      //
      widget.logController.addLog(
          '${_channelMessageController.text} Send channel message success.');
      //
      widget.objectLogController.addLog(MessageModel(
          message: _channelMessageController.text,
          userId: widget.userId,
          time: Time().getCurrentTime()));
      //

    } catch (errorCode) {
      widget.logController
          .addLog('Send channel message error: ' + errorCode.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: primaryColor,
        title: Text("غرفة المحادثة",style: TextStyle(fontFamily: "Readex_Pro"),),
          systemOverlayStyle:systemOverlayStyle,
          shape: shape,
        leading: BackButton(
          onPressed: () {
            widget.client.logout();
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        child: WillPopScope(
          child: Stack(
            children: [
              Container(
                //background in all screen
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  "assets/images/whats_app_background _image.png",
                  fit: BoxFit.fill,
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.8,
                  child: ValueListenableBuilder(
                      valueListenable: widget.objectLogController,
                      builder: (context, log, child) {
                        return ListView.builder(
                            // controller: scrollController,
                            itemCount: log.length,
                            itemBuilder: (context, index) {
                              if (index == log.length) {
                                return Container(
                                  height: 70,
                                );
                              }
                              if (log[(log.length - 1) - index].userId ==
                                  widget.userId) {
                                return OwnMessageCard(
                                    message:
                                        log[(log.length - 1) - index].message,
                                    time: log[(log.length - 1) - index].time);
                              } else {
                                return ReplyCard(
                                  message:
                                      log[(log.length - 1) - index].message,
                                  time: log[(log.length - 1) - index].time,
                                  userId: log[(log.length - 1) - index].userId,
                                );
                              }
                            });
                      }),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child:
                    Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                  Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width - 55,
                        height: MediaQuery.of(context).size.height * 0.08,
                        //Text take 8% of screen
                        child: Card(
                            margin:
                                EdgeInsets.only(left: 10, right: 5, bottom: 20),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: TextFormField(
                              controller: _channelMessageController,
                              focusNode: focusNode,
                              minLines: 1,
                              maxLines: 5,
                              cursorColor: Colors.grey.shade400,
                              textAlignVertical: TextAlignVertical.center,
                              keyboardType: TextInputType.multiline,
                              enableSuggestions: false,
                              autocorrect: false,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Message",
                                contentPadding: EdgeInsets.all(5),
                                prefixIcon: IconButton(
                                  onPressed: () {
                                    focusNode.unfocus();
                                    focusNode.canRequestFocus = false;
                                    setState(() {
                                      emojiPickerIsShowed =
                                          !emojiPickerIsShowed;
                                    });
                                  },
                                  icon: Icon(
                                    Icons.emoji_emotions_outlined,
                                    color: primaryColor,
                                  ),
                                ),
                              ),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: CircleAvatar(
                          backgroundColor: primaryColor,
                          child: IconButton(
                            icon: Icon(Icons.send, color: Colors.white),
                            onPressed: () async {
                              await _sendChannelMessage();
                              _channelMessageController.clear();
                              scrollToBottom();
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                  emojiPickerIsShowed
                      ? Container(
                          height: 280,
                          child: EmojiPad(
                            controller: _channelMessageController,
                          ),
                        )
                      : Container(),
                  // emojiSelect(),
                ]),
              ),
            ],
          ),
          onWillPop: () {
            if (emojiPickerIsShowed) {
              setState(() {
                emojiPickerIsShowed = !emojiPickerIsShowed;
              });
            } else {
              Navigator.pop(context);
            }
            return Future.value(false);
          },
        ),
      ),
    );
  }
}
