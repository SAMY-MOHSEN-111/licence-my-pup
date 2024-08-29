import 'package:dio/dio.dart';
import 'package:dog_license_application/configuration/dio_client.dart';
import 'package:get/get.dart' as getx;

class UnitsService {
  static const String _unitsEndpoint = "/units";

  final _dio = getx.Get.find<DioClient>().dio;

  Future<Response> getAllUnits() async {
    return _dio.get(_unitsEndpoint);
  }
}
