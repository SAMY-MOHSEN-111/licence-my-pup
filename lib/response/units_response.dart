import 'package:dog_license_application/models/response/lesson_response_model.dart';
import 'package:dog_license_application/models/response/unit_response_model.dart';

class UnitsResponse {}

class GetAllUnitsSuccessResponse extends UnitsResponse {
  final List<UnitResponseModel> units;

  GetAllUnitsSuccessResponse({required this.units});
}

class GetAllUnitsFailureResponse extends UnitsResponse {
  final String message;

  GetAllUnitsFailureResponse({required this.message});
}
