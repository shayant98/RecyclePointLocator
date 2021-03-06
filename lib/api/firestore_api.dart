import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geoflutterfire2/geoflutterfire2.dart';
import 'package:location/location.dart';
import 'package:rpl/app/app.locator.dart';

import 'package:rpl/app/app.logger.dart';
import 'package:rpl/exceptions/firestore_api_exception.dart';
import 'package:rpl/models/application_models.dart';
import 'package:rpl/service/location_service.dart';

class FirestoreApi {
  final LocationService _locationService = locator<LocationService>();

  final log = getLogger('FirestoreApi');

  GeoFlutterFire _geoFlutterFire = new GeoFlutterFire();

  final CollectionReference userCollectionReference = FirebaseFirestore.instance.collection("users");

  final CollectionReference recycleLocationsCollectionReference = FirebaseFirestore.instance.collection("locations");

  StreamController<List<RecyclePoint>> _locationStreamController = new StreamController.broadcast();
  StreamController<RecyclePoint?> _closestRPStreamController = new StreamController.broadcast();

  Future<void> createUser({required User user}) async {
    log.i('user:$user');

    try {
      final userDocument = userCollectionReference.doc(user.id);
      await userDocument.set(user.toJson());
      log.v('UserCreated at ${userDocument.path}');
    } catch (e) {
      throw FirestoreApiException(message: 'Failed to create new user', devDetails: '$e');
    }
  }

  Future<void> updateUser({required User user}) async {
    log.i('user:$user');

    try {
      final userDocument = userCollectionReference.doc(user.id);
      await userDocument.set(user.toJson());
      log.v('userUpdated at ${userDocument.path}');
    } catch (e) {
      throw FirestoreApiException(message: 'Failed to update new user', devDetails: '$e');
    }
  }

  Future<void> deleteUser({required User user}) async {
    log.i('user:$user');

    try {
      final userDocument = userCollectionReference.doc(user.id);
      await userDocument.delete();
      log.v('userDeleted at ${userDocument.path}');
    } catch (e) {
      throw FirestoreApiException(message: 'Failed to delete new user', devDetails: '$e');
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
      throw FirestoreApiException(message: 'Failed to get user please pass in a valid user id');
    }
  }

  Stream getLocations({required double radius}) {
    LocationData? pos = _locationService.getDeviceLocation();

    GeoFirePoint center = _geoFlutterFire.point(latitude: pos!.latitude!, longitude: pos.longitude!);
    _geoFlutterFire.collection(collectionRef: recycleLocationsCollectionReference).within(center: center, radius: radius, field: 'position', strictMode: true).listen((data) {
      List<RecyclePoint> recyclePoints = [];
      if (data.isNotEmpty) {
        log.v('Locations found. Data: $data');
        recyclePoints = data.map((location) {
          final _recyclePoint = location.data() as Map<String, dynamic>;
          _recyclePoint.putIfAbsent('id', () => location.id);
          return RecyclePoint.fromJson(_recyclePoint);
        }).toList();
      }
      _locationStreamController.add(recyclePoints);
    });

    return _locationStreamController.stream;
  }

  Stream<RecyclePoint?> getLocationsByMaterials({required double radius, required double long, required double lat, required Set<String> materials}) {
    log.i('location params: $radius, $long, ${materials.toList().toString()}');
    GeoFirePoint center = _geoFlutterFire.point(latitude: lat, longitude: long);
    var queryRef = recycleLocationsCollectionReference.where('materials', arrayContainsAny: materials.toList());
    log.v('QUery params: ${queryRef.parameters}');
    _geoFlutterFire.collection(collectionRef: queryRef).within(center: center, radius: radius, field: 'position', strictMode: true).listen((data) {
      RecyclePoint? recyclePoint;
      if (data.isNotEmpty) {
        final _recyclePoint = data[0].data() as Map<String, dynamic>;
        _recyclePoint.putIfAbsent('id', () => data[0].id);
        recyclePoint = RecyclePoint.fromJson(_recyclePoint);

        log.v('Locations found. Data: $recyclePoint');
      } else {
        recyclePoint = null;
      }
      _closestRPStreamController.add(recyclePoint);
    });
    return _closestRPStreamController.stream;
  }

  Future<bool> getUserFavouriteById({required String uId, required String rpId}) async {
    QuerySnapshot document = await userCollectionReference.doc(uId).collection("favourites").where("id", isEqualTo: rpId).get();
    return document.size > 0;
  }

  Future<void> unfavouriteById({required String uId, required String rpId}) async {
    log.i('unfavourite recyclePoint:$rpId');
    try {
      QuerySnapshot snapshot = await userCollectionReference.doc(uId).collection("favourites").where("id", isEqualTo: rpId).get();
      for (QueryDocumentSnapshot doc in snapshot.docs) {
        await doc.reference.delete();
        log.v('RP Unfavourited at ${doc.reference.path}');
      }
    } catch (e) {
      throw FirestoreApiException(message: 'Failed to unfavourite recyclepoint', devDetails: '$e');
    }
  }

  favouriteById({required String uId, required RecyclePoint recyclePoint}) async {
    log.i('favourite recyclePoint:${recyclePoint.name}');

    try {
      final recyclePointDoc = userCollectionReference.doc(uId).collection('favourites').doc();
      await recyclePointDoc.set(recyclePoint.toJson());
      log.v('RP Favourited at ${recyclePointDoc.path}');
    } catch (e) {
      throw FirestoreApiException(message: 'Failed to favourite recyclepoint', devDetails: '$e');
    }
  }
}
