//import 'package:call_in_come_chat/core/style/c_app_color.dart';
import 'package:flutter/material.dart';
import 'c_app_color.dart';
export 'b_app_style.dart';
export 'c_app_color.dart';

extension ColorOnContext on BuildContext {
  ColorScheme get color {
    return AppColor.choseColor(this);
  }
}
