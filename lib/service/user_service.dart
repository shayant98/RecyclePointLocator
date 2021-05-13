import 'package:rpl/api/firestore_api.dart';
import 'package:rpl/app/app.locator.dart';
import 'package:rpl/app/app.logger.dart';
import 'package:rpl/models/application_models.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';

class UserService {
  final log = getLogger('UserService');

  final FirestoreApi _firestoreApi = locator<FirestoreApi>();
  final FirebaseAuthenticationService _firebaseAuthenticationService =
      locator<FirebaseAuthenticationService>();

  User? _currentUser;
  User? get currentUser => _currentUser;
  bool get hasLoggedInUser => _firebaseAuthenticationService.hasUser;

  Future<void> syncUserAccount() async {
    final firebaseUserId =
        _firebaseAuthenticationService.firebaseAuth.currentUser!.uid;

    log.v('Sync user $firebaseUserId');

    final userAccount = await _firestoreApi.getUser(id: firebaseUserId);

    if (userAccount != null) {
      log.v('user $firebaseUserId exists saved as currentUser');
      _currentUser = userAccount;
    }
  }

  Future<void> syncOrCreateUserAccount({required User user}) async {
    log.v('SyncOrCreateUserAccount - $user');
    if (_currentUser == null) {
      log.v('No user found create new user...');
      await _firestoreApi.createUser(user: user);
      _currentUser = user;
      log.v('_currentUser has been saved');
    }
  }
}
