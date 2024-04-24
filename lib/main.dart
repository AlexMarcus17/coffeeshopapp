import 'package:coffeeshopapp/blocs/cart_bloc.dart';
import 'package:coffeeshopapp/data/authrepo.dart';
import 'package:coffeeshopapp/data/orderrepo.dart';
import 'package:coffeeshopapp/firebase_options.dart';
import 'package:coffeeshopapp/routes/route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'blocs/order_bloc.dart';
import 'screens/navscreen.dart';
import 'screens/splashscreen.dart';

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
  runApp(MyApp());
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
          create: (BuildContext context) => OrderBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(),
        initialRoute: "/",
        onGenerateRoute: RouteGenerator.onGenRoute,
      ),
    );
  }
}
