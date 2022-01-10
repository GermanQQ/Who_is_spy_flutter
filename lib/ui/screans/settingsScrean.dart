import 'package:flutter/material.dart';
import 'package:who_is_spy_flutter/ui/widgets/widgets.dart';
import 'package:who_is_spy_flutter/untils/untils.dart';

class SettingsScrean extends StatelessWidget {
  const SettingsScrean({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultPage(
      body: SettingsWidget(),
      title: Text(
        'Настройки',
        style: titleTextStyle(context),
      ),
      isBack: true,
    );
  }
}
