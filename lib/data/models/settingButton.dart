import 'package:flutter/material.dart';
import 'package:who_is_spy_flutter/data/repository.dart';
import 'package:who_is_spy_flutter/untils/untils.dart';

enum SettingButtonEmun { spy, players, timer, location }

class SettingButtonModel {
  String title;
  int? count;
  final icon;
  SettingButtonEmun type;

  SettingButtonModel({required this.title, this.count, required this.icon, required this.type});
}

SettingButtonModel getSettingButtom(SettingButtonEmun type, Repository provider) {
  switch (type) {
    case SettingButtonEmun.spy:
      return SettingButtonModel(title: 'Количество шпионов', count: provider.spyQty, icon: CustomIco.spy, type: type);
    case SettingButtonEmun.players:
      return SettingButtonModel(
          title: 'Количество игроков', count: provider.players, icon: Icons.people_alt_outlined, type: type);
    case SettingButtonEmun.timer:
      return SettingButtonModel(title: 'Длительность игры', count: provider.minutes, icon: Icons.timer, type: type);
    case SettingButtonEmun.location:
      return SettingButtonModel(title: 'Локации', icon: Icons.gps_fixed, type: type);
    default:
      return SettingButtonModel(title: 'no', icon: Icons.ac_unit, type: type);
  }
}
