import 'package:flutter/widgets.dart';

class DDimens {
  // Height
  static const double listItemHeight = 58;
  static const double loaderHeight = 150;
  static const double bottomSheetHeight = 216;
  static const double bottomSheetHeaderHeight = 56;
  static const double elevatedButtonHeight = 56;
  static const double smallElevatedButtonHeight = 48;
  static const double textFormHeightWithError = 84;
  static const double textFormFieldHeight = 56;
  static const double purposeTextFormFieldHeight = 60;
  static const double discountCardHeight = 65;

  // Thickness
  static const double thickness = 1;
  static const double bitThickness = 2;

  // Padding
  static const double emptyPadding = 0;
  static const double tooLittlePadding = 1;
  static const double littlePadding = 2;
  static const double smallPadding = 4;
  static const double tinyPadding = 5;
  static const double mediumPadding = 8;
  static const double smallActionButtonPadding = 6;
  static const double bigPadding = 10;
  static const double lilBiggerThenBigPadding = 11;
  static const double biggerPadding = 15;
  static const double largePadding = 20;
  static const double hugePadding = 24;
  static const double doubleLargePadding = 32;
  static const double doubleHugePadding = 48;

  // Radius
  static const double smallRadius = 5;
  static const double mediumRadius = 8;
  static const double bigRadius = 10;
  static const double biggerRadius = 16;
  static const double largeRadius = 25;
  static const double hugeRadius = 35;
  static const double circleRadius = 200;

  // Emptiness
  static const double tooLittleEmptiness = 1;
  static const double littleEmptiness = 2;
  static const double smallEmptiness = 5;
  static const double mediumEmptiness = 10;
  static const double bigEmptiness = 15;
  static const double largeEmptiness = 20;
  static const double floatActionBtnEmptiness = 60;

  // Cell item
  static const double cellItemSize = 10;

  // Special height
  static const double servicePointsChipHeight = 32;
  static const double establishmentAvatarsHeight = 20;
  static const double establishmentAvatarsWidth = 60;
  static const double searchFieldHeight = 36;
  static const double ratesContainerHeight = 37;
  static const int smallDisplaysSize = 600;

  static const double comboItemLeadingWidth = 55;
  static const double comboItemLeadingMinWidth = 20;
  static const double comboItemImgSize = 40;

  // TextField
  static const double amountTextFieldHeight = 30;
  static const double amountTextFieldWidth = 50;

  // Search Tour Page
  static const double searchTourTabBarHeight = 56;
  // Tour Detail Page
  static const double detailTourTabBarHeight = 50;
}

extension ToEdgeInsets on double {
  EdgeInsets get all => EdgeInsets.all(this);

  EdgeInsets get top => EdgeInsets.only(top: this);

  EdgeInsets get right => EdgeInsets.only(right: this);

  EdgeInsets get bottom => EdgeInsets.only(bottom: this);

  EdgeInsets get left => EdgeInsets.only(left: this);

  EdgeInsets get vertical => EdgeInsets.symmetric(vertical: this);

  EdgeInsets get horizontal => EdgeInsets.symmetric(horizontal: this);

  EdgeInsets asEdgeInsetsWith({
    double? top,
    double? right,
    double? bottom,
    double? left,
  }) =>
      EdgeInsets.only(
        top: top ?? this,
        right: right ?? this,
        bottom: bottom ?? this,
        left: left ?? this,
      );
}

extension ToSizedBox on double {
  /// @return [SizedBox] with [height] equal to [this]
  SizedBox get verticalBox => SizedBox(height: this);

  /// @return [SizedBox] with [width] equal to [this]
  SizedBox get horizontalBox => SizedBox(width: this);

  /// @return [SizedBox] with [width] and [height] equal to [this]
  SizedBox get squareBox => SizedBox(width: this, height: this);
}

extension ToBorderRadius on double {
  BorderRadius get radius => BorderRadius.circular(this);
}
