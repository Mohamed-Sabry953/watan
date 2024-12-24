part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}
final class ProfileLoadingState extends ProfileState {}
final class PickImageFromGalleryState extends ProfileState {}
final class SetInitialDataState extends ProfileState {}
final class UpdateProfileSucState extends ProfileState {
  final Response response;

  UpdateProfileSucState(this.response);
}
final class UpdateProfileFailState extends ProfileState {
  final String error;

  UpdateProfileFailState(this.error);
}
