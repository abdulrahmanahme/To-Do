import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import '../core/services/services_locator.dart';
import '../features/todo/data/models/note_model.dart';
import '../features/todo/presentation/manager/cubit/todo_cubit.dart';
import '../features/todo/presentation/pages/edit_note_page.dart';
import '../features/todo/presentation/pages/home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../features/todo/presentation/pages/note_details.dart';

class AppRoutes {
  static const String initialRoute = "/";
  static const String editNotePage = "/EditNotePage";
  static const String noteDetailPage = "/NoteDetailPage";
}

class Routes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    var args = routeSettings.arguments;
    switch (routeSettings.name) {
      case AppRoutes.initialRoute:
        return _animateRouteBuilder(BlocProvider(
          create: (context) => sl<ToDoCubit>()..readAllNote(),
          child:const HomePage(),
        ));
      case AppRoutes.noteDetailPage:
        final noteId = args as int;
        return _animateRouteBuilder(
          NoteDetailPage(
            noteId: noteId,
          ),
        );
      case AppRoutes.editNotePage:
        final note = args as NoteModel;
        return _animateRouteBuilder(
          EditNotePage(
            note: note,
          ),
        );
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
