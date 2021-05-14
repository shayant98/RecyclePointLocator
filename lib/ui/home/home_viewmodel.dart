import 'dart:developer';

import 'package:rpl/app/app.locator.dart';
import 'package:rpl/app/app.router.dart';
import 'package:rpl/enum/bottom_sheet_type.dart';
import 'package:rpl/models/application_models.dart';
import 'package:rpl/service/user_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  double radius = 50;
  bool showMenu = false;
  User? _user;
  User? get user => _user;

  final _navigationService = locator<NavigationService>();
  final BottomSheetService _bottomSheetService = locator<BottomSheetService>();
  final UserService _userService = locator<UserService>();
  final FirebaseAuthenticationService _firebaseAuthService =
      locator<FirebaseAuthenticationService>();
  init() {
    _user = _userService.currentUser;
  }

  void navigatoToDetail() => _navigationService.navigateTo(Routes.detailView);
  void navigatoToQuickFind() =>
      _navigationService.navigateTo(Routes.detailView);
  void navigatoToProfile() => _navigationService.navigateTo(Routes.profileView);
  void navigatoToLogin() => _navigationService.navigateTo(Routes.loginView);

  void showExpandedMenuOrLogin() {
    if (_userService.hasLoggedInUser) {
      showMenu = !showMenu;
      notifyListeners();
    } else {
      navigatoToLogin();
    }
  }

  showRadiusSlider() async {
    SheetResponse? response = await _bottomSheetService.showCustomSheet(
        variant: BottomSheetType.FloatingBox, customData: radius);

    if (response != null) {
      radius = response.responseData;
    }
    notifyListeners();
  }

  void logout() async {
    await _firebaseAuthService.logout();
    _bottomSheetService.showBottomSheet(
        title: "Successfully Logged out", barrierDismissible: true);
    showMenu = false;
    notifyListeners();
  }
}
