import 'package:who_is_spy_flutter/data/models/models.dart';
import 'package:who_is_spy_flutter/data/repository.dart';

int getMin(SettingButtonEmun type, Repository repo) {
  int selectSpy = repo.spyQty;
  switch (type) {
    case SettingButtonEmun.players:
      return selectSpy * 3;
    case SettingButtonEmun.spy:
      return 1;
    case SettingButtonEmun.timer:
      return 3;
    default:
      return 0;
  }
}

int getMax(SettingButtonEmun type, Repository repo) {
  int selectPlayers = repo.players;
  switch (type) {
    case SettingButtonEmun.players:
      return 30;
    case SettingButtonEmun.spy:
      return selectPlayers ~/ 3;
    case SettingButtonEmun.timer:
      return 59;
    default:
      return 0;
  }
}
