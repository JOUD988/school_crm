import 'dart:convert';

import 'package:http/http.dart'as http;
import 'package:schoolcrm/api_host.dart';


class FinancialFeesController{


  Future<void> getFinancialFees() async {
    try{
      var data = await http.get(Uri.parse("$api/fees/parents/show/1"));
      if(data.statusCode == 200){
        var jsonData = json.decode(data.body);
        print(jsonData['Parent'][0]);
      }
      else{
        print ("error");
      }

    }
    catch(exp){print(exp);}

  }








}