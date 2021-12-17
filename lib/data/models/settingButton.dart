import 'package:flutter/material.dart';
import 'package:who_is_spy_flutter/data/repository.dart';

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
      return SettingButtonModel(title: 'Spy count', count: provider.spyQty, icon: Icons.spa, type: type);
    case SettingButtonEmun.players:
      return SettingButtonModel(title: 'Players', count: provider.players, icon: Icons.people_alt_outlined, type: type);
    case SettingButtonEmun.timer:
      return SettingButtonModel(title: 'Minutes', count: provider.minutes, icon: Icons.timer, type: type);
    case SettingButtonEmun.location:
      return SettingButtonModel(title: 'Locations', icon: Icons.gps_fixed, type: type);
    default:
      return SettingButtonModel(title: 'no', icon: Icons.ac_unit, type: type);
  }
}
