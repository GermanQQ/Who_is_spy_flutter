import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:who_is_spy_flutter/data/repository.dart';
import 'package:who_is_spy_flutter/ui/widgets/widgets.dart';

class StartGameWidget extends StatefulWidget {
  @override
  _StartGameWidgetState createState() => _StartGameWidgetState();
}

class _StartGameWidgetState extends State<StartGameWidget> {
  @override
  void initState() {
    Provider.of<Repository>(context, listen: false).startGame();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Consumer<Repository>(builder: (context, model, child) {
        if (model.gameOver) return ShowSpys();
        return model.gameStarted ? TimerWidget() : WrapCard();
      }),
    );
  }
}
