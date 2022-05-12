import 'package:schoolcrm/models/message_model.dart';
import 'package:flutter/material.dart';

class LogController extends ValueNotifier<List<String>> {
  LogController() : super([]);

  void addLog(String log) {
    value = [log, ...value];
  }
}

class ObjectLogController extends ValueNotifier<List<MessageModel>> {
  ObjectLogController() : super([]);

  void addLog(MessageModel messageModel) {
    value = [messageModel,...value];
  }

  List<MessageModel> getLog(){
    return value;
  }

}