part of 'exams_cubit.dart';

@immutable
sealed class ExamState {
  final bool isLoading;

  const ExamState({required this.isLoading});
}

final class ExamsInitial extends ExamState {
  const ExamsInitial() : super(isLoading: false);
}

final class ExamsLoading extends ExamState {
  const ExamsLoading() : super(isLoading: true);
}

final class ExamsSuccess extends ExamState {
  const ExamsSuccess() : super(isLoading: false);
}

final class ExamsFailure extends ExamState {
  final String message;

  const ExamsFailure({required this.message}) : super(isLoading: false);
}
