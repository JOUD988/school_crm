import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:schoolcrm/model/program_model.dart';

class ProgramController {
  String baseUrl =
      "https://api.json-generator.com/templates/5LmczRB_HPvS/data?access_token=5to13khbnyhhldip0loy8xy2vm2aoq5ezl6pfv8o";

  Future<List<ProgramModel>> getProgram() async {
    try {
      var data = await http.get(Uri.parse(baseUrl));

      if (data.statusCode == 200) {
        var jsonData = json.decode(data.body);
        List<ProgramModel> programList = [];

        for (var obj in jsonData) {
          ProgramModel progObj = ProgramModel(
            course: obj['course'],
            period: obj['period'],
          );
          programList.add(progObj);
        }
        return programList;
      }
    } catch (exception) {
      print(exception);
    }
  }
}
