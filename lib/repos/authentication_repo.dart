import 'package:dio/dio.dart';
import 'package:dog_license_application/models/request/forget_password_request_model.dart';
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

  Future<AuthenticationResponse> forgetPassword(String email) async {
    try {
      await AuthenticationService().forgetPassword(email);
      return ForgetPasswordSuccessResponse();
    } on DioException catch (error) {
      return ForgetPasswordFailedResponse(message: error.response?.data['message']);
    }
  }

  Future<AuthenticationResponse> resetPassword(ForgetPasswordRequestModel model) async {
    try {
      await AuthenticationService().resetPassword(model);
      return ResetPasswordSuccessResponse();
    } on DioException catch (error) {
      return ResetPasswordFailedResponse(message: error.response?.data['message']);
    }
  }
}
