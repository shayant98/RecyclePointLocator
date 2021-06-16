import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rpl/app/app.locator.dart';
import 'package:rpl/app/app.logger.dart';
import 'package:rpl/app/app.router.dart';
import 'package:rpl/models/application_models.dart';
import 'package:rpl/service/recycle_point_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class DetailViewModel extends BaseViewModel {
  final log = getLogger('DetailViewModel');
  final NavigationService _navigationService = locator<NavigationService>();
  final RecyclePointService _recyclePointService = locator<RecyclePointService>();

  GeoPoint? recyclePointCoordinates;

  RecyclePoint? _recyclePoint;
  RecyclePoint? get recyclePoint => _recyclePoint;

  GoogleMapController? _mapController;
  GoogleMapController? get mapController => _mapController;

  Set<Marker> _markers = {};
  Set<Marker> get markers => _markers;

  init() async {
    log.i("Viewmodel init");
    _recyclePoint = _recyclePointService.recyclePoint;
    recyclePointCoordinates = _recyclePoint!.position['geopoint'];

    await _buildMarkers(recyclePointCoordinates!);
  }

  _buildMarkers(GeoPoint recyclePos) async {
    log.i('Building Markers: $recyclePos');
    _markers.clear();

    Marker recyclePointMarker = Marker(
      markerId: MarkerId('recyclePoint'),
      position: LatLng(recyclePos.latitude, recyclePos.longitude),
      onTap: () {},
      icon: BitmapDescriptor.defaultMarker,
    );
    _markers.add(recyclePointMarker);
    notifyListeners();
    log.v('Markers build:  $recyclePointMarker');
  }

  void onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  void navigateToHome() {
    _recyclePointService.setRecyclePoint(null);
    _navigationService.back();
  }

  void navigateToNavigation() {
    _navigationService.navigateTo(Routes.navigationView);
  }

  @override
  void dispose() {
    _mapController!.dispose();
    super.dispose();
  }
}
