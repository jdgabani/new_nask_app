import 'package:flutter/material.dart';

import 'color.dart';

class FontTextStyle {
  static TextStyle regBlack20normal = const TextStyle(
      fontWeight: FontWeight.normal, color: AppColor.black, fontSize: 20);

  static TextStyle hedYellow15bold = const TextStyle(
      fontWeight: FontWeight.bold, color: AppColor.primary, fontSize: 15);

  static TextStyle hedBlack18bold = const TextStyle(
      fontWeight: FontWeight.bold, color: AppColor.black, fontSize: 18);

  static TextStyle hedGrey18bold = const TextStyle(
      fontWeight: FontWeight.bold, color: AppColor.grey, fontSize: 18);

  static TextStyle checkGrey10w500 = const TextStyle(
      fontWeight: FontWeight.w500, color: AppColor.grey, fontSize: 10);

  static TextStyle CheckYellow11normal = const TextStyle(
      fontWeight: FontWeight.normal, color: AppColor.primary, fontSize: 11);
}
