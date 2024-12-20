import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'maps_services_state.dart';

class MapsServicesCubit extends Cubit<MapsServicesState> {
  MapsServicesCubit() : super(MapsServicesInitial());
}
