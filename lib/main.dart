import 'package:ads_app/app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:permission_handler/permission_handler.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  await requestLocationPermission();
  runApp(const AppPage());
}

Future requestLocationPermission() async {
  if (await Permission.location.request().isGranted) {
    // Permission is granted, proceed with your logic
  } else {
    // Permission is denied, handle accordingly
  }
}
