// ignore_for_file: avoid_print, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:robbinlaw/main.dart';

class MySnackBar {
  String text;
  MySnackBar({required this.text});

  void show() {
    //print(scaffoldMessengerKey.currentState);
    scaffoldMessengerKey.currentState?.showSnackBar(get());
  }
  SnackBar get(){
  return SnackBar(
    duration: const Duration(seconds: 1),
    behavior: SnackBarBehavior.floating,
    content: Row(
      children: [
        const Icon(Icons.heart_broken),
        const SizedBox(
          width: 10,
        ),
        Text(text)
      ],
    ),
    action: SnackBarAction(      
      //had to custom color this label otherwise the label would have the same color as the snackbar, and would not show. but it would still work when clicked.
      textColor: const Color(0xFFFEDBD0), 
      label: 'Click Me',
      onPressed: (){
      print('Snackbar button clicked');
    },)

  );
}
}