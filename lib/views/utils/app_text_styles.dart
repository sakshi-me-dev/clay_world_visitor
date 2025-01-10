import 'package:flutter/material.dart';
class AppTextStyle {
  static TextStyle bold({
    double fontSize = 16.0,
    Color color = Colors.black,
    int? maxLines,
  }) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: FontWeight.bold,
      color: color,
      overflow: maxLines != null ? TextOverflow.ellipsis : null,
    );
  }

  static TextStyle normal({
    double fontSize = 16.0,
    Color color = Colors.black,
    int? maxLines,
  }) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: FontWeight.normal,
      color: color,
      overflow: maxLines != null ? TextOverflow.ellipsis : null,
    );
  }

  static TextStyle appBarTitle({
    double fontSize = 20.0,
    Color color = Colors.black,
    int? maxLines,
    FontWeight fontWeight = FontWeight.w600,
  }) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      overflow: maxLines != null ? TextOverflow.ellipsis : null,
    );
  }

  static TextStyle small({
    double fontSize = 12.0,
    Color color = Colors.black,
    int? maxLines,
    FontWeight fontWeight = FontWeight.normal,
  }) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      overflow: maxLines != null ? TextOverflow.ellipsis : null,
    );
  }

  static TextStyle large({
    double fontSize = 24.0,
    Color color = Colors.black,
    int? maxLines,
    FontWeight fontWeight = FontWeight.normal,
  }) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      overflow: maxLines != null ? TextOverflow.ellipsis : null,
    );
  }
}
