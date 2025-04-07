import 'package:bet_hedge/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeUi extends StatefulWidget {
  const HomeUi({super.key});

  @override
  State<HomeUi> createState() => HomeUiState();
}

class HomeUiState extends State<HomeUi> {
  HomeBloc homeBloc = HomeBloc();
  var result = "";
  var bWin = "";
  var aWin = "";
  var aWinColor;
  var bWinColor;

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
            // print("State updated with result: ${state.hedge}");
            result = succesState.hedge;
            aWin = succesState.awin;
            bWin = succesState.bwin;
            aWinColor = succesState.awinColor;
            bWinColor = succesState.bwinColor;
          });
        }
      },
      builder: (context, state) {
        TextEditingController money = TextEditingController();
        TextEditingController teamA = TextEditingController();
        TextEditingController teamB = TextEditingController();

        return Scaffold(
          appBar: AppBar(
            title: Text("BetHedge"),
            backgroundColor: Colors.white,
          ),
          body: Center(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: TextField(
                    controller: money,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[^,\-\s]+')),
                    ],
                    keyboardType: TextInputType.numberWithOptions(),
                    decoration: InputDecoration(
                      labelText: "money on team A",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: TextField(
                    controller: teamA,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[^,\-\s]+')),
                    ],
                    keyboardType: TextInputType.numberWithOptions(),
                    decoration: InputDecoration(
                      labelText: "Team A Odds",

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: TextField(
                    controller: teamB,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[^,\-\s]+')),
                    ],
                    keyboardType: TextInputType.numberWithOptions(),

                    decoration: InputDecoration(
                      labelText: "Team B Odds",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),

                // initial bet
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      homeBloc.add(
                        CalculateHedgeEvent(
                          teamA: teamA.text,
                          teamB: teamB.text,
                          money: money.text,
                        ),
                      );
                    });
                  },
                  child: Text("calculate"),
                ),

                Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "hedging amount on B:   $result",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "profit if team A wins:   $aWin",
                    style: TextStyle(fontSize: 20, color: aWinColor),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "profit if team B wins:   $bWin",
                    style: TextStyle(fontSize: 20, color: bWinColor),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
