import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:schoolcrm/api_host.dart';
import 'package:schoolcrm/model/student.dart';

class StudentController {



  Future<List<Student>> getChildrenByParentId(int id) async {
    try {
      var data =
          await http.get(Uri.parse("$api/parents/show/${id.toString()}"));
      if (data.statusCode == 200) {
        var jsonData = json.decode(data.body);
        var theChildren = jsonData['Students'];

        List<Student> students = [];

        for (var object in theChildren) {
          Student student = Student(
              id: object['id'],
              firstName: object['first_name'],
              lastName: object['last_name'],
              sectionId: object['section_id'],
              busSubscribe: object['bus_subscribe']);
          students.add(student);
        }

        return students;

      } else {
        print("error");
      }
    } catch (exp) {
      print("The exception is : $exp");
    }
  }

  Future<int> getNumberOfChildrenByParentId(int id) async {
    try {
      var data =
      await http.get(Uri.parse("$api/parents/show/${id.toString()}"));
      if (data.statusCode == 200) {
        var jsonData = json.decode(data.body);
        var theChildren = jsonData['Students'];
       var length =  (theChildren as List<dynamic>).length;

          return length;

      } else {
        print("error");
        return 0;
      }
    } catch (exp) {
      print("The exception is : $exp");
      return 0;

    }
  }



  Future<void> tester() async {
    try {
      var data =
      await http.get(Uri.parse("$api/absences/show/2"));
      if (data.statusCode == 200) {
        var jsonData = json.decode(data.body);

        print(jsonData);


      } else {
        print("error");
      }
    } catch (exp) {
      print("The exception is : $exp");

    }
  }





}
