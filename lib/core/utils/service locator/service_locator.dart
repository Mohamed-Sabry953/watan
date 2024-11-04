import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../../features/register/data/repo/register_ repo_imp.dart';
import '../../services/APIs/api_register_service.dart';


final sl = GetIt.instance;

void initServiceLocator() {
  sl.registerSingleton(RegisterApiService(Dio()));
  sl.registerSingleton<RegisterRepoImpl>(RegisterRepoImpl(
    sl.get<RegisterApiService>(),
  ));
}
