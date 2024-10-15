import 'package:flutter/material.dart';

class ColorManager {
  static Color primary = HexColor.formHex("#194AFF");
  static Color black = HexColor.formHex("#000000");
  static Color white = HexColor.formHex("#FFFFFF");
  static Color blue = HexColor.formHex("#194AFF");
  static Color blueLoading = HexColor.formHex("#3272D0");
  static Color blue600 = HexColor.formHex("#1570EF");
  static Color red = HexColor.formHex("#E42320");
  static Color shadow = HexColor.formHex("#000000");
  static Color oxFordBleu = HexColor.formHex("#263238");
  static Color borderColor = HexColor.formHex("#D0D5DD");
  static Color border = HexColor.formHex("#E6E6E6");
  static Color greyText = HexColor.formHex("#49454F");
  static Color greyTextBlod = HexColor.formHex("#8E8E93");
  static Color grey50 = HexColor.formHex("#F9FAFB");
  static Color grey200 = HexColor.formHex("#E1E1E1");
  static Color grey300 = HexColor.formHex("#D0D5DD");
  static Color grey400 = HexColor.formHex("#98A2B3");
  static Color grey500 = HexColor.formHex("#667085");
  static Color grey700 = HexColor.formHex("#344054");
  static Color textGrey = HexColor.formHex("#727272");
  static Color textGrey2 = HexColor.formHex("#899CAF");
  static Color textFieldBackground = HexColor.formHex("#EFEFEF");
  static Color switchBackground = HexColor.formHex("#F9FAFB");
  static Color amber = HexColor.formHex("#FFDF39");
  static Color amberStart = HexColor.formHex("#F99500");
  static Color green = HexColor.formHex("#44C781");
  static Color green2 = HexColor.formHex("1AB129");
  static Color greenComplete = HexColor.formHex("1CC92D");
  static Color orange = HexColor.formHex("#FFCE48");
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
