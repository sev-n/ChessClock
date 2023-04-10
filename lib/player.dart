import 'package:flutter/material.dart';

class PlayerOne extends ChangeNotifier{
  bool isClicked = false;
  int time = 70;

  int getTime() => time;

  // if clicked so the time of will pause
  bool getifClicked() => isClicked;

  void toggleClicked(){
    isClicked = !isClicked;
    notifyListeners();
  }

  void updateTime(){
    time == 0 ? time : time--; // try this
    notifyListeners();
  }
}

// ** Tryy **
class PlayerTwo extends ChangeNotifier{
  bool isClicked = false;
  int time = 120;

  int getTime() => time;

  // if clicked so the time of will pause
  bool getifClicked() => isClicked;

  void toggleClicked(){
    isClicked = !isClicked;
    notifyListeners();
  }

  void updateTime(){
    time == 0 ? time : time--;
    notifyListeners();
  }
}