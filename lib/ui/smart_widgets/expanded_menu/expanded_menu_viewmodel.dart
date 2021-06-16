import 'package:rpl/app/app.locator.dart';
import 'package:rpl/app/app.router.dart';
import 'package:rpl/models/application_models.dart';
import 'package:rpl/service/auth_service.dart';
import 'package:rpl/service/user_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ExpandedMenuViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final BottomSheetService _bottomSheetService = locator<BottomSheetService>();
  final UserService _userService = locator<UserService>();
  final AuthService _authService = locator<AuthService>();

  User? _user;
  User? get user => _user;
  void navigatoToProfile() => _navigationService.navigateTo(Routes.profileView);
  void navigatoToLogin() => _navigationService.navigateTo(Routes.loginView);

  void logout() async {
    await _authService.logoutCurrentUser();
    _bottomSheetService.showBottomSheet(title: "Successfully Logged out", barrierDismissible: true);
    _user = null;
    _userService.setCurrentUser(_user);

    notifyListeners();
  }

  init() {
    _user = _userService.currentUser;
  }
}
