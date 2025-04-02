import 'package:bet_hedge/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeUi extends StatefulWidget {
  const HomeUi({super.key});

  @override
  State<HomeUi> createState() => HomeUiState();
}

class HomeUiState extends State<HomeUi> {
  HomeBloc homeBloc = HomeBloc();
  var result = "nothing";

  @override
  void initState() {
    super.initState();
    homeBloc.add(HomeInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (BuildContext context, HomeState state) {
        if (state is HedgeOutputState) {
          setState(() {
            final succesState = state;
            print("State updated with result: ${state.result}");
            result = succesState.result;
          });
        }
      },
      builder: (context, state) {
        result = "nothing";
        return Scaffold(
          appBar: AppBar(
            title: Text("BetHedge"),
            backgroundColor: Colors.white,
          ),
          body: Center(
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    homeBloc.add(CalculateHedgeEvent());
                  },
                  child: Text("data"),
                ),

                Text(result),
              ],
            ),
          ),
        );
      },
    );
  }
}
