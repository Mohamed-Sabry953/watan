import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'boycott_state.dart';

class BoycottCubit extends Cubit<BoycottState> {
  BoycottCubit() : super(BoycottInitial());
}
