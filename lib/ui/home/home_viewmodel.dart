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
import 'package:stacked/stacked.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';
import 'package:stacked_services/stacked_services.dart';

const String _LocationStreamKey = 'location-stream';
const String _RecyclePointStreamKey = 'recycle-stream';

class HomeViewModel extends MultipleStreamViewModel {
  double radius = 50;
  bool showMenu = false;
  LocationData? pos;
  User? _user;
  User? get user => _user;
  Set<Marker> _markers = {};
  Set<Marker> get markers => _markers;
  List<RecyclePoint> get recyclePointData => dataMap![_RecyclePointStreamKey];
  bool get isRecyclePointDataReady => dataReady(_RecyclePointStreamKey);

  GoogleMapController? mapController;
  Location location = new Location();

  final _navigationService = locator<NavigationService>();
  final BottomSheetService _bottomSheetService = locator<BottomSheetService>();
  final UserService _userService = locator<UserService>();
  final LocationService _locationService = locator<LocationService>();
  final RecyclePointService _recyclePointService = locator<RecyclePointService>();
  final FirestoreApi _firestoreApi = locator<FirestoreApi>();
  final FirebaseAuthenticationService _firebaseAuthService = locator<FirebaseAuthenticationService>();

  init() {
    pos = _locationService.getDeviceLocation();
    _user = _userService.currentUser;
  }

  void navigatoToDetail() => _navigationService.navigateTo(Routes.detailView);
  void navigatoToQuickFind() => _navigationService.navigateTo(Routes.quickFindView);
  void navigatoToProfile() => _navigationService.navigateTo(Routes.profileView);
  void navigatoToLogin() => _navigationService.navigateTo(Routes.loginView);
  void navigateToDetail(RecyclePoint recyclePoint) {
    _recyclePointService.setRecyclePoint(recyclePoint);
    _navigationService.navigateTo(Routes.detailView);
  }

  void showExpandedMenuOrLogin() {
    if (_userService.hasLoggedInUser) {
      showMenu = !showMenu;
      notifyListeners();
    } else {
      navigatoToLogin();
    }
  }

  showRadiusSlider() async {
    SheetResponse? response =
        await _bottomSheetService.showCustomSheet(variant: BottomSheetType.FloatingBox, customData: radius);

    if (response != null) {
      radius = response.responseData;
    }
    notifyListeners();
    notifySourceChanged();
  }

  void logout() async {
    await _firebaseAuthService.logout();
    _bottomSheetService.showBottomSheet(title: "Successfully Logged out", barrierDismissible: true);
    showMenu = false;
    _userService.setCurrentUser(null);
    notifyListeners();
  }

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  animateToUser() async {
    var pos = await location.getLocation();
    mapController?.animateCamera(
        CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(pos.latitude!, pos.longitude!), zoom: 15)));
  }

  @override
  Map<String, StreamData> get streamsMap => {
        _LocationStreamKey: StreamData<LocationData>(_locationService.listenToDeviceLocation()),
        _RecyclePointStreamKey:
            StreamData(_firestoreApi.getLocations(radius: radius, lat: 5.8448077, long: -55.2393224)),
      };

  void updateUserLocation(LocationData location) {
    if (pos != null && (pos!.latitude != location.latitude || pos!.longitude != location.longitude)) {
      pos = location;
      mapController!.animateCamera(
        CameraUpdate.newCameraPosition(
            CameraPosition(target: LatLng(location.latitude!, location.longitude!), zoom: 15)),
      );
    }
  }

  void _generateMarkers(List<RecyclePoint> recyclePoints) {
    _markers.clear();
    if (recyclePoints.length > 0) {
      recyclePoints.forEach((RecyclePoint recyclePoint) {
        GeoPoint _markPoint = recyclePoint.position['geopoint'];
        Marker marker = Marker(
          markerId: MarkerId(recyclePoint.id),
          position: LatLng(_markPoint.latitude, _markPoint.longitude),
          onTap: () => navigateToDetail(recyclePoint),
          icon: BitmapDescriptor.defaultMarker,
        );

        _markers.add(marker);
      });
    }
  }

  @override
  void onData(String key, dynamic data) {
    if (key == _LocationStreamKey) {
      updateUserLocation(data);
    }

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
