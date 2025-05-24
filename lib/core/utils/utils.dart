import 'package:ads_app/app/app.dart';
import 'package:flutter/material.dart';
import 'package:logger/web.dart';

void snackBar({
  required String title,
  Color? backgroundColor,
}) {
  ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(SnackBar(
    content: Text(
      title,
    ),
    backgroundColor: backgroundColor,
  ));
}

final Logger logger =  Logger();
