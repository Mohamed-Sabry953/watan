import 'package:flutter_bloc/flutter_bloc.dart';

part 'boycott_state.dart';

class BoycottCubit extends Cubit<BoycottState> {
  BoycottCubit() : super(BoycottInitial());
}
