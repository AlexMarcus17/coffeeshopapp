import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:coffeeshopapp/blocs/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get_it/get_it.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../blocs/order_bloc.dart';
import '../models/order.dart';

class CheckOutScreen extends StatefulWidget {
  int tokensget;
  int tokenspent;
  Order order;
  CheckOutScreen(this.tokensget, this.tokenspent, this.order);
  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  var lottie = Lottie.asset("assets/loading.json");
  dynamic text2 = Text("");
  @override
  void initState() {
    Future.delayed(Duration.zero).then((value) {
      Future.delayed(Duration(milliseconds: 5100)).then((value) {
        setState(() {
          text2 = AnimatedTextKit(
            animatedTexts: [
              ScaleAnimatedText(
                "You received ${widget.tokensget} loyalty tokens",
                duration: Duration(milliseconds: 3200),
                textStyle: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w900,
                  color: Colors.black,
                  fontFamily: "Cartoonist",
                ),
              )
            ],
            totalRepeatCount: 2,
            isRepeatingAnimation: true,
            pause: Duration(milliseconds: 250),
          );

          lottie = Lottie.asset("assets/completed.json");
        });
        context.read<CartBloc>().add(PlaceOrder());

        int a = GetIt.I.get<SharedPreferences>().getInt("tokens") ?? 0;
        a += (widget.tokensget);
        a -= (widget.tokenspent);
        GetIt.I.get<SharedPreferences>().setInt("tokens", a);
        context.read<OrderBloc>().add(AddOrder(order: widget.order, tokens: a));
        Future.delayed(const Duration(milliseconds: 3000)).then((value) {
          Navigator.of(context).pop();
        });
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 237, 201, 154),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                height: 44,
                child: AnimatedTextKit(
                  animatedTexts: [
                    FadeAnimatedText(
                      "Loading Order...",
                      duration: Duration(milliseconds: 1200),
                      textStyle: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w900,
                        color: Colors.black,
                        fontFamily: "Cartoonist",
                      ),
                    ),
                    FadeAnimatedText(
                      "Loading Order...",
                      duration: const Duration(milliseconds: 1200),
                      textStyle: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w900,
                        color: Colors.black,
                        fontFamily: "Cartoonist",
                      ),
                    ),
                    FadeAnimatedText(
                      "Loading Order...",
                      duration: const Duration(milliseconds: 1200),
                      textStyle: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w900,
                        color: Colors.black,
                        fontFamily: "Cartoonist",
                      ),
                    ),
                    ScaleAnimatedText(
                      "Order Placed",
                      duration: const Duration(milliseconds: 3200),
                      textStyle: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w900,
                        color: Colors.black,
                        fontFamily: "Cartoonist",
                      ),
                    )
                  ],
                  totalRepeatCount: 1,
                  pause: const Duration(milliseconds: 500),
                )),
            const SizedBox(
              height: 26,
            ),
            SizedBox(height: 180, child: lottie),
            const SizedBox(
              height: 26,
            ),
            SizedBox(height: 44, child: text2),
          ],
        ),
      ),
    );
  }
}
