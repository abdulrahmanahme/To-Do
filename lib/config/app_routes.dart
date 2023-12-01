import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../features/todo/presentation/pages/home_page.dart';

class AppRoutes {
  static const String initialRoute = "/";
}

class Routes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    var args = routeSettings.arguments;
    switch (routeSettings.name) {
      case AppRoutes.initialRoute:
        return _animateRouteBuilder(const HomePage());
      default:
        return _animateRouteBuilder(const Scaffold(
          body: Center(
            child: Text('No Route Found'),
          ),
        ));
    }
  }

  static _animateRouteBuilder(
    Widget widget, {
    PageRouteAnimation? pageRouteAnimation,
    Duration? duration,
  }) =>
      buildPageRoute(
          widget,
          pageRouteAnimation ?? PageRouteAnimation.SlideBottomTop,
          duration ?? 50.milliseconds);
}
