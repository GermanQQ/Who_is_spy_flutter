import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:who_is_spy_flutter/data/repository.dart';
import 'package:who_is_spy_flutter/untils/untils.dart';

class TimerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Repository>(context, listen: true);
    final width = MediaQuery.of(context).size.width;
    int maxSecond = (provider.minutes * 60) - 1;
    int curSecond = (provider.timerData!.minutes * 60) + provider.timerData!.seconds;
    return Container(
      width: width * 0.9,
      height: 350,
      child: Center(
        child: Stack(
          fit: StackFit.expand,
          children: [
            CircularProgressIndicator(
              value: curSecond / maxSecond,
              strokeWidth: 16,
              valueColor: AlwaysStoppedAnimation(Colors.blue),
              backgroundColor: Colors.deepPurple,
            ),
            Center(
              child: Container(
                width: provider.timerData!.minutes < 10 ? width * 0.48 : width * 0.58,
                height: 100,
                child: Text(
                  '${provider.timerData!.minutes}:${provider.timerData!.seconds < 10 ? '0' + provider.timerData!.seconds.toString() : provider.timerData!.seconds}',
                  style: titleTextStyle(context, fontSize: 80),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
