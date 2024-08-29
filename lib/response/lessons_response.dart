import 'package:dog_license_application/models/response/lesson_response_model.dart';

class LessonsResponse {}

class GetLessonsByUnitIdSuccessResponse extends LessonsResponse {
  List<LessonResponseModel> lessons;

  GetLessonsByUnitIdSuccessResponse({required this.lessons});
}

class GetLessonsByUnitIdFailureResponse extends LessonsResponse {
  final String message;

  GetLessonsByUnitIdFailureResponse({required this.message});
}

class MarkLessonAsCompletedSuccessResponse extends LessonsResponse {}

class MarkLessonAsCompletedFailureResponse extends LessonsResponse {
  final String message;

  MarkLessonAsCompletedFailureResponse({required this.message});
}
