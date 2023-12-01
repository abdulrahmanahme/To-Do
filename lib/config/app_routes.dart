import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import '../core/services/services_locator.dart';
import '../features/todo/presentation/manager/cubit/todo_cubit.dart';
import '../features/todo/presentation/pages/home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRoutes {
  static const String initialRoute = "/";
}

class Routes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    var args = routeSettings.arguments;
    switch (routeSettings.name) {
      case AppRoutes.initialRoute:
        return _animateRouteBuilder( BlocProvider(
          create: (context) => sl<ToDoCubit>(),
          child:const HomePage(),
        ));
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
