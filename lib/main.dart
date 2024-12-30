import 'package:device_preview/device_preview.dart';
import 'package:final_project_2024/core/cache/cachData.dart';
import 'package:final_project_2024/features/home/presentation/manger/provider/lang_provider.dart';
import 'package:final_project_2024/features/register/presentation/manger/register_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'core/utils/service locator/service_locator.dart';
import 'features/notification/presentation/manger/FirebaseMessaging.dart';
import 'features/register/data/repo/register_ repo_imp.dart';
import 'firebase_options.dart';
import 'myApp.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Firebase_Messeging().initnotification();
  initServiceLocator();
  await CacheData.cacheInit();
  runApp(
      BlocProvider(create: (context) => RegisterCubit(sl<RegisterRepoImpl>()),child:  ChangeNotifierProvider(
        create: (context) => LangProvider(),
        child: MyApp(),
      ))
  );
}

