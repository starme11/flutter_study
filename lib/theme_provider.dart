import 'package:flutter/material.dart';

// 테마 모드를 나타내는 enum
enum ThemeModeType { light, dark }

class ThemeProvider with ChangeNotifier {
  ThemeModeType _themeMode = ThemeModeType.light; // 기본값은 라이트 모드

  ThemeModeType get themeMode => _themeMode;

  // 현재 테마 모드에 따라 실제 Flutter ThemeMode 반환
  ThemeMode get flutterThemeMode {
    switch (_themeMode) {
      case ThemeModeType.light:
        return ThemeMode.light;
      case ThemeModeType.dark:
        return ThemeMode.dark;
    }
  }

  // 테마 모드를 토글하는 함수
  void toggleTheme() {
    _themeMode = _themeMode == ThemeModeType.light
        ? ThemeModeType.dark
        : ThemeModeType.light;
    notifyListeners(); // 변경 사항을 리스너(위젯)에 알립니다.
  }

  // 특정 테마 모드로 설정하는 함수
  void setTheme(ThemeModeType mode) {
    if (_themeMode != mode) {
      _themeMode = mode;
      notifyListeners();
    }
  }

  bool isDarkMode() {
    return _themeMode == ThemeModeType.dark;
  }
}
