import 'package:dio/dio.dart';
import 'package:dog_license_application/configuration/dio_client.dart';
import 'package:dog_license_application/models/request/login_request_model.dart';
import 'package:dog_license_application/models/request/register_request_model.dart';
import 'package:get/get.dart' as getx;

class AuthenticationService {
  static const String _loginEndpoint = "/auth/login";
  static const String _registerEndpoint = "/auth/register";

  final _dio = getx.Get.find<DioClient>().dio;

  Future<Response> login(LoginRequestModel model) async {
    var response = await _dio.post(
      _loginEndpoint,
      data: model.toJson(),
    );
    return response;
  }

  Future<Response> register(RegisterRequestModel model) async {
    var response = await _dio.post(
      _registerEndpoint,
      data: model.toJson(),
    );
    return response;
  }
}
