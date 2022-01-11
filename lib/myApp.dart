import 'package:flutter/material.dart';
import 'package:who_is_spy_flutter/ui/screans/homeScrean.dart';

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
