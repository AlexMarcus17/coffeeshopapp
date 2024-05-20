// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:coffeeshopapp/blocs/cart_bloc.dart';
import 'package:coffeeshopapp/models/order.dart';

import '../widgets/cartitem.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        var list = (state as CartList).list;
        int tokensget = 0;
        list.forEach((element) {
          tokensget += element.tokens * element.num;
        });
        bool haverewards = list.any(
          (element) => element.isreward == true,
        );
        var list1 = list
            .where(
              (element) => element.isreward == false,
            )
            .toList();
        var list2 = list
            .where(
              (element) => element.isreward == true,
            )
            .toList();
        double sum = 0;
        list1.forEach((element) => sum += element.price * element.num);
        int tokensum = 0;
        list2
            .forEach((element) => tokensum += element.tokenprice * element.num);
        return SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding:
                    EdgeInsets.only(top: 8, left: 18, right: 12, bottom: 10),
                child: Text(
                  "My Cart",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w900,
                    color: Colors.black,
                    fontFamily: "Cartoonist",
                  ),
                ),
              ),
              Expanded(
                child: (list.isEmpty)
                    ? const Center(
                        child: Text(
                          "The Cart is Empty",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w900,
                            color: Colors.black,
                            fontFamily: "Cartoonist",
                          ),
                        ),
                      )
                    : ListView.builder(
                        itemBuilder: (context, id) {
                          if (id < list1.length) return CartItem(list1[id]);
                          if (id == list1.length && haverewards) {
                            return SizedBox(
                              height: 50,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 24),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Free Products",
                                      style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w900,
                                        color: Colors.black,
                                        fontFamily: "Cartoonist",
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "You have: ${GetIt.I.get<SharedPreferences>().getInt("tokens") ?? 0}",
                                          style: const TextStyle(
                                            fontSize: 20,
                                            fontFamily: "Cartoonist",
                                            fontWeight: FontWeight.w900,
                                            color:
                                                Color.fromARGB(255, 5, 3, 30),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 2,
                                        ),
                                        SizedBox(
                                          height: 22,
                                          child: Image.asset(
                                              "assets/coffeebean.png"),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }
                          if (id > list1.length) {
                            return CartItem(list2[id - list1.length - 1]);
                          }
                        },
                        itemCount: list2.length + list1.length + 1,
                      ),
              ),
              SizedBox(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Total:",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w900,
                              color: Colors.black,
                              fontFamily: "Cartoonist",
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: Text(
                              "$sum \$",
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 5, 3, 30),
                                  fontFamily: "Cartoonist",
                                  fontSize: 20,
                                  fontWeight: FontWeight.w900),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "You use:",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w900,
                              color: Colors.black,
                              fontFamily: "Cartoonist",
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: Row(
                              children: [
                                Text(
                                  "$tokensum ",
                                  style: const TextStyle(
                                      color: Color.fromARGB(255, 5, 3, 30),
                                      fontFamily: "Cartoonist",
                                      fontSize: 20,
                                      fontWeight: FontWeight.w900),
                                ),
                                SizedBox(
                                  height: 22,
                                  child: Image.asset("assets/coffeebean.png"),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        height: 36,
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(255, 5, 3, 30),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          onPressed: (list.isEmpty)
                              ? null
                              : () {
                                  Navigator.of(context)
                                      .pushNamed("/checkout", arguments: [
                                    tokensget,
                                    tokensum,
                                    Order(
                                        list: [...list1, ...list2],
                                        moneyspent: sum,
                                        tokenspent: tokensum,
                                        dateTime: DateTime.now())
                                  ]);
                                },
                          child: const Text(
                            "CHECK OUT",
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
