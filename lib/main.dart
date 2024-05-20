// ignore_for_file: use_key_in_widget_constructors

import 'package:coffeeshopapp/blocs/cart_bloc.dart';
import 'package:coffeeshopapp/data/authrepo.dart';
import 'package:coffeeshopapp/data/orderrepo.dart';
import 'package:coffeeshopapp/firebase_options.dart';
//import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'blocs/order_bloc.dart';
import 'routes/route.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var app = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  GetIt.I.registerSingleton<AuthRepository>(AuthRepository(app));
  GetIt.I.registerSingleton<OrderRepository>(
      OrderRepository(authRepository: GetIt.I.get<AuthRepository>()));
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  runApp(
    // DevicePreview(
    // enabled: !kReleaseMode,
    // builder: (context) =>
    MyApp(),
    //)
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<CartBloc>(
            create: (BuildContext context) => CartBloc(),
          ),
          BlocProvider<OrderBloc>(
            create: (BuildContext context) =>
                OrderBloc(GetIt.I.get<OrderRepository>()),
          ),
        ],
        child: MaterialApp(
          // useInheritedMediaQuery: true,
          // locale: DevicePreview.locale(context),
          // builder: DevicePreview.appBuilder,
          title: 'Flutter Demo',
          theme: ThemeData(),
          initialRoute: "/",
          onGenerateRoute: RouteGenerator.onGenRoute,
        ));
  }
}
