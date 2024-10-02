import 'package:bloc/bloc.dart';
import 'package:dog_license_application/helpers/snack_bar_helper.dart';
import 'package:dog_license_application/models/response/scores_response_model.dart';
import 'package:dog_license_application/repos/scores_repo.dart';
import 'package:dog_license_application/response/scores_response.dart';
import 'package:meta/meta.dart';

part 'scores_state.dart';

class ScoresCubit extends Cubit<ScoresState> {
  ScoresCubit() : super(ScoresInitial());
  var isLoading = false;
  List<ExamTrial> trials = [];

  void getTrials() async {
    isLoading = true;
    emit(ScoresLoading());
    var response = await ScoresRepo().getScores();
    if (response is GetScoresSuccessResponse) {
      isLoading = false;
      trials = response.examTrialsResponseModel.reversed.toList();
      emit(ScoresSuccess());
    } else if (response is GetScoresFailureResponse) {
      isLoading = false;
      showSnackBar(response.message);
      emit(ScoresFailure(message: response.message));
    }
  }
}
