import 'package:rpl/app/app.locator.dart';
import 'package:rpl/app/app.logger.dart';
import 'package:rpl/service/user_service.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';

class AuthService {
  final log = getLogger('AuthService');
  final FirebaseAuthenticationService _firebaseAuthenticationService = locator<FirebaseAuthenticationService>();
  final UserService _userService = locator<UserService>();

  logoutCurrentUser() {
    _firebaseAuthenticationService.logout();
    _userService.setCurrentUser(null);
  }

  Future<bool> sendForgotPassword() async {
    return await _firebaseAuthenticationService.sendResetPasswordLink(_userService.currentUser!.email!);
  }
}
