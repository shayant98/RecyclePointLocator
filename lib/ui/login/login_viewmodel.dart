import 'package:rpl/app/app.locator.dart';
import 'package:rpl/app/app.router.dart';
import 'package:rpl/ui/base/authentication_viewmodel.dart';
// ignore: implementation_imports
import 'package:stacked_firebase_auth/src/firebase_authentication_service.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:rpl/ui/login/login_view.form.dart';

class LoginViewModel extends AuthenticationViewModel {
  final FirebaseAuthenticationService _firebaseAuthService =
      locator<FirebaseAuthenticationService>();
  final NavigationService _navigationService = locator<NavigationService>();

  LoginViewModel() : super(successRoute: Routes.profileView);

  void navigateToCreateAccount() =>
      _navigationService.navigateTo(Routes.registerView);

  void navigateToHome() => _navigationService.back();
  @override
  Future<FirebaseAuthenticationResult> runAuthentication() {
    return _firebaseAuthService.loginWithEmail(
      email: emailValue!,
      password: passwordValue!,
    );
  }
}
