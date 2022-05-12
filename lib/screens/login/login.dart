import 'package:schoolcrm/screens/home/home.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {

  TextEditingController useridController = TextEditingController();
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign in'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            TextField(
                controller: useridController,
                decoration: InputDecoration(hintText: 'User ID')),
           
            OutlinedButton(
                child: Text('Login'), onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) =>
                Home(userid: useridController.text,)
            ))),
          ],
        ),
      ),
    );

  }
}
