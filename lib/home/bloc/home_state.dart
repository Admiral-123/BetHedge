part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

abstract class HomeActionState extends HomeState {}

class HomeInitial extends HomeState {}

// final class HomeLoadedState extends HomeState {}

class HedgeOutputState extends HomeActionState {
  final String hedge;
  final String awin;
  final String bwin;
  final Color awinColor;
  final Color bwinColor;
  HedgeOutputState({
    required this.hedge,
    required this.awin,
    required this.bwin,
    required this.awinColor,
    required this.bwinColor,
  });
}
