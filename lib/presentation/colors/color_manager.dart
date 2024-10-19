import 'package:flutter/material.dart';

class ColorManager {
  static Color primary = HexColor.formHex("#194AFF");
  static Color black = HexColor.formHex("#000000");
  static Color white = HexColor.formHex("#FFFFFF");
  static Color titleBlue = HexColor.formHex("#0C0092");
  static Color textRed = HexColor.formHex("#FF4949");
  
  static Color purpleGradient = HexColor.formHex("#0e00a8");
  static Color pinkGradient = HexColor.formHex("#FF4949");
    static Color grey200 = HexColor.formHex("#E1E1E1");
  
  static Color shadowColor = HexColor.formHex("#01011A").withOpacity(.1);


}

extension HexColor on Color {
  static Color formHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = "FF$hexColorString";
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}
