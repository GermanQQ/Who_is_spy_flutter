import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:who_is_spy_flutter/data/repository.dart';
import 'package:who_is_spy_flutter/myApp.dart';
import 'data/models/models.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final jsonString = await rootBundle.loadString('assets/locations.json');
  final initialData = jsonDecode(jsonString);
  final List rules = initialData['rules'].map((e) => RullesData(text: e['text'], image: e['image'])).toList();
  final List locations = initialData['locations'];
  runApp(
      ChangeNotifierProvider(create: (context) => Repository(rulesList: rules, locations: locations), child: MyApp()));
}
