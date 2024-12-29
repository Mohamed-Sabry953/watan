import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:final_project_2024/features/chatbot/data/repository/chat_bot_repo_imp.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'chatbot_state.dart';

class ChatbotCubit extends Cubit<ChatbotState> {
  ChatbotCubit(this.chatBotRepoImp) : super(ChatbotInitial());
  static ChatbotCubit get(context)=>BlocProvider.of(context);
  final ChatBotRepoImp chatBotRepoImp;
  final TextEditingController controller = TextEditingController();
  final List<Map<String, dynamic>> messages = [];




  void sendMessage(Function func) {
    if (controller.text.isNotEmpty) {
        messages.insert(0, {
          'text': controller.text,
          'isMe': true,
          'isImage': false,
        });
        print(messages[0]);
        emit(ChatbotSendState());
        controller.clear();
      func();
    }
  }



  Future<void> pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {

        messages.insert(0, {
          'text': pickedFile.path,
          'isMe': true,
          'isImage': true,
        });

    }
  }
  Future<void> chatBot() async {
    emit(ChatbotLoadingState());
    var result = await chatBotRepoImp.chatBot(
      message: controller.text
    );
    result.fold(
            (failure) { emit(ChatbotSendMessageFailState(failure.errMessage));
        },
            (registerItem) { emit(ChatbotSendMessageSucState(registerItem),
        );
            messages.insert(0, {
              'text': registerItem.data["response"].toString().substring(5),
              'isMe': false,
              'isImage': false,
            });
            emit(ChatbotReceiveState());
        if (kDebugMode) {
          print(registerItem);
        }
        }
    );

  }
}
