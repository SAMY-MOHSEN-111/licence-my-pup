import 'package:dio/dio.dart';
import 'package:dog_license_application/configuration/dio_client.dart';
import 'package:get/get.dart' as getx;

class ScoresService {
  static const String _profileEndpoint = "/profile";

  final _dio = getx.Get.find<DioClient>().dio;

  Future<Response> getScores() async {
    return _dio.get(_profileEndpoint);
  }
}
