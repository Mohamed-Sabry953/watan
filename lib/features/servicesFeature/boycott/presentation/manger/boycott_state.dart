part of 'boycott_cubit.dart';

sealed class BoycottState {}

final class BoycottInitial extends BoycottState {}
final class BoycottLoadingState extends BoycottState {}
final class BoycottGetProductSucState extends BoycottState {
  final TestAlternitive alternativeModel;

  BoycottGetProductSucState(this.alternativeModel);
}
final class BoycottGetProductFailState extends BoycottState {
  final String error;

  BoycottGetProductFailState(this.error);
}


final class BoycottGetAllAtrenitiveSucState extends BoycottState {
  final AllAlternitiveModel allAlternitiveModel;

  BoycottGetAllAtrenitiveSucState(this.allAlternitiveModel);
}
final class BoycottGetAllAtrenitiveFailState extends BoycottState {
  final String error;

  BoycottGetAllAtrenitiveFailState(this.error);
}

final class BoycottGetBoycott_ProductSucState extends BoycottState {
  final BoycottModel boycottModel;

  BoycottGetBoycott_ProductSucState(this.boycottModel);

}
final class BoycottGetBoycott_ProductFailState extends BoycottState {
  final String error;

  BoycottGetBoycott_ProductFailState(this.error);

}

final class BoycottCheckProductSucState extends BoycottState {
  final TestCodeModel boycottModel;

  BoycottCheckProductSucState(this.boycottModel);
}
final class BoycottCheckProductFailState extends BoycottState {
  final String error;

  BoycottCheckProductFailState(this.error);
}
