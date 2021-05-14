import 'dart:async';

import 'package:location/location.dart';
import 'package:rpl/app/app.logger.dart';

class LocationService {
  final log = getLogger('LocationService');
  Location _location = new Location();

  LocationData? _currentLocation;

  final StreamController<LocationData> _locationController =
      new StreamController<LocationData>.broadcast();

  setDeviceLocation() async {
    if (await checkPermission() == false || await checkService() == false) {
      return 'no';
    }
    _currentLocation = await _location.getLocation();
  }

  LocationData? getDeviceLocation() {
    return _currentLocation;
  }

  Stream<LocationData> listenToDeviceLocation() {
    _location.onLocationChanged.listen((LocationData currentLocation) {
      _locationController.add(currentLocation);
    });
    return _locationController.stream;
  }

  Future<bool> checkService() async {
    log.v("Check if GPS is enabled");
    bool _serviceEnabled = await _location.serviceEnabled();
    if (!_serviceEnabled) {
      log.v("service request result: ${_serviceEnabled}");
      _serviceEnabled = await _location.requestService();
      if (!_serviceEnabled) {
        return false;
      }
    }

    return true;
  }

  Future<bool> checkPermission() async {
    log.v("Check if permisison was granted");
    PermissionStatus _permissionGranted = await _location.hasPermission();
    if (_permissionGranted != PermissionStatus.granted) {
      _permissionGranted = await _location.requestPermission();
      log.v("Permission result: ${_permissionGranted}");
      if (_permissionGranted != PermissionStatus.granted) {
        return false;
      }
    }
    return true;
  }
}
