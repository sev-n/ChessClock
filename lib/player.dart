import 'dart:async';

import 'package:flutter/foundation.dart';

Timer? timer;

class Player extends ChangeNotifier {
  int time;
  bool timeActive = false;
  bool touch = true;

  Player(this.time);

  void enabledTouch(){
    touch = true;
    notifyListeners();
  }
  void disabledTouch() {
    touch = false;
    notifyListeners();
  }
  int getTime() => time;

  void updateTime() {
    time == 0 ? disabledTouch() : time--;
    notifyListeners();
  }

  void clockStart(var player) {
    player.timeActive = true;
    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      player.updateTime();
    });
    notifyListeners();
  }

  void playerTimePause(){
    timer?.cancel();
    notifyListeners();
  }
}

class PlayerOne extends Player {
  PlayerOne() : super(20);
}

class PlayerTwo extends Player {
  PlayerTwo() : super(20);
}
