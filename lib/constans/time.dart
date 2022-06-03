import 'package:intl/intl.dart';

class Time {

  String getCurrentTime(){
    return DateFormat('hh:mm').format(DateTime.now());
  }
  String getCurrentDate(){
    return DateFormat('dd-MM-yyyy').format(DateTime.now());
  }


}