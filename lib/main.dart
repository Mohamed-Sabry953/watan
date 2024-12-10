import 'package:device_preview/device_preview.dart';
import 'package:final_project_2024/features/register/presentation/manger/register_cubit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/utils/service locator/service_locator.dart';
import 'features/register/data/repo/register_ repo_imp.dart';
import 'myApp.dart';
void main() {
  initServiceLocator();
  runApp(
    MultiBlocProvider(providers: [
      BlocProvider(create: (context) => RegisterCubit(sl<RegisterRepoImpl>()),)
    ], child: BlocBuilder<RegisterCubit,RegisterState>(builder: (context, state) => DevicePreview(
      enabled: false,
      builder: (context) => const MyApp(), // Wrap your app
    ),)
    )
  );
}

