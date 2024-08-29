part of 'lessons_cubit.dart';

@immutable
sealed class LessonsState {}

final class LessonsInitial extends LessonsState {}

final class LessonsLoading extends LessonsState {}

final class LessonsSuccess extends LessonsState {}

final class LessonsFailure extends LessonsState {
  final String message;

  LessonsFailure({required this.message});
}
