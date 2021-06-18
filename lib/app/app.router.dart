// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../ui/detail/detail_view.dart';
import '../ui/home/home_view.dart';
import '../ui/login/login_view.dart';
import '../ui/navigation/navigation_view.dart';
import '../ui/profile/profile_view.dart';
import '../ui/quick_find/quick_find_view.dart';
import '../ui/register/register_view.dart';
import '../ui/settings/settings_view.dart';
import '../ui/startup/startup_view.dart';
import '../ui/support/support_view.dart';

class Routes {
  static const String startupView = '/';
  static const String homeView = '/home-view';
  static const String settingsView = '/settings-view';
  static const String supportView = '/support-view';
  static const String detailView = '/detail-view';
  static const String profileView = '/profile-view';
  static const String loginView = '/login-view';
  static const String registerView = '/register-view';
  static const String navigationView = '/navigation-view';
  static const String quickFindView = '/quick-find-view';
  static const all = <String>{
    startupView,
    homeView,
    settingsView,
    supportView,
    detailView,
    profileView,
    loginView,
    registerView,
    navigationView,
    quickFindView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.startupView, page: StartupView),
    RouteDef(Routes.homeView, page: HomeView),
    RouteDef(Routes.settingsView, page: SettingsView),
    RouteDef(Routes.supportView, page: SupportView),
    RouteDef(Routes.detailView, page: DetailView),
    RouteDef(Routes.profileView, page: ProfileView),
    RouteDef(Routes.loginView, page: LoginView),
    RouteDef(Routes.registerView, page: RegisterView),
    RouteDef(Routes.navigationView, page: NavigationView),
    RouteDef(Routes.quickFindView, page: QuickFindView),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    StartupView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const StartupView(),
        settings: data,
      );
    },
    HomeView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => HomeView(),
        settings: data,
      );
    },
    SettingsView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => SettingsView(),
        settings: data,
      );
    },
    SupportView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => SupportView(),
        settings: data,
      );
    },
    DetailView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const DetailView(),
        settings: data,
      );
    },
    ProfileView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const ProfileView(),
        settings: data,
      );
    },
    LoginView: (data) {
      var args = data.getArgs<LoginViewArguments>(
        orElse: () => LoginViewArguments(),
      );
      return CupertinoPageRoute<dynamic>(
        builder: (context) => LoginView(key: args.key),
        settings: data,
      );
    },
    RegisterView: (data) {
      var args = data.getArgs<RegisterViewArguments>(
        orElse: () => RegisterViewArguments(),
      );
      return CupertinoPageRoute<dynamic>(
        builder: (context) => RegisterView(key: args.key),
        settings: data,
      );
    },
    NavigationView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const NavigationView(),
        settings: data,
      );
    },
    QuickFindView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const QuickFindView(),
        settings: data,
        fullscreenDialog: true,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// LoginView arguments holder class
class LoginViewArguments {
  final dynamic key;
  LoginViewArguments({this.key});
}

/// RegisterView arguments holder class
class RegisterViewArguments {
  final Key? key;
  RegisterViewArguments({this.key});
}
