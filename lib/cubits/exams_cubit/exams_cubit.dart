import 'package:bloc/bloc.dart';
import 'package:dog_license_application/helpers/snack_bar_helper.dart';
import 'package:dog_license_application/models/request/submit_exam_request_model.dart';
import 'package:dog_license_application/models/response/exam_response_model.dart';
import 'package:dog_license_application/repos/exam_repo.dart';
import 'package:dog_license_application/response/exam_response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'exams_state.dart';

class ExamsCubit extends Cubit<ExamState> {
  ExamsCubit() : super(const ExamsInitial());

  var isLoading = false;

  List<QuestionResponseModel> questions = [
    QuestionResponseModel(
      id: 1,
      type: "multiple_choice",
      text: "Default Question",
      options: [
        OptionResponseModel(id: 1, text: "*********"),
        OptionResponseModel(id: 2, text: "*********"),
        OptionResponseModel(id: 3, text: "*********"),
        OptionResponseModel(id: 4, text: "*********"),
      ],
      correctAnswer: OptionResponseModel(id: 3, text: "*********"),
    ),
  ];
  /*
  List<QuestionResponseModel> questions = [
    QuestionResponseModel(
      id: 1,
      type: "multiple_choice",
      text: "What is the capital of France?",
      options: [
        OptionResponseModel(id: 1, text: "Berlin"),
        OptionResponseModel(id: 2, text: "Madrid"),
        OptionResponseModel(id: 3, text: "Paris"),
        OptionResponseModel(id: 4, text: "Rome"),
      ],
      correctAnswer: OptionResponseModel(id: 3, text: "Paris"),
    ),
    QuestionResponseModel(
      id: 2,
      type: "multiple_choice",
      text: "What is the largest planet in our solar system?",
      options: [
        OptionResponseModel(id: 1, text: "Earth"),
        OptionResponseModel(id: 2, text: "Jupiter"),
        OptionResponseModel(id: 3, text: "Mars"),
        OptionResponseModel(id: 4, text: "Saturn"),
      ],
      correctAnswer: OptionResponseModel(id: 2, text: "Jupiter"),
    ),
    QuestionResponseModel(
      id: 3,
      type: "multiple_choice",
      text: "Which element has the chemical symbol 'O'?",
      options: [
        OptionResponseModel(id: 1, text: "Oxygen"),
        OptionResponseModel(id: 2, text: "Gold"),
        OptionResponseModel(id: 3, text: "Osmium"),
        OptionResponseModel(id: 4, text: "Hydrogen"),
      ],
      correctAnswer: OptionResponseModel(id: 1, text: "Oxygen"),
    ),
    QuestionResponseModel(
      id: 4,
      type: "multiple_choice",
      text: "What is the boiling point of water?",
      options: [
        OptionResponseModel(id: 1, text: "100 degrees Celsius"),
        OptionResponseModel(id: 2, text: "90 degrees Celsius"),
        OptionResponseModel(id: 3, text: "80 degrees Celsius"),
        OptionResponseModel(id: 4, text: "110 degrees Celsius"),
      ],
      correctAnswer: OptionResponseModel(id: 1, text: "100 degrees Celsius"),
    ),
    QuestionResponseModel(
      id: 5,
      type: "multiple_choice",
      text: "Who wrote 'Hamlet'?",
      options: [
        OptionResponseModel(id: 1, text: "Mark Twain"),
        OptionResponseModel(id: 2, text: "Charles Dickens"),
        OptionResponseModel(id: 3, text: "William Shakespeare"),
        OptionResponseModel(id: 4, text: "Jane Austen"),
      ],
      correctAnswer: OptionResponseModel(id: 3, text: "William Shakespeare"),
    ),
  ];
   */

  void getExamsByUnitId(int id) async {
    isLoading = true;
    emit(const ExamsLoading());
    var response = await ExamRepo().getExamByUnitId(id);
    if (response is GetExamByUnitIdSuccessResponse) {
      isLoading = false;
      // TODO: uncomment
      questions = response.questions;
      emit(const ExamsSuccess());
    } else if (response is GetExamByUnitIdFailureResponse) {
      isLoading = false;
      showSnackBar(response.message);
      emit(ExamsFailure(message: response.message));
    }
  }

  void markExamAsCompleted(int unitId, SubmitExamRequestModel model) async {
    isLoading = true;
    emit(const ExamsLoading());
    var response = await ExamRepo().markExamAsCompleted(unitId, model);
    if (response is MarkExamAsCompletedSuccessResponse) {
      isLoading = false;
      getExamsByUnitId(unitId);
      showSnackBar(response.message);
      emit(const ExamsSuccess());
    } else if (response is MarkExamAsCompletedFailureResponse) {
      isLoading = false;
      showSnackBar(response.message);
      emit(ExamsFailure(message: response.message));
    }
  }
}
