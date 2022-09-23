import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:schoolcrm/api_host.dart';

class ProfileController{

  Future<void> getStudentProfile() async {
    try{
      var data = await http.get(Uri.parse("$api/parents/show/1"));
      if(data.statusCode == 200){
        var jsonData = json.decode(data.body);
        print(jsonData['Students']);
      }
      else{
        print ("error");
      }

    }
    catch(exp){print("The exception is : $exp");}

  }










}