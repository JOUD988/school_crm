import 'package:flutter/cupertino.dart';

class Auth extends ChangeNotifier{

   bool _authenticated = false;
   bool get authenticated => _authenticated;
   String name = "Joud";
   String role ;

  void login({Map credentials}){

    _authenticated = true;
    role = "2";
    notifyListeners();

  }

  String getName(){
    return name;
  }

   String getRole(String email){
    if(email == "parent@gmail.com")
      return "parent";
    else if(email == "driver@gmail.com")
      return "driver";
    else if (email == "mrshd@gmail.com")
      return "mrshd";
  }

}