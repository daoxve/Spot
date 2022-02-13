// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../ui/views/about/about_view.dart';
import '../ui/views/home/home_view.dart';
import '../ui/views/recents/recents_view.dart';

class Routes {
  static const String homeView = '/';
  static const String recentsView = '/recents-view';
  static const String aboutView = '/about-view';
  static const all = <String>{
    homeView,
    recentsView,
    aboutView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.homeView, page: HomeView),
    RouteDef(Routes.recentsView, page: RecentsView),
    RouteDef(Routes.aboutView, page: AboutView),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    HomeView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const HomeView(),
        settings: data,
      );
    },
    RecentsView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const RecentsView(),
        settings: data,
      );
    },
    AboutView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const AboutView(),
        settings: data,
      );
    },
  };
}
