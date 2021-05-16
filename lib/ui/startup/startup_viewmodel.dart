import 'package:rpl/app/app.locator.dart';
import 'package:rpl/app/app.logger.dart';
import 'package:rpl/app/app.router.dart';
import 'package:rpl/service/location_service.dart';
import 'package:rpl/service/user_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final log = getLogger('StartUpViewModel');
  final UserService _userService = locator<UserService>();
  final LocationService _locationService = locator<LocationService>();
  final NavigationService _navigationService = locator<NavigationService>();

  Future<void> runStartupLogic() async {
    await _locationService.setDeviceLocation();
    if (_userService.hasLoggedInUser) {
      log.v('We have a user session on disk. Sync the user profile ...');
      await _userService.syncUserAccount();

      final currentUser = _userService.currentUser;
      log.v('User sync complete. User profile: $currentUser');
    }
    _navigationService.replaceWith(Routes.homeView);
  }
}
