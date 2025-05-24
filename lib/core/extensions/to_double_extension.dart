import 'package:flutter/material.dart';

extension ToDoubleExtension on double {
  SizedBox get horizontalBox => SizedBox(
        width: this,
      );
  SizedBox get verticalBox => SizedBox(
        height: this,
      );
  EdgeInsets get all => EdgeInsets.all(this);
}
