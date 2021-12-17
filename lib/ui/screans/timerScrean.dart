import 'package:flutter/material.dart';
import 'package:who_is_spy_flutter/ui/widgets/widgets.dart';
import 'package:who_is_spy_flutter/untils/untils.dart';

class TimerScrean extends StatelessWidget {
  const TimerScrean({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultPage(
      body: StartGameWidget(),
      title: Text(
        'Game started',
        style: titleTextStyle(context),
      ),
      isBack: true,
    );
  }
}
