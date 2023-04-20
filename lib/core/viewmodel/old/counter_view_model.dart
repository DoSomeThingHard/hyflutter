import 'package:flutter/material.dart';

// class HYCountViewModel with ChangeNotifier  // 也可以用混入，因为不能多继承
class HYCountViewModel extends ChangeNotifier{
  int? _counter = 100;

  int get counter => _counter ?? 0; // 快捷键 command + n

  set counter(int value) {
    _counter = value;
    notifyListeners();  // 通知所有的监听者
  }
}