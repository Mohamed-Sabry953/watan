part of 'register_cubit.dart';

@immutable
sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}
final class ChangeCheckBoxState extends RegisterState {}
final class ChangeLangState extends RegisterState {}
final class ChangeDrawerItemIndex extends RegisterState {}
final class ChangeBottomNavIndexState extends RegisterState {}
final class BackFadeState extends RegisterState {}
final class SignupLoading extends RegisterState {}
final class SignupFailure extends RegisterState {
  final String errMessage;
  SignupFailure(this.errMessage);
}
final class SignupSuccess extends RegisterState {
  final Response registerItem;
  SignupSuccess(this.registerItem);
}
final class LoginLoading extends RegisterState {}
final class LoginFailure extends RegisterState {
  final String errMessage;
  LoginFailure(this.errMessage);
}
final class LoginSuccess extends RegisterState {
  final Response registerItem;

  LoginSuccess(this.registerItem);
}
final class SentVerifyCodeSucState extends RegisterState {
  final Response response;
  SentVerifyCodeSucState(this.response);
}
final class SentVerifyCodeFailState extends RegisterState {
  final String errMessage;
  SentVerifyCodeFailState(this.errMessage);


}
final class SendForgetPassCodeSucState extends RegisterState {
  final Response response;
  SendForgetPassCodeSucState(this.response);
}
final class SendForgetPassCodeFailState extends RegisterState {
  final String errMessage;
  SendForgetPassCodeFailState(this.errMessage);


}
final class CheckOtpCodeSucState extends RegisterState {
  final Response response;
  CheckOtpCodeSucState(this.response);
}
final class CheckOtpCodeFailState extends RegisterState {
  final String errMessage;
  CheckOtpCodeFailState(this.errMessage);


}
final class ResetPassSucState extends RegisterState {
  final Response response;
  ResetPassSucState(this.response);
}
final class ResetPassFailState extends RegisterState {
  final String errMessage;
  ResetPassFailState(this.errMessage);


}
final class GetProfileSucState extends RegisterState {
  final UserModel userModel;
  GetProfileSucState(this.userModel);
}
final class GetProfileFailState extends RegisterState {
  final String errMessage;
  GetProfileFailState(this.errMessage);


}
final class GetProfileLoadingState extends RegisterState {}
