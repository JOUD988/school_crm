import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


var systemOverlayStyle = SystemUiOverlayStyle(
statusBarColor: Colors.lightGreen,
statusBarIconBrightness: Brightness.light, // For Android (dark icons)
statusBarBrightness: Brightness.light, // For iOS (dark icons)
);

var shape = ContinuousRectangleBorder(
borderRadius: BorderRadius.only(
bottomLeft: Radius.circular(30),
bottomRight: Radius.circular(30)));