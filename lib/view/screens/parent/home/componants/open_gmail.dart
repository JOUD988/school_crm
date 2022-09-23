import 'package:flutter/material.dart';
import 'package:open_mail_app/open_mail_app.dart';


void openGmail(BuildContext context) async
{
  // Android: Will open mail app or show native picker.
  // iOS: Will open mail app if single mail app found.
  var result = await OpenMailApp.openMailApp(
    nativePickerTitle: 'Select email app to open',
  );

  // If no mail apps found, show error
  if (!result.didOpen && !result.canOpen) {
    showNoMailAppsDialog(context);

    // iOS: if multiple mail apps found, show dialog to select.
    // There is no native intent/default app system in iOS so
    // you have to do it yourself.
  } else if (!result.didOpen && result.canOpen) {
    showDialog(
      context: context,
      builder: (_) {
        return MailAppPickerDialog(
          mailApps: result.options,
        );
      },
    );
  }
}


void showNoMailAppsDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("Open Mail App"),
        content: Text("No mail apps installed"),
        actions: <Widget>[
          TextButton(
            child: Text("OK"),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      );
    },
  );
}