import 'package:flutter/material.dart';

class CommonPaddings {
  static CommonPaddings? _instance;
  static CommonPaddings get instance {
    _instance ??= CommonPaddings._init();
    return _instance!;
  }

  CommonPaddings._init();
  final EdgeInsetsDirectional columnPadding = const EdgeInsetsDirectional.symmetric(vertical: 16, horizontal: 24);
  final EdgeInsets horizontalPadding = const EdgeInsets.symmetric(horizontal: 5);
  final EdgeInsets leftPadding = const EdgeInsets.only(left: 8);
  final EdgeInsets buttonPadding = const EdgeInsets.only(top: 12);
  final EdgeInsets tabPadding = const EdgeInsets.only(left: 8);
  final EdgeInsets sectionPadding = const EdgeInsets.only(top: 24);
  final EdgeInsets widgetPadding = const EdgeInsets.only(top: 12);
  final EdgeInsets contentPadding = const EdgeInsets.symmetric(vertical: 8);
  final EdgeInsets allSidePadding = const EdgeInsets.all(20);
}
