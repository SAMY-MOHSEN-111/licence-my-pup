part of 'units_cubit.dart';

@immutable
sealed class UnitsState {}

final class UnitsInitial extends UnitsState {}
final class UnitsLoading extends UnitsState {}
final class UnitsSuccess extends UnitsState {}
final class UnitsFailure extends UnitsState {
  final String message;

  UnitsFailure({required this.message});
}
