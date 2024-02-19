import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData LIGHT_THEME = ThemeData(
    brightness: Brightness.light,
    primaryColor: const Color(0xff9784f3),
    primaryColorLight: const Color(0xffd8d1fa),
    canvasColor: const Color(0xfffafafa),
    scaffoldBackgroundColor: const Color(0xfffafafa),
    cardColor: const Color(0xffffffff),
    dividerColor: const Color(0x1f000000),
    highlightColor: const Color(0x66bcbcbc),
    splashColor: const Color(0x66c8c8c8),
    unselectedWidgetColor: const Color(0x8a000000),
    disabledColor: const Color(0x61000000),
    secondaryHeaderColor: const Color(0xffebe8fd),
    dialogBackgroundColor: const Color(0xffffffff),
    indicatorColor: const Color(0xff3b17e8),
    hintColor: const Color(0x8a000000),
    buttonTheme: const ButtonThemeData(
      textTheme: ButtonTextTheme.normal,
      minWidth: 88,
      height: 36,
      padding: EdgeInsets.only(top: 0, bottom: 0, left: 16, right: 16),
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Color(0xff000000),
          width: 0,
          style: BorderStyle.none,
        ),
        borderRadius: BorderRadius.all(Radius.circular(2.0)),
      ),
    ),
  );


  static final ThemeData DARK_THEME = ThemeData(
    brightness: Brightness.light,
    primaryColor: const Color(0xff9784f3),
    primaryColorLight: const Color(0xffd8d1fa),
    primaryColorDark: const Color(0xff230e8b),
    canvasColor: const Color(0xfffafafa),
    scaffoldBackgroundColor: const Color(0xfffafafa),
    cardColor: const Color(0xffffffff),
    dividerColor: const Color(0x1f000000),
    highlightColor: const Color(0x66bcbcbc),
    splashColor: const Color(0x66c8c8c8),
    unselectedWidgetColor: const Color(0x8a000000),
    disabledColor: const Color(0x61000000),
    secondaryHeaderColor: const Color(0xffebe8fd),
    dialogBackgroundColor: const Color(0xffffffff),
    indicatorColor: const Color(0xff3b17e8),
    hintColor: const Color(0x8a000000),
    buttonTheme: const ButtonThemeData(
      textTheme: ButtonTextTheme.normal,
      minWidth: 88,
      height: 36,
      padding: EdgeInsets.only(top: 0, bottom: 0, left: 16, right: 16),
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Color(0xff000000),
          width: 0,
          style: BorderStyle.none,
        ),
        borderRadius: BorderRadius.all(Radius.circular(2.0)),
      ),
    ),
  );
}