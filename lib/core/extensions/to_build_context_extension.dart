import 'package:flutter/material.dart';

extension ToBuildContextExtension on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
}
