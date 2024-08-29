import 'package:dio/dio.dart';
import 'package:dog_license_application/configuration/dio_client.dart';
import 'package:get/get.dart' as getx;

class LessonsService {
  static const String _lessonsEndpoint = "/units/?/lessons";
  static const String _markLessonAsCompletedEndpoint =
      "/units/{unitId}/lessons/{lessonId}/complete";
  final _dio = getx.Get.find<DioClient>().dio;

  Future<Response> getLessonsByUnitId(int id) async {
    return _dio.get(_lessonsEndpoint.replaceFirst("?", id.toString()));
  }

  Future<Response> markLessonAsCompleted(int unitId, int lessonId) async {
    return _dio.post(
      _markLessonAsCompletedEndpoint
          .replaceFirst("{unitId}", unitId.toString())
          .replaceFirst("{lessonId}", lessonId.toString()),
    );
  }
}
