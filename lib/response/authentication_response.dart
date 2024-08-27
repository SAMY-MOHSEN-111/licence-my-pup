import 'package:dog_license_application/models/response/login_response_model.dart';
import 'package:dog_license_application/models/response/register_response_model.dart';

class AuthenticationResponse {}

class LoginSuccessResponse extends AuthenticationResponse {
  final LoginResponseModel loginResponseModel;

  LoginSuccessResponse({required this.loginResponseModel});
}

class LoginFailedResponse extends AuthenticationResponse {
  final String message;

  LoginFailedResponse({required this.message});
}

class RegisterSuccessResponse extends AuthenticationResponse {
  final RegisterResponseModel registerResponseModel;

  RegisterSuccessResponse({required this.registerResponseModel});
}

class RegisterFailedResponse extends AuthenticationResponse {
  final String message;

  RegisterFailedResponse({required this.message});
}
