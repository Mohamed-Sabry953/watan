import 'package:dio/dio.dart';
import 'package:dio/src/response.dart';
import 'package:either_dart/src/either.dart';
import 'package:final_project_2024/core/errors/failure.dart';
import 'package:final_project_2024/core/services/APIs/chat_bot_api.dart';
import 'package:final_project_2024/features/chatbot/data/repository/chat_bot_repo.dart';
import 'package:flutter/foundation.dart';

class ChatBotRepoImp implements ChatBotRepo{
  final ChatBotApi chatBotApi ;

  ChatBotRepoImp(this.chatBotApi);

  @override
  Future<Either<Failure, Response>> chatBot({required String message}) async {
    try{
      Response response=await chatBotApi.chatBot(message);
      if(response.statusCode==200){
        if (kDebugMode) {
          print(response);
        }
        return Right(response);
      }
      else{
        // print("Login failed: ${response.statusMessage}");
        return Left(ServerFailure("Login fail${response.statusMessage}"));
      }
    }on DioError catch(e){
      if (e.response != null) {
        if (kDebugMode) {
          print('Login error: ${e.response?.data}');
        }
        return Left(ServerFailure.fromDioError(e));
      }
      else {
        if (kDebugMode) {
          print('Login error: ${e.message}');
        }
        return Left(ServerFailure(e.message??""));
      }
    }
  }

}