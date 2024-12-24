part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}
final class HomeLoadingState extends HomeState {}
final class PickImageFromGalleryState extends HomeState {}
final class OnChangeTextFieldState extends HomeState {}
final class GetPostsSucState extends HomeState {
  final PostsModel postsModel;

  GetPostsSucState(this.postsModel);
}
final class GetPostsFailState extends HomeState {
  final String error;

  GetPostsFailState(this.error);
}
final class GetLatestPostsSucState extends HomeState {
  final PostsModel postsModel;

  GetLatestPostsSucState(this.postsModel);
}
final class GetLatestPostsFailState extends HomeState {
  final String error;

  GetLatestPostsFailState(this.error);
}
final class GetCommentsSucState extends HomeState {
  final CommentsModel commentsModel;

  GetCommentsSucState(this.commentsModel);
}
final class GetCommentsFailState extends HomeState {
  final String error;

  GetCommentsFailState(this.error);
}
final class SetCommentsSucState extends HomeState {
  final Response response;

  SetCommentsSucState(this.response);
}
final class SetCommentsFailState extends HomeState {
  final String error;

  SetCommentsFailState(this.error);
}
final class SetNewPostSucState extends HomeState {
  final Response response;

  SetNewPostSucState(this.response);
}
final class SetNewPostFailState extends HomeState {
  final String error;

  SetNewPostFailState(this.error);
}
