import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:who_is_spy_flutter/data/repository.dart';

class DefaultPage extends StatelessWidget {
  final Widget body;
  final Widget? endDrawer;
  final bool isBack;
  final Widget title;
  final Widget? leading;
  final Widget? floating;
  final bool centerTitle;
  final List<Widget>? actions;

  DefaultPage(
      {required this.body,
      required this.title,
      this.isBack = true,
      this.actions,
      this.floating,
      this.centerTitle = true,
      this.endDrawer,
      this.leading});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: title,
        leading: isBack && leading == null
            ? IconButton(
                onPressed: () =>
                    {Provider.of<Repository>(context, listen: false).resetDataGame(), Navigator.pop(context)},
                icon: Icon(Icons.arrow_back),
              )
            : leading,
        actions: this.actions,
      ),
      body: body,
    );
  }
}
