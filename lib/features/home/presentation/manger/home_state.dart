part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}
final class HomeLoadingState extends HomeState {}
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
