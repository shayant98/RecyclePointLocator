import 'package:rpl/app/app.locator.dart';
import 'package:rpl/app/app.logger.dart';
import 'package:rpl/exceptions/firestore_api_exception.dart';
import 'package:rpl/models/application_models.dart';
import 'package:rpl/service/user_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';
import 'package:stacked_services/stacked_services.dart';

abstract class AuthenticationViewModel extends FormViewModel {
  final log = getLogger('AuthenticationViewModel');

  final _navigationService = locator<NavigationService>();
  final UserService _userService = locator<UserService>();
  final FirebaseAuthenticationService _firebaseAuthenticationService = locator<FirebaseAuthenticationService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();

  final String successRoute;
  AuthenticationViewModel({required this.successRoute});

  @override
  void setFormStatus() {}

  Future saveData() async {
    log.i('values:$formValueMap');

    try {
      final result = await runBusyFuture(runAuthentication(), throwException: true);

      _handleAuthenticationResponse(result);
    } on FirestoreApiException catch (e) {
      log.e(e.toString());
      setValidationMessage(e.toString());
    }
  }

  Future<void> useGoogleAuthentication() async {
    final result = await _firebaseAuthenticationService.signInWithGoogle();
    _handleAuthenticationResponse(result);
  }

  Future<FirebaseAuthenticationResult> runAuthentication();

  Future<void> _handleAuthenticationResponse(FirebaseAuthenticationResult authenticationResult) async {
    if (!authenticationResult.hasError && authenticationResult.user != null) {
      final user = authenticationResult.user!;
      await _userService.syncOrCreateUserAccount(
        user: User(id: user.uid, email: user.email, image: user.photoURL, name: user.displayName ?? '${formValueMap['firstName']} ${formValueMap['lastName']}'),
      );
      _navigationService.replaceWith(successRoute);
    } else {
      if (!authenticationResult.hasError && authenticationResult.user != null) {
        log.wtf('We have no error but the user is null.');
      }

      log.w('Authentication Failed: ${authenticationResult.errorMessage}');

      setValidationMessage(authenticationResult.errorMessage);
      _snackbarService.showSnackbar(message: validationMessage!);
      notifyListeners();
    }
  }
}
