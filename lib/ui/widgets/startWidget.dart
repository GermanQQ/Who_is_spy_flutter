import 'package:flutter/material.dart';
import 'package:who_is_spy_flutter/ui/screans/startGameScrean.dart';
import 'package:who_is_spy_flutter/untils/untils.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StartWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: height * 0.13,
          ),
          Container(
            width: width * 0.8,
            height: height * 0.44,
            child: SvgPicture.asset(
              "assets/images/spy.svg",
            ),
          ),
          SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => TimerScrean()));
            },
            style: textButton(),
            child: Container(
                width: width,
                height: height * 0.065,
                child: Center(
                    child: Text(
                  'Старт',
                  style: buttonTextStyle(context),
                ))),
          ),
        ],
      ),
    );
  }
}
