import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:who_is_spy_flutter/data/repository.dart';
import 'data/models/models.dart';
import 'ui/screans/homeScrean.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final jsonString = await rootBundle.loadString('assets/locations.json');
  final initialData = jsonDecode(jsonString);
  final List rules = initialData['rules'].map((e) => RullesData(text: e['text'], image: e['image'])).toList();
  final List locations = initialData['locations'];
  runApp(
      ChangeNotifierProvider(create: (context) => Repository(rulesList: rules, locations: locations), child: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'oswald',
        primaryColor: Colors.indigo,
        canvasColor: Colors.deepPurple[700],
        appBarTheme: AppBarTheme(
            actionsIconTheme: IconThemeData(
              color: Colors.white,
            ),
            iconTheme: IconThemeData(color: Colors.white)),
        textTheme: TextTheme(
          headline6: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScrean(),
    );
  }
}
