import 'package:flutter/cupertino.dart';

class Auth extends ChangeNotifier {
  bool _authenticated = false;

  bool get authenticated => _authenticated;
  String userName ;
  String role;

  void login({Map credentials}) {
    _authenticated = true;
    role = "2";
    notifyListeners();
  }

  void setName(String userName) {
    this.userName = userName;
  }

  String getName() {
    return userName;
  }

  String getRole(String email) {
    if (email == "parent@gmail.com") {
      setName("Joud");
      notifyListeners();
      return "parent";

    }
    else if (email == "parent1@gmail.com") {
      setName("Hanady");
      notifyListeners();

      return "parent";
    }

    else if (email == "parent2@gmail.com") {
      setName("Ruba");
      notifyListeners();

      return "parent";
    }

    else if (email == "driver@gmail.com") {
      setName("أحمد ياسر");
      notifyListeners();
      return "driver";
    }
    else if (email == "counselor@gmail.com") {
      setName("Management");
      notifyListeners();
      return "counselor";
    }
  }
}
