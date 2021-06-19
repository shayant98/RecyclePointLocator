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

  init() {
    _isDarkMode = _themeService.isDarkMode;
  }

  void navigateToHome() {
    _navigationService.back();
  }

  void changeTheme(bool value) {
    if (value) {
      _themeService.setThemeMode(ThemeManagerMode.dark);
    } else {
      _themeService.setThemeMode(ThemeManagerMode.light);
    }
    _isDarkMode = value;
    notifyListeners();
    _bottomSheetService.showBottomSheet(title: "Theme Changed", description: "Theme changed to ${_themeService.selectedThemeMode.toString()}, Application will now Restart", barrierDismissible: false);
    Future.delayed(Duration(seconds: 5), () {
      Restart.restartApp();
    });
  }
}
