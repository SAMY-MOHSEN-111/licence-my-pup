import 'package:dog_license_application/models/response/exam_response_model.dart';

class ExamResponse {}

class GetExamByUnitIdSuccessResponse extends ExamResponse {
  List<QuestionResponseModel> questions;

  GetExamByUnitIdSuccessResponse({required this.questions});
}

class GetExamByUnitIdFailureResponse extends ExamResponse {
  final String message;

  GetExamByUnitIdFailureResponse({required this.message});
}

class MarkExamAsCompletedSuccessResponse extends ExamResponse {
  final String message;

  MarkExamAsCompletedSuccessResponse({required this.message});
}

class MarkExamAsCompletedFailureResponse extends ExamResponse {
  final String message;

  MarkExamAsCompletedFailureResponse({required this.message});
}
