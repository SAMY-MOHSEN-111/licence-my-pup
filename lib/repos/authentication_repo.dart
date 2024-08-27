import 'package:dio/dio.dart';
import 'package:dog_license_application/models/request/login_request_model.dart';
import 'package:dog_license_application/models/request/register_request_model.dart';
import 'package:dog_license_application/models/response/login_response_model.dart';
import 'package:dog_license_application/models/response/register_response_model.dart';
import 'package:dog_license_application/response/authentication_response.dart';
import 'package:dog_license_application/services/authentication_service.dart';


class AuthenticationRepo {
  Future<AuthenticationResponse> login(LoginRequestModel model) async {
    try {
      final response = await AuthenticationService().login(model);
      return LoginSuccessResponse(loginResponseModel: LoginResponseModel.fromJson(response.data));
    } on DioException catch (error) {
      return LoginFailedResponse(message: error.response?.data['message']);
    }
  }

  Future<AuthenticationResponse> register(RegisterRequestModel model) async {
    try{
      final response = await AuthenticationService().register(model);
      return RegisterSuccessResponse(registerResponseModel: RegisterResponseModel.fromJson(response.data));
    } on DioException catch (error) {
      return RegisterFailedResponse(message: error.response?.data['message']);
    }
  }
}
