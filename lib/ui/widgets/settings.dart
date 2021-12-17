import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:provider/provider.dart';
import 'package:who_is_spy_flutter/data/models/models.dart';
import 'package:who_is_spy_flutter/data/repository.dart';
import 'package:who_is_spy_flutter/untils/untils.dart';

class SettingsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        children: [
          SettingButton(typeB: SettingButtonEmun.players),
          SizedBox(height: 5),
          SettingButton(typeB: SettingButtonEmun.spy),
          SizedBox(height: 5),
          SettingButton(typeB: SettingButtonEmun.timer),
          SizedBox(height: 5),
        ],
      ),
    );
  }
}

class SettingButton extends StatelessWidget {
  final SettingButtonEmun typeB;

  SettingButton({required this.typeB});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Repository>(context, listen: true);
    SettingButtonModel b = getSettingButtom(typeB, provider);
    // final height = MediaQuery.of(context).size.height;

    return ElevatedButton(
      onPressed: () async {
        await showDialog(context: context, builder: (_) => SettingShowDialog(type: b.type));
      },
      style: textButton(),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  b.icon,
                  color: Colors.white,
                  size: 30,
                ),
                SizedBox(width: 6),
                Text(
                  b.title,
                  style: normalTextStyle(context),
                ),
              ],
            ),
            if (b.count != null)
              Consumer<Repository>(
                  builder: (context, model, child) => Text(
                        '${b.count}',
                        style: normalTextStyle(context),
                      )),
          ],
        ),
      ),
    );
  }
}

class SettingShowDialog extends StatelessWidget {
  final SettingButtonEmun type;
  SettingShowDialog({required this.type});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Repository>(context, listen: true);
    SettingButtonModel b = getSettingButtom(type, provider);
    int min = getMin(b.type, provider);
    int max = getMax(b.type, provider);

    final width = MediaQuery.of(context).size.width;

    return Center(
      child: Consumer<Repository>(builder: (context, model, child) {
        return Container(
          width: width * 0.9,
          height: 180,
          decoration: BoxDecoration(color: Colors.deepPurple[600], borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              NumberPicker(
                value: b.count ?? 0,
                minValue: min,
                maxValue: max,
                selectedTextStyle: TextStyle(color: Colors.blue, fontSize: getFontSizeByScreen(context, 24)),
                textStyle: TextStyle(color: Colors.white),
                onChanged: (value) => provider.changeSettingQty(b.type, value),
                axis: Axis.horizontal,
                decoration: BoxDecoration(
                    color: Colors.deepPurple[700]!.withOpacity(0.5),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                itemWidth: 80,
              ),
              Container(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  '${b.title}: ${b.count}',
                  style: normalTextStyle(context),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
