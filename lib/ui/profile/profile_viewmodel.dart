import 'package:rpl/app/app.locator.dart';
import 'package:rpl/models/application_models.dart';
import 'package:rpl/service/user_service.dart';
import 'package:stacked/stacked.dart';

class ProfileViewModel extends BaseViewModel {
  User? _user;
  User? get user => _user;
  final UserService _userService = locator<UserService>();

  init() {
    _user = _userService.currentUser;
  }
}
