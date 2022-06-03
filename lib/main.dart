/*import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';*/
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:schoolcrm/screens/bus_tracking/driver_map.dart';
import 'package:schoolcrm/screens/home/home.dart';
import 'package:schoolcrm/screens/justify_absence.dart';
import 'package:schoolcrm/screens/login/auth.dart';
import 'package:schoolcrm/screens/login/login.dart';

import 'package:flutter/material.dart';
import 'package:schoolcrm/screens/login/login.dart';
import 'package:schoolcrm/screens/marks/marks_list.dart';
import 'package:schoolcrm/screens/programs/students_program.dart';
import 'package:schoolcrm/todo/back_botton.dart';
import 'package:schoolcrm/todo/test_api.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    ChangeNotifierProvider(
        create:(_) => Auth(),
      child: MyApp(),
    ),
  );
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Login(),
    );
  }
}