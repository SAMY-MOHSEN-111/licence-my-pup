import 'package:dog_license_application/models/response/scores_response_model.dart';

class ScoresResponse {}

class GetScoresSuccessResponse extends ScoresResponse {
  final List<ExamTrial> examTrialsResponseModel;

  GetScoresSuccessResponse({required this.examTrialsResponseModel});
}

class GetScoresFailureResponse extends ScoresResponse {
  final String message;

  GetScoresFailureResponse({required this.message});
}
