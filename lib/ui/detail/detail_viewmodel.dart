import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rpl/app/app.locator.dart';
import 'package:rpl/enum/material_type.dart';
import 'package:rpl/models/application_models.dart';
import 'package:rpl/service/recycle_point_service.dart';
import 'package:rpl/service/user_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class DetailViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final UserService _userService = locator<UserService>();
  final RecyclePointService _recyclePointService = locator<RecyclePointService>();

  GeoPoint? recyclePointCoordinates;

  RecyclePoint? _recyclePoint;
  RecyclePoint? get recyclePoint => _recyclePoint;

  GoogleMapController? _mapController;
  GoogleMapController? get mapController => _mapController;

  bool _isSelected = false;
  get isSelected => _isSelected;

  void toggleIsSelected() {
    _isSelected = !isSelected;
    notifyListeners();
  }

  init() {
    print(RecycleMaterialType.glass.toString());
    _recyclePoint = _recyclePointService.recyclePoint;
    recyclePointCoordinates = _recyclePoint!.position['geopoint'];
  }

  void onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  void navigateToHome() {
    _recyclePointService.setRecyclePoint(null);
    _navigationService.back();
  }

  @override
  void dispose() {
    _mapController!.dispose();
    super.dispose();
  }
}
