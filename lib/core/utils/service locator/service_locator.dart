import 'package:dio/dio.dart';
import 'package:final_project_2024/core/services/APIs/boycott_api.dart';
import 'package:final_project_2024/core/services/APIs/chat_bot_api.dart';
import 'package:final_project_2024/core/services/APIs/home_api.dart';
import 'package:final_project_2024/features/chatbot/data/repository/chat_bot_repo_imp.dart';
import 'package:final_project_2024/features/home/data/repository/home_repo_imp.dart';
import 'package:final_project_2024/features/servicesFeature/boycott/data/repository/boycott_repo_imp.dart';
import 'package:get_it/get_it.dart';

import '../../../features/register/data/repo/register_ repo_imp.dart';
import '../../services/APIs/api_register_service.dart';


final sl = GetIt.instance;

void initServiceLocator() {
  sl.registerSingleton(RegisterApiService(Dio()));
  sl.registerSingleton(ChatBotApi(Dio()));
  sl.registerSingleton(BoycottApi(Dio()));
  sl.registerSingleton(HomeApi(Dio()));
  sl.registerSingleton<RegisterRepoImpl>(RegisterRepoImpl(
    sl.get<RegisterApiService>(),
  ));
  sl.registerSingleton<ChatBotRepoImp>(ChatBotRepoImp(
    sl.get<ChatBotApi>(),
  ));
  sl.registerSingleton<BoycottRepoImp>(BoycottRepoImp(
    sl.get<BoycottApi>(),
  ));
  sl.registerSingleton<HomeRepoImp>(HomeRepoImp(
    sl.get<HomeApi>(),
  ));
}
