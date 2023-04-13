import 'package:flutter/foundation.dart';

class Player extends ChangeNotifier {
  bool isClicked = false;
  int time;

  Player(this.time);

  int getTime() => time;

  bool getifClicked() => isClicked;

  void toggleClicked() {
    isClicked = !isClicked;
    notifyListeners();
  }

  void updateTime() {
    time == 0 ? time : time--;
    notifyListeners();
  }
}


class PlayerOne extends Player {
  PlayerOne() : super(70);

  bool playerClicked = false;
}

class PlayerTwo extends Player {
  PlayerTwo() : super(120);

  bool playerClicked = false;
}