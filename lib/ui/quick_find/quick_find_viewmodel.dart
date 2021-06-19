import 'package:rpl/app/app.locator.dart';
import 'package:rpl/app/app.logger.dart';
import 'package:rpl/app/app.router.dart';
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
        title: "Something went wrong...",
        message: "Please select a material type",
        variant: _themeService.isDarkMode ? SnackbarType.darkMode : SnackbarType.lightMode,
      );
      return;
    }
    RecyclePoint? recyclePoint = await runBusyFuture(_recyclePointService.getClosestRecyclePoint(radius, _selectedMaterials));
    log.i("recyclePoint $recyclePoint");
    if (recyclePoint == null) {
      _snackbarService.showCustomSnackBar(
        duration: Duration(seconds: 2),
        title: "Sorry...",
        message: "No recyclepoints found",
        variant: _themeService.isDarkMode ? SnackbarType.darkMode : SnackbarType.lightMode,
      );
      return;
    }
    SheetResponse? response = await _dialogService.showBottomSheet(
        title: "Recyclepoint found...",
        barrierDismissible: false,
        description: "Recyclepoint ${recyclePoint.name} found - ${recyclePoint.adres}",
        cancelButtonTitle: "Cancel",
        confirmButtonTitle: "Navigate to recyclepoint");

    if (response != null) {
      if (response.confirmed) {
        _recyclePointService.setRecyclePoint(recyclePoint);
        _navigationService.navigateTo(Routes.navigationView);
      }
    }
  }
}
