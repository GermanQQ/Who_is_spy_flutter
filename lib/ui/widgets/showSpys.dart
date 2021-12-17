import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:who_is_spy_flutter/data/repository.dart';
import 'package:who_is_spy_flutter/untils/untils.dart';

class ShowSpys extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Repository>(context, listen: true);

    final height = MediaQuery.of(context).size.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            'Spys',
            style: titleTextStyle(context, fontSize: 24),
            textAlign: TextAlign.right,
          ),
        ),
        Container(
          width: 130,
          height: 400,
          child: ListView.builder(
              itemCount: provider.spysIndex.length,
              itemBuilder: (BuildContext context, int i) {
                return Text(
                  'Player ' + (provider.spysIndex[i] + 1).toString(),
                  style: titleTextStyle(context, color: Colors.black),
                );
              }),
        ),
      ],
    );
  }
}
