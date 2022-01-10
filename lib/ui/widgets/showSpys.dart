import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:who_is_spy_flutter/data/repository.dart';
import 'package:who_is_spy_flutter/untils/untils.dart';

class ShowSpys extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Repository>(context, listen: true);
    final width = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            'Шпионы',
            style: titleTextStyle(context, fontSize: 24),
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(10),
            width: width,
            child: ListView.builder(
                itemCount: provider.spysIndex.length,
                itemBuilder: (BuildContext context, int i) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      decoration: BoxDecoration(color: Colors.white70, borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(CustomIco.spy),
                          SizedBox(width: 6),
                          Text(
                            'Игрок ' + (provider.spysIndex[i] + 1).toString(),
                            style: titleTextStyle(context),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ),
      ],
    );
  }
}
