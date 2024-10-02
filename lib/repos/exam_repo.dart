import 'package:dio/dio.dart';
import 'package:dog_license_application/models/request/submit_exam_request_model.dart';
import 'package:dog_license_application/models/response/exam_response_model.dart';
import 'package:dog_license_application/response/exam_response.dart';
import 'package:dog_license_application/services/exam_service.dart';


class ExamRepo {
  Future<ExamResponse> getExamByUnitId(int id) async {
    try{
      var response = await ExamService().getExamByUnitId(id);
      return GetExamByUnitIdSuccessResponse(questions: (response.data as List).map((e) => QuestionResponseModel.fromJson(e)).toList());
    } on DioException catch (error) {
      return GetExamByUnitIdFailureResponse(message: error.response?.data['message']);
    }
  }

  Future<ExamResponse> markExamAsCompleted(int unitId, SubmitExamRequestModel model) async {
    try{
      var response = await ExamService().submitExam(unitId, model);
      return MarkExamAsCompletedSuccessResponse(message: response.data);
    } on DioException catch (error) {
      return MarkExamAsCompletedFailureResponse(message: error.response?.data['message']);
    }
  }
}