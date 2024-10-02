import 'package:dio/dio.dart';
import 'package:dog_license_application/models/response/scores_response_model.dart';
import 'package:dog_license_application/response/scores_response.dart';
import 'package:dog_license_application/services/scores_service.dart';

class ScoresRepo {
  Future<ScoresResponse> getScores() async {
    try {
      final response = await ScoresService().getScores();
      final scoresResponseModel = ExamTrialsResponseModel.fromJson(response.data);
      return GetScoresSuccessResponse(examTrialsResponseModel: scoresResponseModel.trials);
    } on DioException catch (error) {
      return GetScoresFailureResponse(message: error.response?.data['message']);
    }
  }
}
