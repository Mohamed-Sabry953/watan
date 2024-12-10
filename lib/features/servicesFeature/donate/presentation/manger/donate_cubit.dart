import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'donate_state.dart';

class DonateCubit extends Cubit<DonateState> {
  DonateCubit() : super(DonateInitial());
}
