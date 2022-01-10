import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:who_is_spy_flutter/data/repository.dart';
import 'package:who_is_spy_flutter/ui/widgets/widgets.dart';
import 'package:who_is_spy_flutter/untils/untils.dart';

class TimerScrean extends StatelessWidget {
  const TimerScrean({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultPage(
      body: StartGameWidget(),
      title: Consumer<Repository>(builder: (context, model, child) {
        return Text(
          model.gameOver ? "Конец игры!" : 'Игра началась!',
          style: titleTextStyle(context),
        );
      }),
      isBack: true,
    );
  }
}
