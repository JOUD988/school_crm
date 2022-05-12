import 'package:intl/intl.dart';

class Time {

  String getCurrentTime(){
    return DateFormat('hh:mm').format(DateTime.now());
  }


}