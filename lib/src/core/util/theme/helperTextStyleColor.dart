import 'package:flutter/material.dart';


extension HelperTextStyleColor on BuildContext {
  Color get backgroundBtn => Theme.of(this).scaffoldBackgroundColor;
  Color get backgroundBtn2 => Theme.of(this).primaryColorLight;
  Color get whiteAndBlack => Theme.of(this).colorScheme.onSecondary;
  Color get kBack => Theme.of(this).colorScheme.surface;
  Color get colorText => Theme.of(this).colorScheme.onPrimaryContainer;
}