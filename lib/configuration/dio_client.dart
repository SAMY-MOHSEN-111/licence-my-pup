import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dog_license_application/constants/dio_constants.dart';
import 'package:dog_license_application/views/login_view.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class DioClient extends GetxService {
  late Dio dio;

  Future<DioClient> init() async {
    dio = Dio(
      BaseOptions(
        baseUrl: kAPIUrl,
        followRedirects: true,
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        options.headers['Authorization'] = 'Bearer ${GetStorage().read('token') ?? ""}';
        return handler.next(options);
      },
      onResponse: (response, handler) {
        log(response.data.toString());
        return handler.next(response);
      },
      onError: (DioException error, handler) {
        if (error.response?.statusCode == 401) {
          GetStorage().remove("token");
          GetStorage().write("logged-in", false);
          Get.offAllNamed(LoginView.id);
        }
        return handler.next(error);
      },
    ));

    return this;
  }
}
