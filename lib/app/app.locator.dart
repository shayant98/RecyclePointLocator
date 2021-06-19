// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedLocatorGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_themes/stacked_themes.dart';

import '../api/directions_api.dart';
import '../api/firestore_api.dart';
import '../service/auth_service.dart';
import '../service/location_service.dart';
import '../service/recycle_point_service.dart';
import '../service/user_service.dart';

final locator = StackedLocator.instance;

Future setupLocator() async {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => BottomSheetService());
  locator.registerLazySingleton(() => ThemeService.getInstance());
  final sharedPreferences = await SharedPreferences.getInstance();
  locator.registerSingleton(sharedPreferences);

  locator.registerLazySingleton(() => SnackbarService());
  locator.registerLazySingleton(() => FirestoreApi());
  locator.registerLazySingleton(() => DirectionsApi());
  locator.registerLazySingleton(() => UserService());
  locator.registerLazySingleton(() => AuthService());
  locator.registerLazySingleton(() => LocationService());
  locator.registerLazySingleton(() => RecyclePointService());
  locator.registerSingleton(FirebaseAuthenticationService());
}
