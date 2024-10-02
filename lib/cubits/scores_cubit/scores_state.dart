part of 'scores_cubit.dart';

@immutable
sealed class ScoresState {}

final class ScoresInitial extends ScoresState {}

final class ScoresLoading extends ScoresState {}

final class ScoresSuccess extends ScoresState {}

final class ScoresFailure extends ScoresState {
  final String message;

  ScoresFailure({required this.message});
}
