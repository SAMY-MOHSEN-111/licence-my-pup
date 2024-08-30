part of 'lessons_cubit.dart';

@immutable
sealed class LessonsState {
  final bool isLoading;

  const LessonsState({required this.isLoading});
}

final class LessonsInitial extends LessonsState {
  const LessonsInitial() : super(isLoading: false);
}

final class LessonsLoading extends LessonsState {
  const LessonsLoading() : super(isLoading: true);
}

final class LessonsSuccess extends LessonsState {
  const LessonsSuccess() : super(isLoading: false);
}

final class LessonsFailure extends LessonsState {
  final String message;

  const LessonsFailure({required this.message}) : super(isLoading: false);
}
