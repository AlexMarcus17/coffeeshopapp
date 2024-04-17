import 'package:coffeeshopapp/screens/checkoutscreen.dart';
import 'package:coffeeshopapp/screens/getstartedscreen.dart';
import 'package:coffeeshopapp/screens/navscreen.dart';
import 'package:coffeeshopapp/screens/orderscreen.dart';
import 'package:coffeeshopapp/screens/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../models/order.dart';

class RouteGenerator {
  static Route onGenRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return PageTransition(
            child: SplashScreen(),
            type: PageTransitionType.bottomToTop,
            duration: Duration.zero);
      case "/navigation":
        return PageTransition(
            child: NavigationScreen(),
            type: PageTransitionType.bottomToTop,
            curve: Curves.linear,
            duration: Duration(milliseconds: 300));
      case "/checkout":
        int tokensget = (settings.arguments as List<dynamic>)[0] as int;
        int tokenspent = (settings.arguments as List<dynamic>)[1] as int;
        Order order = (settings.arguments as List<dynamic>)[2] as Order;
        return PageTransition(
            child: CheckOutScreen(tokensget, tokenspent, order),
            type: PageTransitionType.bottomToTop,
            curve: Curves.linear,
            duration: Duration(milliseconds: 300));
      case "/navigation2":
        return PageTransition(
            child: NavigationScreen(),
            type: PageTransitionType.rightToLeftWithFade,
            curve: Curves.slowMiddle,
            duration: Duration(milliseconds: 400));
      case "/orders":
        return PageTransition(
            child: OrderScreen(),
            type: PageTransitionType.rightToLeftWithFade,
            curve: Curves.slowMiddle,
            duration: Duration(milliseconds: 300));
      case "/getstarted":
        return PageTransition(
            child: GetStartedScreen(),
            type: PageTransitionType.bottomToTop,
            curve: Curves.linear,
            duration: Duration(milliseconds: 300));
      default:
        return MaterialPageRoute(builder: (ctx) => SplashScreen());
    }
  }
}
