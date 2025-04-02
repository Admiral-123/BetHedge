import 'dart:async';

import 'package:bet_hedge/home/home_ui.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
      ),
      home: SplashScr(),
    );
  }
}

class SplashScr extends StatefulWidget {
  const SplashScr({super.key});

  @override
  State<SplashScr> createState() => SplashScrState();
}

class SplashScrState extends State<SplashScr> {
  @override
  void initState() {
    super.initState();
    toHome();
  }

  Future<void> toHome() async {
    await Future.delayed(
      const Duration(seconds: 2),
      () => {
        Navigator.pushReplacement(
          // ignore: use_build_context_synchronously
          context,
          MaterialPageRoute(builder: (context) => HomeUi()),
        ),
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset("assets/app_icon.png", height: 60, width: 60),
      ),
    );
  }
}
