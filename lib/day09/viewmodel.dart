import 'package:flutter/material.dart';

class KSJContentViewModel with ChangeNotifier{
  int _counter = 0;

  // ignore: unnecessary_getters_setters
  int get counter => _counter;

  // ignore: unnecessary_getters_setters
  set counter(int value) {
    _counter = value;
    notifyListeners();
  }
}