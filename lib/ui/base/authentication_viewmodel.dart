import 'package:rpl/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';
import 'package:stacked_services/stacked_services.dart';

abstract class AuthenticationViewModel extends FormViewModel {
  final _navigationService = locator<NavigationService>();
  final FirebaseAuthenticationService _firebaseAuthenticationService =
      locator<FirebaseAuthenticationService>();

  final String successRoute;
  AuthenticationViewModel({required this.successRoute});

  @override
  void setFormStatus() {}

  Future saveData() async {
    final result = await runBusyFuture(runAuthentication());
    _handleAuthenticationResponse(result);
  }

  Future<void> useGoogleAuthentication() async {
    final result = await _firebaseAuthenticationService.signInWithGoogle();
    _handleAuthenticationResponse(result);
  }

  Future<FirebaseAuthenticationResult> runAuthentication();

  void _handleAuthenticationResponse(
      FirebaseAuthenticationResult authenticationResult) {
    if (!authenticationResult.hasError) {
      _navigationService.navigateTo(successRoute);
    } else {
      setValidationMessage(authenticationResult.errorMessage);
    }
  }
}
