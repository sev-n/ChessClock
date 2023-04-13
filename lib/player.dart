import 'dart:async';

import 'package:flutter/foundation.dart';

Timer? timer;

class Player extends ChangeNotifier {
  bool isClicked = true;
  int time;

  bool timeActive = false;

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

  void clockStart(var player) {
    //var p1 = Provider.of<PlayerOne>(context, listen: false);
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
  PlayerOne() : super(70);
}

class PlayerTwo extends Player {
  PlayerTwo() : super(120);
}
