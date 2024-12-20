import 'package:device_preview/device_preview.dart';
import 'package:final_project_2024/features/homeLayout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'config/routes/app_routes.dart';
import 'features/servicesFeature/boycott/presentation/ui/resultPage.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          useInheritedMediaQuery: true,
          locale: DevicePreview.locale(context),
          builder: DevicePreview.appBuilder,
          home: HomeLayout(),
          onGenerateRoute: (settings) =>AppRoute.onGenerate(settings) ,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}