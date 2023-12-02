import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'config/app_routes.dart';
import 'core/services/services_locator.dart';

void main() {
  ServicesLocator().init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'TO Do',
          theme: ThemeData(
            useMaterial3: true,
          ),
          onGenerateRoute: Routes.onGenerateRoute,
        );
      },
    );
  }
}
