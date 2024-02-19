// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:robbinlaw/themes/theme.dart';
import 'package:robbinlaw/first-page.dart';

void main() => runApp(MyApp());

final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey:
          scaffoldMessengerKey,
      title: 'Assignment 02 - Jason Tat',
      debugShowCheckedModeBanner: false,
      home: MyFirstPage(),
      theme: buildTheme(),
    );
  }
}
