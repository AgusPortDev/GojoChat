import 'package:flutter/material.dart';

List<Color> _colorThemes = [
  Colors.black,
  Colors.white,
  Colors.red,
  Colors.blue,
  Colors.yellow,
  Colors.pink
];

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 1})
      : assert(selectedColor >= 0 && selectedColor <= _colorThemes.length - 1,
            'Los colores tienen que ser menores o igual a 0 y menores a ${_colorThemes.length - 1} ');
  ThemeData theme() {
    return ThemeData(
        useMaterial3: true, colorSchemeSeed: _colorThemes[selectedColor]);
  }
}
