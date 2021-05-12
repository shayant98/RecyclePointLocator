import 'package:rpl/app/app.locator.dart';
import 'package:rpl/app/app.router.dart';
import 'package:rpl/enum/bottom_sheet_type.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  double radius = 50;

  final _navigationService = locator<NavigationService>();
  final BottomSheetService _bottomSheetService = locator<BottomSheetService>();

  void navigatoToDetail() => _navigationService.navigateTo(Routes.detailView);
  void navigatoToQuickFind() =>
      _navigationService.navigateTo(Routes.detailView);
  void navigatoToProfile() => _navigationService.navigateTo(Routes.loginView);

  showRadiusSlider() async {
    SheetResponse? response = await _bottomSheetService.showCustomSheet(
        variant: BottomSheetType.FloatingBox, customData: radius);

    if (response != null) {
      radius = response.responseData;
    }
    notifyListeners();
  }
}
