import 'package:flutter/material.dart';

class TColor {
  static const Color primary = Color(0xFF2196F3);
  static const Color primaryText = Color(0xff030303);
  static const Color secondaryText = Color(0xff828282);
  static const Color textTittle = Color(0xff7C7C7C);
  static const Color placeholder = Color(0xffB1B1B1);
  static const Color darkGray = Color(0xff4C4F4D);
  static const Gradient linearGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFF48B2E7),
      Color(0xFF0076B1),
    ],
  );
}

extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}
