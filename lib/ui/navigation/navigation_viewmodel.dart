import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:rpl/api/directions_api.dart';
import 'package:rpl/app/app.locator.dart';
import 'package:rpl/app/app.logger.dart';
import 'package:rpl/app/app.router.dart';
import 'package:rpl/models/application_models.dart';
import 'package:rpl/models/directions_model.dart';
import 'package:rpl/service/location_service.dart';
import 'package:rpl/service/recycle_point_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_themes/stacked_themes.dart';

class NavigationViewModel extends BaseViewModel {
  final log = getLogger('NavigationViewModel');

  final NavigationService _navigationService = locator<NavigationService>();
  final LocationService _locationService = locator<LocationService>();
  final RecyclePointService _recyclePointService = locator<RecyclePointService>();
  final ThemeService _themeService = locator<ThemeService>();

  final DirectionsApi _directionsApi = locator<DirectionsApi>();

  Set<Marker> _markers = {};
  Set<Marker> get markers => _markers;

  LocationData? _userPosition;
  LocationData? get userPosition => _userPosition;

  RecyclePoint? _recyclePoint;
  RecyclePoint? get recyclePoint => _recyclePoint;

  GeoPoint? _recyclePointPosition;
  GeoPoint? get recyclePointPosition => _recyclePointPosition;

  Directions? info;

  bool _showRecyclePoint = true;
  bool get showRecyclePoint => _showRecyclePoint;

  GoogleMapController? _mapController;
  GoogleMapController? get mapController => _mapController;

  Future<void> init() async {
    _userPosition = _locationService.getDeviceLocation();
    _recyclePoint = _recyclePointService.recyclePoint;
    _recyclePointPosition = _recyclePoint!.position['geopoint'];
    log.v('_userPosition updated: $_userPosition');
    log.v('_recyclePoint updated: $_recyclePoint');
    log.v('_recyclePointPosition updated: $_recyclePointPosition');
    _buildMarkers(_recyclePointPosition!);
    await getDirections(_userPosition!, _recyclePointPosition!);
    notifyListeners();
  }

  navigateToHome() {
    _navigationService.clearStackAndShow(Routes.homeView);
  }

  void toggleShowRecyclePoint() {
    _showRecyclePoint = !_showRecyclePoint;
    log.v(_showRecyclePoint);
    notifyListeners();
  }

  void _buildMarkers(GeoPoint recyclePos) async {
    log.i('Building Markers: $recyclePos');
    _markers.clear();

    Marker recyclePointMarker = Marker(
      markerId: MarkerId('recyclePoint'),
      position: LatLng(recyclePos.latitude, recyclePos.longitude),
      icon: BitmapDescriptor.defaultMarker,
      onTap: toggleShowRecyclePoint,
    );
    _markers.add(recyclePointMarker);
    log.v('Markers build:  $recyclePointMarker');
  }

  Future getDirections(LocationData userPos, GeoPoint recyclePos) async {
    log.i('Building Markers: $userPos, $recyclePos');
    final directions = await _directionsApi.getDirections(
      origin: LatLng(userPos.latitude!, userPos.longitude!),
      destination: LatLng(recyclePos.latitude, recyclePos.longitude),
    );
    log.v('Directions found: ${directions!.polylinePoints}');
    info = directions;
    _mapController!.animateCamera(CameraUpdate.newLatLngBounds(info!.bounds, 100));
    notifyListeners();
  }

  Future<void> onMapCreated(GoogleMapController controller) async {
    _mapController = controller;
    _themeService.isDarkMode ? await controller.setMapStyle(await rootBundle.loadString('assets/map_styles/dark.json')) : null;
  }

  @override
  void dispose() {
    _mapController!.dispose();
    super.dispose();
  }
}
