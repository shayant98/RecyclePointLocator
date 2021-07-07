import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rpl/app/app.locator.dart';
import 'package:rpl/app/app.logger.dart';
import 'package:rpl/app/app.router.dart';
import 'package:rpl/enum/material_type.dart';
import 'package:rpl/enum/snackbar_type.dart';
import 'package:rpl/exceptions/firestore_api_exception.dart';
import 'package:rpl/models/application_models.dart';
import 'package:rpl/service/recycle_point_service.dart';
import 'package:rpl/service/user_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_themes/stacked_themes.dart';

class DetailViewModel extends BaseViewModel {
  final log = getLogger('DetailViewModel');
  final NavigationService _navigationService = locator<NavigationService>();
  final RecyclePointService _recyclePointService = locator<RecyclePointService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();
  final UserService _userService = locator<UserService>();
  final BottomSheetService _bottomSheetService = locator<BottomSheetService>();
  final ThemeService _themeService = locator<ThemeService>();

  GeoPoint? recyclePointCoordinates;

  RecyclePoint? _recyclePoint;
  RecyclePoint? get recyclePoint => _recyclePoint;

  GoogleMapController? _mapController;
  GoogleMapController? get mapController => _mapController;

  bool _isFavourite = false;
  bool get isFavourite => _isFavourite;

  Set<Marker> _markers = {};
  Set<Marker> get markers => _markers;

  init() async {
    _recyclePoint = _recyclePointService.recyclePoint;
    recyclePointCoordinates = _recyclePoint!.position['geopoint'];
    _isFavourite = await _recyclePointService.checkIfRPisFavourite();
    log.v(_isFavourite);
    await _buildMarkers(recyclePointCoordinates!);
  }

  Future<void> toggleFavourite() async {
    if (_userService.currentUser == null) {
      _snackbarService.showCustomSnackBar(
        message: "You need to be signed in to favourite",
        title: "Oops...",
        duration: Duration(seconds: 3),
        variant: _themeService.isDarkMode ? SnackbarType.darkMode : SnackbarType.lightMode,
      );
      return;
    }

    try {
      if (_isFavourite) {
        await _recyclePointService.unfavouriteRP();
        _isFavourite = false;
      } else {
        await _recyclePointService.favouriteRP();
        _isFavourite = true;
      }
    } on FirestoreApiException catch (e) {
      _snackbarService.showCustomSnackBar(
        message: e.message,
        title: "Error...",
        duration: Duration(seconds: 3),
        variant: _themeService.isDarkMode ? SnackbarType.darkMode : SnackbarType.lightMode,
      );
    }
    notifyListeners();
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

  Future<void> onMapCreated(GoogleMapController controller) async {
    _mapController = controller;
    _themeService.isDarkMode ? await controller.setMapStyle(await rootBundle.loadString('assets/map_styles/dark.json')) : null;
  }

  void navigateToHome() {
    _recyclePointService.setRecyclePoint(null);
    _navigationService.back();
  }

  void navigateToNavigation() {
    _navigationService.navigateTo(Routes.navigationView);
  }

  materialOnTap(RecycleMaterialType materialType) {
    switch (materialType) {
      case RecycleMaterialType.glass:
        _bottomSheetService.showBottomSheet(title: "Wat houdt glass in?", description: "Alle glassoorten");
        break;
      case RecycleMaterialType.paper:
        _bottomSheetService.showBottomSheet(title: "wat houdt paper in?", description: "Alle papier soorten");
        break;
      case RecycleMaterialType.plastic:
        _bottomSheetService.showBottomSheet(title: "wat houdt plastic in?", description: "Alle plastic in");
        break;
      default:
        _bottomSheetService.showBottomSheet(title: "Geen Materiaal", description: "Selecteer");
    }
  }

  @override
  void dispose() {
    _mapController!.dispose();
    super.dispose();
  }
}
