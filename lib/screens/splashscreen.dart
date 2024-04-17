import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get_it/get_it.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

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
    Future.wait([
      SharedPreferences.getInstance(),
      hydratedstorageinit(),
      Future.delayed(Duration(milliseconds: 3000))
    ]).then((value) {
      try {
        GetIt.I.registerSingleton<SharedPreferences>(value[0]);
      } on Exception catch (e) {
        print(e.toString());
      }
      bool? isinit = value[0].getBool("isinit");
      String route;
      if (isinit == null || isinit == true)
        route = "/getstarted";
      else
        route = "/navigation";
      Navigator.of(context).pushReplacementNamed(route);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 204, 153, 0),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Lottie.asset("assets/CoffeeCup.json"),
          AnimatedTextKit(
            animatedTexts: [
              ColorizeAnimatedText("Mocha Moments",
                  textStyle: TextStyle(
                      fontFamily: "Food Zone",
                      fontWeight: FontWeight.bold,
                      fontSize: 40),
                  colors: [
                    Color.fromARGB(255, 49, 15, 3),
                    Color.fromARGB(255, 195, 126, 57),
                    Color.fromARGB(255, 110, 60, 9)
                  ])
            ],
          )
        ],
      ),
    );
  }
}
