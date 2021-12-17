import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:who_is_spy_flutter/data/repository.dart';
import 'package:who_is_spy_flutter/ui/screans/settingsScrean.dart';
import 'package:who_is_spy_flutter/ui/widgets/widgets.dart';

class HomeScrean extends StatelessWidget {
  const HomeScrean({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Repository>(context, listen: false);

    return DefaultPage(
      leading: IconButton(
          onPressed: () {
            print(provider.locations);
          },
          icon: Icon(Icons.menu_book)),
      actions: [
        Builder(
          builder: (context) => IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsScrean()));
              },
              icon: Icon(Icons.settings)),
        ),
      ],
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Consumer<Repository>(builder: (context, model, child) => Text(model.spyQty.toString())),
              SizedBox(width: 4),
              Icon(Icons.spa),
            ],
          ),
          SizedBox(width: 12),
          Row(
            children: [
              Consumer<Repository>(builder: (context, model, child) => Text(model.players.toString())),
              SizedBox(width: 4),
              Icon(Icons.people_alt_outlined),
            ],
          ),
          SizedBox(width: 12),
          Row(
            children: [
              Consumer<Repository>(builder: (context, model, child) => Text(model.minutes.toString())),
              SizedBox(width: 4),
              Icon(Icons.timer),
            ],
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: StartWidget(),
      ),
    );
  }
}
