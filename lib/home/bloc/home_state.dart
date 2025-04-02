part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

abstract class HomeActionState extends HomeState {}

class HomeInitial extends HomeState {}

// final class HomeLoadedState extends HomeState {}

class HedgeOutputState extends HomeActionState {
  final String result;

  HedgeOutputState({required this.result});
}
