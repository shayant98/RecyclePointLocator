// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../ui/detail/detail_view.dart';
import '../ui/home/home_view.dart';

class Routes {
  static const String homeView = '/';
  static const String detailView = '/detail-view';
  static const all = <String>{
    homeView,
    detailView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.homeView, page: HomeView),
    RouteDef(Routes.detailView, page: DetailView),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    HomeView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const HomeView(),
        settings: data,
      );
    },
    DetailView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const DetailView(),
        settings: data,
      );
    },
  };
}
