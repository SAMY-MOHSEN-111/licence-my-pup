import 'package:dio/dio.dart';
import 'package:dog_license_application/configuration/dio_client.dart';
import 'package:dog_license_application/models/request/submit_exam_request_model.dart';
import 'package:get/get.dart' as getx;

class ExamService {
  static const String _examEndpoint = "/units/{unit-id}/exam";

  final _dio = getx.Get.find<DioClient>().dio;

  Future<Response> getExamByUnitId(int unitId) async {
    return _dio.get(_examEndpoint.replaceFirst("{unit-id}", unitId.toString()));
  }

  Future<Response> submitExam(int unitId, SubmitExamRequestModel model) async {
    var json = model.toJson();
    return _dio.post(
      _examEndpoint.replaceFirst("{unit-id}", unitId.toString()),
      data: json,
    );
  }
}
