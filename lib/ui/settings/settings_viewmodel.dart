import 'dart:async';

import 'package:restart_app/restart_app.dart';
import 'package:rpl/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_themes/stacked_themes.dart';

class SettingsViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final ThemeService _themeService = locator<ThemeService>();
  final BottomSheetService _bottomSheetService = locator<BottomSheetService>();

  bool _isDarkMode = false;
  bool get isDarkMode => _isDarkMode;

  String? _selectedLanguage;
  String? get selectedLanguage => _selectedLanguage;

  init() {
    _isDarkMode = _themeService.isDarkMode;
  }

  void navigateToHome() {
    _navigationService.back();
  }

  void changeLanguage(String value) {
    if (_selectedLanguage != value) {
      _selectedLanguage = value;
      notifyListeners();
    }
  }

  Future<void> changeTheme(bool value) async {
    if (value) {
      _themeService.setThemeMode(ThemeManagerMode.dark);
    } else {
      _themeService.setThemeMode(ThemeManagerMode.light);
    }
    _isDarkMode = value;
    notifyListeners();
    SheetResponse response = (await _bottomSheetService.showBottomSheet(
        title: "Changing Theme...", description: "Changing theme to ${_themeService.isDarkMode ? "dark mode" : "light mode"}, to apply fully application will now restart", barrierDismissible: false))!;

    Future.delayed(Duration(seconds: 3), () {
      Restart.restartApp();
    });
  }
}
