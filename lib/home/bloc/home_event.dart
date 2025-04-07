part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class CalculateHedgeEvent extends HomeEvent {
  final String teamA;
  final String teamB;
  final String money;
  CalculateHedgeEvent({
    required this.money,
    required this.teamA,
    required this.teamB,
  });
}
