import 'package:flutter/material.dart';
import 'package:who_is_spy_flutter/untils/untils.dart';

class TestWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Center(
      child: ElevatedButton(
        onPressed: () {
          // Provider.of<Repository>(context, listen: false).change();
        },
        style: textButton(),
        child: Container(
            width: width,
            height: height * 0.06,
            child: Center(
                child: Text(
              'Stop',
              style: buttonTextStyle(context),
            ))),
      ),
    );
  }
}
