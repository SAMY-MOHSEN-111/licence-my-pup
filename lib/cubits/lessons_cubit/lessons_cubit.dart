import 'package:bloc/bloc.dart';
import 'package:dog_license_application/helpers/snack_bar_helper.dart';
import 'package:dog_license_application/models/response/lesson_response_model.dart';
import 'package:dog_license_application/repos/lessons_repo.dart';
import 'package:dog_license_application/response/lessons_response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

part 'lessons_state.dart';

class LessonsCubit extends Cubit<LessonsState> {
  LessonsCubit() : super(LessonsInitial());

  var isLoading = false;
  List<LessonResponseModel> lessons = [];

  void getLessonsByUnitId(int id) async {
    isLoading = true;
    emit(LessonsLoading());
    var response = await LessonsRepo().getLessonsByUnitId(id);
    if (response is GetLessonsByUnitIdSuccessResponse) {
      isLoading = false;
      lessons = response.lessons;
      emit(LessonsSuccess());
    } else if (response is GetLessonsByUnitIdFailureResponse) {
      isLoading = false;
      emit(LessonsFailure(message: response.message));
    }
  }

  void markLessonAsCompleted(int unitId, int lessonId) async {
    isLoading = true;
    emit(LessonsLoading());
    var response = await LessonsRepo().markLessonAsCompleted(unitId, lessonId);
    if (response is MarkLessonAsCompletedSuccessResponse) {
      isLoading = false;
      getLessonsByUnitId(unitId);
      showSnackBar("Lesson marked as completed successfully");
      emit(LessonsSuccess());
    } else if (response is MarkLessonAsCompletedFailureResponse) {
      isLoading = false;
      emit(LessonsFailure(message: response.message));
    }
  }
}
