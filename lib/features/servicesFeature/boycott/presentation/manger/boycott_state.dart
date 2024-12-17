part of 'boycott_cubit.dart';

sealed class BoycottState {}

final class BoycottInitial extends BoycottState {}
final class BoycottLoadingState extends BoycottState {}
final class BoycottGetProductSucState extends BoycottState {
  final AlternativeModel alternativeModel;

  BoycottGetProductSucState(this.alternativeModel);
}
final class BoycottGetProductFailState extends BoycottState {
  final String error;

  BoycottGetProductFailState(this.error);
}
final class BoycottCheckProductSucState extends BoycottState {
  final BoycottModel boycottModel;

  BoycottCheckProductSucState(this.boycottModel);
}
final class BoycottCheckProductFailState extends BoycottState {
  final String error;

  BoycottCheckProductFailState(this.error);
}
