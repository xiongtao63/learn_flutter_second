import 'package:flutter/material.dart';

class CountNotifier1 with ChangeNotifier {

  int count = 0;

  void increment() {
    count++;
    print("============");
    notifyListeners();
  }
}

class UserModel6 with ChangeNotifier {

  String name = "Jimi";
  int age = 18;
  String phone = "18888888888";


  void increaseAge() {
    age++;
    notifyListeners();
  }
}


class CountNotifier2 with ChangeNotifier {

  int count = 0;

  void increment() {
    count++;
    print("============");
    notifyListeners();
  }
}