import 'dart:async';

import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

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
    int a = int.parse(event.teamA);
    int b = int.parse(event.teamB);

    int r = a * b;

    emit(HedgeOutputState(result: r.toString()));
  }
}
