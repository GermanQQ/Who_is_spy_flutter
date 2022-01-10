import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:who_is_spy_flutter/data/models/models.dart';

class Repository with ChangeNotifier {
  List<RullesData> rulesList;
  List<String> locations;
  Repository({required this.rulesList, required this.locations});

  String randomLocation = '';
  int players = 3;
  int spyQty = 1;
  int minutes = 3;
  List<int> spysIndex = [];
  bool gameStarted = false;
  bool gameOver = false;
  bool flipCart = false;
  Timer? timer;
  TimerModel? timerData;

  void changeSettingQty(SettingButtonEmun buttonPressed, int number) {
    switch (buttonPressed) {
      case SettingButtonEmun.spy:
        spyQty = number;
        break;
      case SettingButtonEmun.players:
        players = number;
        break;
      case SettingButtonEmun.timer:
        minutes = number;
        break;
      default:
    }
    update();
  }

  void startGame() {
    _getRandomSpy();
    _getRandomLocation();
  }

  void _getRandomSpy() {
    spysIndex.clear();
    for (int i = 0; i < spyQty; i++) {
      int randomSpy = Random().nextInt(players);
      while (spysIndex.contains(randomSpy)) {
        randomSpy = Random().nextInt(players);
      }
      spysIndex.add(randomSpy);
    }
  }

  void _getRandomLocation() {
    final randomIndex = Random().nextInt(locations.length);
    randomLocation = locations.removeAt(randomIndex);
    gameOver = false;
    gameStarted = false;
  }

  List<int> getPlayersList() {
    List<int> res = [];
    for (int i = 0; i < players; i++) {
      res.add(i);
    }
    return res;
  }

  void resetDataGame() {
    gameStarted = false;
    flipCart = false;
    if (timer != null) timer!.cancel();
  }

  void startTimer() {
    timerData = TimerModel(minutes: minutes - 1, seconds: 59);
    timer = Timer.periodic(Duration(seconds: 1), (_) {
      if (timerData!.minutes == 0 && timerData!.seconds == 0) {
        timer!.cancel();
        gameOver = true;
      }

      if (timerData!.seconds == 0) {
        timerData!.seconds = 59;
        timerData!.minutes--;
      } else {
        timerData!.seconds--;
      }
      update();
    });
  }

  void update() => notifyListeners();
}
