import 'package:bloc/bloc.dart';
import 'package:dog_license_application/models/response/unit_response_model.dart';
import 'package:dog_license_application/repos/units_repo.dart';
import 'package:dog_license_application/response/units_response.dart';
import 'package:meta/meta.dart';

part 'units_state.dart';

class UnitsCubit extends Cubit<UnitsState> {
  UnitsCubit() : super(UnitsInitial());
  var isLoading = false;
  List<UnitResponseModel> units = [];

  void getAllUnits() async {
    isLoading = true;
    emit(UnitsLoading());
    var response = await UnitsRepo().getAllUnits();
    if (response is GetAllUnitsSuccessResponse) {
      isLoading = false;
      units = response.units;
      emit(UnitsSuccess());
    } else if (response is GetAllUnitsFailureResponse) {
      isLoading = false;
      emit(UnitsFailure(message: response.message));
    }
  }
}
