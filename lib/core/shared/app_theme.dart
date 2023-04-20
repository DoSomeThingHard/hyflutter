import 'package:flutter/material.dart';

class AppTheme {
  // 1.抽取相同的样式
  static const double _bodyFontSize = 16;
  static const double _smallFontSize = 16;
  static const double _normalFontSize = 20;
  static const double _largeFontSize = 24;

  // 2.亮色主题
  static const Color normalTextColors = Colors.black;
  static final ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.pink, // 主要颜色
    canvasColor: const Color.fromRGBO(255, 254, 222, 1), // 背景色
    splashColor: Colors.transparent, //
    highlightColor: Colors.transparent, // 点击的高亮的水波纹的颜色
    textTheme: const TextTheme(
      bodyMedium: TextStyle(fontSize: _bodyFontSize, color: normalTextColors),
      displaySmall: TextStyle(fontSize: _smallFontSize, color: normalTextColors),
      displayMedium: TextStyle(fontSize: _normalFontSize, color: normalTextColors),
      displayLarge: TextStyle(fontSize: _largeFontSize, color: normalTextColors),
    ),
  );

  // 3.暗黑主题
  static const Color darkTextColors = Colors.green;
  static final ThemeData darkTheme = ThemeData(
    primaryColor: Colors.grey,
    textTheme: const TextTheme(
      bodyMedium: TextStyle(fontSize: _bodyFontSize, color: darkTextColors),
      displaySmall: TextStyle(fontSize: _smallFontSize, color: darkTextColors),
      displayMedium: TextStyle(fontSize: _normalFontSize, color: darkTextColors),
      displayLarge: TextStyle(fontSize: _largeFontSize, color: darkTextColors),
    ),
  );
}
