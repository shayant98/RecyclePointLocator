import 'dart:async';

import 'package:location/location.dart';
import 'package:rpl/api/firestore_api.dart';
import 'package:rpl/app/app.locator.dart';
import 'package:rpl/app/app.logger.dart';
import 'package:rpl/models/application_models.dart';
import 'package:rpl/service/location_service.dart';

class RecyclePointService {
  final log = getLogger('RecyclePointService');

  final LocationService _locationService = locator<LocationService>();
  final FirestoreApi _firestoreApi = locator<FirestoreApi>();

  late StreamSubscription closestRecyclePointSub;

  RecyclePoint? _recyclePoint;
  RecyclePoint? get recyclePoint => _recyclePoint;

  setRecyclePoint(RecyclePoint? recyclePoint) => _recyclePoint = recyclePoint;

  Future<RecyclePoint?> getClosestRecyclePoint(double radius, Set<String> materials) async {
    log.i("getClosestRecyclePoint");
    RecyclePoint? _recyclePoint;
    await _locationService.setDeviceLocation();
    LocationData? location = _locationService.getDeviceLocation();
    closestRecyclePointSub = _firestoreApi.getLocationsByMaterials(radius: radius, long: location!.longitude!, lat: location.latitude!, materials: materials).listen((event) {});

    try {
      RecyclePoint? recylePoints = await _firestoreApi.getLocationsByMaterials(radius: radius, long: location.longitude!, lat: location.latitude!, materials: materials).first;
      _recyclePoint = recylePoints;
      closestRecyclePointSub.cancel();
    } catch (e) {
      log.i("123");
      _recyclePoint = null;
      closestRecyclePointSub.cancel();
    }

    return _recyclePoint;
  }
}
