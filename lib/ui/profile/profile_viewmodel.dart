import 'package:rpl/app/app.locator.dart';
import 'package:rpl/app/app.router.dart';
import 'package:rpl/models/application_models.dart';
import 'package:rpl/service/user_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ProfileViewModel extends BaseViewModel {
  User? _user;
  User? get user => _user;
  final UserService _userService = locator<UserService>();
  final NavigationService _navigationService = locator<NavigationService>();

  init() {
    _user = _userService.currentUser;
  }

  navigateToHome() {
    _navigationService.clearStackAndShow(Routes.homeView);
  }
}
