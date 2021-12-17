import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swipable/flutter_swipable.dart';
import 'package:provider/provider.dart';
import 'package:who_is_spy_flutter/data/repository.dart';
import 'package:who_is_spy_flutter/untils/untils.dart';

class WrapCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final provider = Provider.of<Repository>(context, listen: false);
    List<int> players = provider.getPlayersList().reversed.toList();
    return Container(
      width: width * 0.85,
      height: height * 0.65,
      child: Stack(
        children: List.generate(provider.players, (index) {
          return CardWidget(
            isSpy: provider.spysIndex.contains(index),
            isLast: index == 0,
            currentPlayer: players[index] + 1,
          );
        }),
      ),
    );
  }
}

class CardWidget extends StatelessWidget {
  final bool isSpy;
  final bool isLast;
  final int currentPlayer;
  CardWidget({required this.isSpy, required this.isLast, required this.currentPlayer});

  @override
  Widget build(BuildContext context) {
    return Consumer<Repository>(
      builder: (context, model, child) {
        return Swipable(
          horizontalSwipe: model.flipCart,
          verticalSwipe: model.flipCart,
          onSwipeEnd: (offset, drag) {
            if (isLast) {
              model.gameStarted = true;
              print('StartGame');
              model.startTimer();
            }
            model.flipCart = false;
            model.update();
          },
          child: FlipCard(
            flipOnTouch: !model.flipCart,
            speed: 200,
            onFlipDone: (bool done) {
              model.flipCart = done;
              model.update();
            },
            back: Card(
              color: Colors.indigo,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.white70, width: 1),
                borderRadius: BorderRadius.circular(20),
              ),
              elevation: 5,
              child: Center(
                child: Text(
                  isSpy ? 'You are spy!' : model.randomLocation,
                  style: titleTextStyle(context, color: isSpy ? Colors.red : Colors.white),
                ),
              ),
            ),
            front: Card(
              color: Colors.indigo,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.white70, width: 1),
                borderRadius: BorderRadius.circular(20),
              ),
              elevation: 5,
              child: Center(
                child: Text('Player $currentPlayer',
                    style: titleTextStyle(
                      context,
                    )),
              ),
            ),
          ),
        );
      },
    );
  }
}
