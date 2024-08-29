import 'package:dio/dio.dart';
import 'package:dog_license_application/models/response/unit_response_model.dart';
import 'package:dog_license_application/response/units_response.dart';
import 'package:dog_license_application/services/units_service.dart';

class UnitsRepo {
  Future<UnitsResponse> getAllUnits() async {
    try{
      var response = await UnitsService().getAllUnits();
      return GetAllUnitsSuccessResponse(units: (response.data as List).map((e) => UnitResponseModel.fromJson(e)).toList());
    } on DioException catch (error) {
      return GetAllUnitsFailureResponse(message: error.response?.data['message']);
    }
  }
}
