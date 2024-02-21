import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

enum FontSize {
  fontS12(12),
  fontS14(14),
  fontS16(16),
  fontS18(18),
  fontS20(20);

  final double size;

  const FontSize(this.size);
}

class FontSizePreference {
  static const String _fontSizeKey = 'font_size';
  static const double defaultFontSize = 14.0;

  static Future<void> setFontSize(FontSize fontSize) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(_fontSizeKey, fontSize.size);
  }

  static Future<double> getFontSizeValueFromSharedPref() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getDouble(_fontSizeKey) ?? FontSize.fontS14.size;
  }

  static Future<FontSize> getFontSize() async {
    final double size = await getFontSizeValueFromSharedPref();
    for (FontSize fontSize in FontSize.values) {
      if (fontSize.size == size) {
        return fontSize;
      }
    }
    return FontSize.fontS14;
  }

  static double getFontSizeFromSystem(BuildContext context) {
    final deviceFontScale =
        MediaQuery.maybeOf(context)!.textScaler.scale(10) / 10;
    print("zxc deviceFontScale $deviceFontScale");
    // deviceFontScale * textsize = new font size
    return deviceFontScale * 14;
  }

Future<double> getFontSizeValue(FontSize fontSize) async {
  await setFontSize(fontSize);
  FontSize currentFontSizeEnum = await FontSizePreference.getFontSize();
  print('Current font size enum: $currentFontSizeEnum');
switch (currentFontSizeEnum) {
  case FontSize.fontS12:

    print('The font size is small.');
    break;
  case FontSize.fontS14:
    print('The font size is medium.');
    break;
  case FontSize.fontS16:
    print('The font size is large.');
    break;
  case FontSize.fontS18:
    print('The font size is large.');
    break;
  case FontSize.fontS20:
    print('The font size is large.');
    break;
}
  return currentFontSizeEnum.size;
}
}

class DeviceDimensions {
  double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
}
