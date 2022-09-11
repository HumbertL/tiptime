import 'package:flutter/material.dart';
import 'package:tiptime/homepage.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Material App',
        theme: ThemeData(primaryColor: Colors.green),
        home: HomePage());
  }
}
