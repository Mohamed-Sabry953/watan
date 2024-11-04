part of 'register_cubit.dart';

@immutable
sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}
final class ChangeCheckBoxState extends RegisterState {}
final class ChangeFadeState extends RegisterState {}
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
