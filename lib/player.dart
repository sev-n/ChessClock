import 'package:flutter/material.dart';

class Player extends ChangeNotifier{
  late bool isClicked;
  int time = 60;

  int getTime() => time;

  // if clicked so the time of will pause
  bool getifClicked() => isClicked;

  void updateTime(){
    time--;
    notifyListeners();
  }

}