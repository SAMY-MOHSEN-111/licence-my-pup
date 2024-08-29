import 'package:dio/dio.dart';
import 'package:dog_license_application/models/response/lesson_response_model.dart';
import 'package:dog_license_application/response/lessons_response.dart';
import 'package:dog_license_application/services/lessons_service.dart';

class LessonsRepo {
  Future<LessonsResponse> getLessonsByUnitId(int id) async {
    try{
      var response = await LessonsService().getLessonsByUnitId(id);
      return GetLessonsByUnitIdSuccessResponse(lessons: (response.data as List).map((e) => LessonResponseModel.fromJson(e)).toList());
    } on DioException catch (error) {
      return GetLessonsByUnitIdFailureResponse(message: error.response?.data['message']);
    }
  }

  Future<LessonsResponse> markLessonAsCompleted(int unitId, int lessonId) async {
    try{
      await LessonsService().markLessonAsCompleted(unitId, lessonId);
      return MarkLessonAsCompletedSuccessResponse();
    } on DioException catch (error) {
      return MarkLessonAsCompletedFailureResponse(message: error.response?.data['message']);
    }
  }
}