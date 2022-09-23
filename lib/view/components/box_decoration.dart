import 'package:flutter/material.dart';
import 'package:schoolcrm/view/consatans/colors.dart';

var myBoxDecoration = BoxDecoration(
  boxShadow: [
    BoxShadow(
      blurRadius: 10.0,
      color: primaryColor
    ),
  ],
  borderRadius: BorderRadius.circular(20),
  color: secondaryColor,
  border: Border.all(style: BorderStyle.solid, color: primaryColor, width: 2),
);
