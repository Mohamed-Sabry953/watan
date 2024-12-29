import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'config/routes/app_routes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'features/home/presentation/manger/provider/lang_provider.dart';
import 'features/servicesFeature/donate/presentation/ui/organizationsPage.dart';
import 'features/servicesFeature/mapsServices/presentation/ui/Country_Maps.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
        var provider= Provider.of<LangProvider>(context);
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(

          theme: ThemeData(
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          localizationsDelegates:  const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en'), // English
            Locale('ar'), // Arabic
          ],
          locale:  Locale(provider.langKey),
          useInheritedMediaQuery: true,
          builder: DevicePreview.appBuilder,
          onGenerateRoute: (settings) =>AppRoute.onGenerate(settings) ,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}