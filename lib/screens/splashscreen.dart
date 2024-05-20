// ignore_for_file: use_key_in_widget_constructors

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:coffeeshopapp/blocs/order_bloc.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> hydratedstorageinit() async {
    final directory = await getApplicationDocumentsDirectory();
    HydratedBloc.storage =
        await HydratedStorage.build(storageDirectory: directory);
  }

  @override
  void initState() {
    context.read<OrderBloc>().add(FetchOrders());
    Future.wait([
      SharedPreferences.getInstance(),
      hydratedstorageinit(),
      Future.delayed(const Duration(milliseconds: 3000))
    ]).then((value) {
      try {
        GetIt.I.registerSingleton<SharedPreferences>(value[0]);
      } on Exception catch (e) {
        print(e.toString());
      }
      bool? isinit = value[0].getBool("isinit");
      String route;
      if (isinit == null || isinit == true) {
        route = "/getstarted";
      } else {
        route = "/navigation";
      }
      Navigator.of(context).pushReplacementNamed(route);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 204, 153, 0),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Lottie.asset("assets/CoffeeCup.json"),
          AnimatedTextKit(
            animatedTexts: [
              ColorizeAnimatedText("Mocha Moments",
                  textStyle: const TextStyle(
                      fontFamily: "Food Zone",
                      fontWeight: FontWeight.bold,
                      fontSize: 40),
                  colors: [
                    const Color.fromARGB(255, 49, 15, 3),
                    const Color.fromARGB(255, 195, 126, 57),
                    const Color.fromARGB(255, 110, 60, 9)
                  ])
            ],
          )
        ],
      ),
    );
  }
}
