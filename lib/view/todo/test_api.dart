
import 'dart:convert';

import 'package:http/http.dart' as http;

class TestApi{

String baseUrl = "https://jsonplaceholder.typicode.com/users";

Future<List> getAllUsers () async{

  try
      {
        var response = await http.get(Uri.parse(baseUrl));
        if(response.statusCode == 200)
          {
       /*     var jsonResponse = convert.jsonDecode(response.body);
            var itemCount = jsonResponse['totalItems'];
            print('Number of books about http: $itemCount.');*/

            return jsonDecode(response.body);
          }
        else {
          return Future.error("server error");
        }

      }
      catch(exp)
      {
        return Future.error(exp);
      }




}








}