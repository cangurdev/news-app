import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

ThemeData darkTheme() {
  return ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      primarySwatch: Colors.orange,
      brightness: Brightness.dark);
}
