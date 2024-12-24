import 'package:device_preview/device_preview.dart';
import 'package:final_project_2024/core/cache/cachData.dart';
import 'package:final_project_2024/features/home/presentation/manger/provider/lang_provider.dart';
import 'package:final_project_2024/features/register/presentation/manger/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'core/utils/service locator/service_locator.dart';
import 'features/register/data/repo/register_ repo_imp.dart';
import 'myApp.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initServiceLocator();
  await CacheData.cacheInit();
  runApp(
      BlocProvider(create: (context) => RegisterCubit(sl<RegisterRepoImpl>()),child:  ChangeNotifierProvider(
        create: (context) => LangProvider(),
        child: MyApp(),
      ))
  );
}

