import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<CalculateHedgeEvent>(calculateHedgeEvent);
  }

  FutureOr<void> homeInitialEvent(
    HomeInitialEvent event,
    Emitter<HomeState> emit,
  ) {
    emit(HomeInitial());
  }

  FutureOr<void> calculateHedgeEvent(
    CalculateHedgeEvent event,
    Emitter<HomeState> emit,
  ) {
    // int a = int.parse(event.teamA);
    // int b = int.parse(event.teamB);
    double money = double.parse(event.money);
    double a = double.parse(event.teamA);
    double b = double.parse(event.teamB);

    double hedge = (money * a) / b;

    double ifBWin = (hedge * b) - (money + hedge);

    double ifAWin = (money * a) - (hedge + money);

    Color aWinColor = ifAWin > 0 ? Colors.green : Colors.red;
    Color bWinColor = ifAWin > 0 ? Colors.green : Colors.red;

    emit(
      HedgeOutputState(
        hedge: hedge.toStringAsFixed(2),
        awin: ifAWin.toStringAsFixed(2),
        bwin: ifBWin.toStringAsFixed(2),
        awinColor: aWinColor,
        bwinColor: bWinColor,
      ),
    );
  }
}
