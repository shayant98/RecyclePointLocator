import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:rpl/app/app.logger.dart';
import 'package:rpl/exceptions/firestore_api_exception.dart';
import 'package:rpl/models/application_models.dart';

class FirestoreApi {
  final log = getLogger('FirestoreApi');

  final CollectionReference userCollectionReference =
      FirebaseFirestore.instance.collection("users");

  Future<void> createUser({required User user}) async {
    log.i('user:$user');

    try {
      final userDocument = userCollectionReference.doc(user.id);
      await userDocument.set(user.toJson());
      log.v('UserCreated at ${userDocument.path}');
    } catch (e) {
      throw FirestoreApiException(
          message: 'Failed to create new user', devDetails: '$e');
    }
  }

  Future<void> updateUser({required User user}) async {
    log.i('user:$user');

    try {
      final userDocument = userCollectionReference.doc(user.id);
      await userDocument.set(user.toJson());
      log.v('userUpdated at ${userDocument.path}');
    } catch (e) {
      throw FirestoreApiException(
          message: 'Failed to update new user', devDetails: '$e');
    }
  }

  Future<User?> getUser({required String id}) async {
    log.i('userid:$id');

    if (id.isNotEmpty) {
      final userDoc = await userCollectionReference.doc(id).get();
      if (!userDoc.exists) {
        log.v('We have no user with id $id');
        return null;
      }

      final userData = userDoc.data() as Map<String, dynamic>?;
      log.v('User found. Data: $userData');

      return User.fromJson(userData!);
    } else {
      throw FirestoreApiException(
          message: 'Failed to get user please pass in a valid user id');
    }
  }
}
