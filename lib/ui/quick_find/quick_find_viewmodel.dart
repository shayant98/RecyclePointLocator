import 'package:easy_localization/easy_localization.dart';
import 'package:rpl/app/app.locator.dart';
import 'package:rpl/app/app.logger.dart';
import 'package:rpl/app/app.router.dart';
import 'package:rpl/app/locale_keys.g.dart';
import 'package:rpl/enum/snackbar_type.dart';
import 'package:rpl/models/application_models.dart';
import 'package:rpl/service/recycle_point_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_themes/stacked_themes.dart';

class QuickFindViewModel extends BaseViewModel {
  final log = getLogger('QuickFindViewModel');
  final NavigationService _navigationService = locator<NavigationService>();
  final RecyclePointService _recyclePointService = locator<RecyclePointService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();
  final BottomSheetService _dialogService = locator<BottomSheetService>();
  final ThemeService _themeService = locator<ThemeService>();

  Set<String> _selectedMaterials = {};
  Set<String> get selectedMaterials => _selectedMaterials;

  double radius = 5;

  void navigateToHome() {
    _navigationService.back();
  }

  toggleSelect(String type) {
    if (_selectedMaterials.contains(type)) {
      _selectedMaterials.remove(type);
    } else {
      _selectedMaterials.add(type);
    }
    notifyListeners();
  }

  void setRadius(double value) {
    radius = value;
    notifyListeners();
  }

  Future<void> onTap() async {
    if (_selectedMaterials.length < 1) {
      _snackbarService.showCustomSnackBar(
        duration: Duration(seconds: 2),
        title: tr(LocaleKeys.quick_find_no_material_error_title),
        message: tr(LocaleKeys.quick_find_no_material_error_description),
        variant: _themeService.isDarkMode ? SnackbarType.darkMode : SnackbarType.lightMode,
      );
      return;
    }
    RecyclePoint? recyclePoint = await runBusyFuture(_recyclePointService.getClosestRecyclePoint(radius, _selectedMaterials));
    log.i("recyclePoint $recyclePoint");
    if (recyclePoint == null) {
      _snackbarService.showCustomSnackBar(
        duration: Duration(seconds: 2),
        title: tr(LocaleKeys.quick_find_rp_not_found_error_title),
        message: tr(LocaleKeys.quick_find_rp_not_found_error_description),
        variant: _themeService.isDarkMode ? SnackbarType.darkMode : SnackbarType.lightMode,
      );
      return;
    }
    SheetResponse? response = await _dialogService.showBottomSheet(
      title: tr(LocaleKeys.quick_find_rp_found_title),
      barrierDismissible: false,
      description: tr(LocaleKeys.quick_find_rp_found_description, args: [recyclePoint.name, recyclePoint.adres]),
      cancelButtonTitle: tr(LocaleKeys.quick_find_rp_found_cancel_button),
      confirmButtonTitle: tr(LocaleKeys.quick_find_rp_found_navigate_button),
    );

    if (response != null) {
      if (response.confirmed) {
        _recyclePointService.setRecyclePoint(recyclePoint);
        _navigationService.navigateTo(Routes.navigationView);
      }
    }
  }
}
