import 'package:rpl/app/app.locator.dart';
import 'package:rpl/app/app.router.dart';
import 'package:rpl/ui/base/authentication_viewmodel.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';
import 'package:stacked_services/stacked_services.dart';
import 'register_view.form.dart';

class RegisterViewModel extends AuthenticationViewModel {
  final FirebaseAuthenticationService _firebaseAuthService =
      locator<FirebaseAuthenticationService>();
  final NavigationService _navigationService = locator<NavigationService>();

  RegisterViewModel() : super(successRoute: Routes.homeView);

  @override
  void setFormStatus() {
    // TODO: implement setFormStatus
  }

  @override
  Future<FirebaseAuthenticationResult> runAuthentication() {
    return _firebaseAuthService.createAccountWithEmail(
      email: emailValue!,
      password: passwordValue!,
    );
  }
}
