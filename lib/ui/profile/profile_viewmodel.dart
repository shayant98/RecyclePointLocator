import 'package:rpl/app/app.locator.dart';
import 'package:rpl/models/application_models.dart';
import 'package:rpl/service/user_service.dart';
import 'package:rpl/ui/home/home_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ProfileViewModel extends BaseViewModel {
  User? _user;
  User? get user => _user;
  final UserService _userService = locator<UserService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final BottomSheetService _bottomSheetService = locator<BottomSheetService>();

  init() {
    _user = _userService.currentUser;
  }

  navigateToHome() {
    _navigationService.replaceWithTransition(HomeView(), transition: 'leftToRight');
  }

  showDeleteSheet() async {
    SheetResponse? deleteResponse = await _bottomSheetService.showBottomSheet(
        title: "Are you sure?", description: "Deleting your account, will wipe all data related to you", confirmButtonTitle: "Delete My account", cancelButtonTitle: "I want to keep my account", barrierDismissible: true);
    if (deleteResponse != null) {
      if (deleteResponse.confirmed) {
        await _userService.deleteUser(_user!);
        _navigationService.replaceWithTransition(HomeView(), transition: 'leftToRight');
        _bottomSheetService.showBottomSheet(title: "Successfully Deleted account", barrierDismissible: true);
      }
    }
  }
}
