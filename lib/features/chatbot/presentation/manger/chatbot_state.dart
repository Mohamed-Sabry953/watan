part of 'chatbot_cubit.dart';

@immutable
sealed class ChatbotState {}

final class ChatbotInitial extends ChatbotState {}
final class ChatbotLoadingState extends ChatbotState {}
final class ChatbotReceiveState extends ChatbotState {}
final class ChatbotSendState extends ChatbotState {}
final class ChatbotSendMessageSucState extends ChatbotState {
  final Response response;
  ChatbotSendMessageSucState(this.response);
}
final class ChatbotSendMessageFailState extends ChatbotState {
  final String error;

  ChatbotSendMessageFailState(this.error);
}
