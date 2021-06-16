import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:location/location.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rpl/api/firestore_api.dart';
import 'package:rpl/app/app.locator.dart';
import 'package:rpl/app/app.router.dart';
import 'package:rpl/enum/bottom_sheet_type.dart';
import 'package:rpl/models/application_models.dart';
import 'package:rpl/service/location_service.dart';
import 'package:rpl/service/recycle_point_service.dart';
import 'package:rpl/service/user_service.dart';
import 'package:rpl/ui/shared/styles.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';
import 'package:stacked_services/stacked_services.dart';

const String _RecyclePointStreamKey = 'recycle-stream';

class HomeViewModel extends MultipleStreamViewModel {
  final _navigationService = locator<NavigationService>();
  final BottomSheetService _bottomSheetService = locator<BottomSheetService>();
  final UserService _userService = locator<UserService>();
  final LocationService _locationService = locator<LocationService>();
  final RecyclePointService _recyclePointService = locator<RecyclePointService>();
  final FirestoreApi _firestoreApi = locator<FirestoreApi>();
  final FirebaseAuthenticationService _firebaseAuthService = locator<FirebaseAuthenticationService>();

  Map<double, double> zoomLevels = {
    5: 12,
    20: 10.5,
  };

  double radius = 5;
  bool showMenu = false;
  LocationData? pos;
  User? _user;
  User? get user => _user;
  Set<Marker> _markers = {};
  Set<Marker> get markers => _markers;
  Set<Circle> _radiusCirlce = {};
  Set<Circle> get radiusCirlce => _radiusCirlce;

  List<RecyclePoint> get recyclePointData => dataMap![_RecyclePointStreamKey];
  bool get isRecyclePointDataReady => dataReady(_RecyclePointStreamKey);

  GoogleMapController? mapController;
  Location location = new Location();

  init() {
    pos = _locationService.getDeviceLocation();
    _user = _userService.currentUser;
    _drawRadiusCircle();
  }

  _drawRadiusCircle() {
    _radiusCirlce.clear();
    Circle newRadiusCircle = Circle(
      circleId: CircleId("radius"),
      radius: radius * 1000,
      fillColor: kEmeraldGreen.withOpacity(0.3),
      strokeColor: kEmeraldGreen,
      strokeWidth: 3,
      center: LatLng(pos!.latitude!, pos!.longitude!),
    );
    _radiusCirlce.add(newRadiusCircle);
  }

  void navigatoToDetail() => _navigationService.navigateTo(Routes.detailView);
  void navigatoToQuickFind() => _navigationService.navigateTo(Routes.quickFindView);
  void navigatoToProfile() => _navigationService.navigateTo(Routes.profileView);
  void navigatoToLogin() => _navigationService.navigateTo(Routes.loginView);
  void navigateToDetail(RecyclePoint recyclePoint) {
    _recyclePointService.setRecyclePoint(recyclePoint);
    _navigationService.navigateTo(Routes.detailView);
  }

  void toggleExpandedMenu() {
    showMenu = !showMenu;
    notifyListeners();
  }

  showRadiusSlider() async {
    SheetResponse? response = await _bottomSheetService.showCustomSheet(variant: BottomSheetType.FloatingBox, customData: radius);

    if (response != null) {
      radius = response.responseData;
      _drawRadiusCircle();
      mapController?.moveCamera(CameraUpdate.zoomTo(zoomLevels[radius] ?? 12));
    }
    notifyListeners();
    notifySourceChanged();
  }

  void logout() async {
    await _firebaseAuthService.logout();
    _bottomSheetService.showBottomSheet(title: "Successfully Logged out", barrierDismissible: true);
    showMenu = false;
    _user = null;
    _userService.setCurrentUser(_user);

    notifyListeners();
  }

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  animateToUser() async {
    var pos = await location.getLocation();
    mapController?.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(pos.latitude!, pos.longitude!), zoom: 12)));
  }

  @override
  Map<String, StreamData> get streamsMap => {
        _RecyclePointStreamKey: StreamData(_firestoreApi.getLocations(radius: radius, lat: 5.8448077, long: -55.2393224)),
      };

  void _generateMarkers(List<RecyclePoint> recyclePoints) {
    _markers.clear();
    if (recyclePoints.length > 0) {
      recyclePoints.forEach((RecyclePoint recyclePoint) {
        GeoPoint _markPoint = recyclePoint.position['geopoint'];
        Marker marker = Marker(
          markerId: MarkerId(recyclePoint.id),
          position: LatLng(_markPoint.latitude, _markPoint.longitude),
          onTap: () => navigateToDetail(recyclePoint),
        );

        _markers.add(marker);
      });
    }
  }

  @override
  void onData(String key, dynamic data) {
    if (key == _RecyclePointStreamKey) {
      _generateMarkers(data);
    }
    super.onData(key, data);
  }

  @override
  void dispose() {
    mapController!.dispose();
    super.dispose();
  }
}
