import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../../utils/storage_manager.dart';
import 'app_colors.dart';

class ThemeNotifier with ChangeNotifier {
  final darkTheme = ThemeData(
    primaryColor: Colors.black,
    brightness: Brightness.dark,
    hintColor: Colors.white,
    dividerColor: Colors.black12,
  );

  final lightTheme = ThemeData(
    primaryColor: Colors.white,
    brightness: Brightness.light,
    hintColor: Colors.black,
    dividerColor: Colors.white54,
  );

  final orangeTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
    ),
  );

  final orangeDarkTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.blue,
    ),
  );

  ThemeData? _themeData;
  Brightness? _deviceBrightness;

  ThemeData? getTheme() {
    return _themeData;
  }

  ThemeData? getDarkTheme() {
    StorageManager.readData('themeMode').then((value) => {
          if (value == 'orange') {setOrangeDarkMode()} else {setDarkMode()}
        });
    return _themeData;
  }

  Brightness? getBrightness() => _deviceBrightness;

  ThemeNotifier() {
    StorageManager.readData('themeMode').then((value) {
      print('value read from storage: ' + value.toString());
      _deviceBrightness =
          SchedulerBinding.instance.platformDispatcher.platformBrightness;

      var themeMode = value ?? 'light';
      if (themeMode == 'orange') {
        _themeData = orangeTheme;
      } else if (themeMode == 'light') {
        _themeData = lightTheme;
      } else {
        print('setting dark theme');
        _themeData = darkTheme;
      }
      notifyListeners();
    });
  }

  void setOrangeMode() async {
    _themeData = orangeTheme;
    StorageManager.saveData('themeMode', 'orange');
    notifyListeners();
  }

  void setOrangeDarkMode() async {
    _themeData = orangeDarkTheme;
    StorageManager.saveData('themeMode', 'orange');
    notifyListeners();
  }

  void setDarkMode() async {
    _themeData = darkTheme;
    StorageManager.saveData('themeMode', 'dark');
    notifyListeners();
  }

  void setLightMode() async {
    _themeData = lightTheme;
    StorageManager.saveData('themeMode', 'light');
    notifyListeners();
  }
}
