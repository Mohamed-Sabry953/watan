import 'package:dio/dio.dart';

import '../../utils/constant/apiConstance.dart';

class ChatBotApi{
  final Dio dio;

  ChatBotApi(this.dio);

  Future<Response> chatBot(String message) async {
    var response=await dio.post(
      ApiConstance.chatBot,
      data: {
        "user_prompt": message,
      },
      options: Options(
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          "Accept":"application/json"
        }
      )
    );
    return response;
  }
}