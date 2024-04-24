import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../blocs/cart_bloc.dart';
import '../data/productrepo.dart';
import '../widgets/rewarditem.dart';

class TokenScreen extends StatefulWidget {
  @override
  State<TokenScreen> createState() => _TokenScreenState();
}

class _TokenScreenState extends State<TokenScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        return BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            int available;

            int totalused = 0;
            (state as CartList).list.forEach(
              (element) {
                if (element.isreward == true) {
                  totalused += element.num * element.tokenprice;
                }
              },
            );
            available =
                (GetIt.I.get<SharedPreferences>().getInt("tokens") ?? 0) -
                    totalused;
            return SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(top: 8, left: 12, right: 12, bottom: 2),
                    child: Text(
                      "Reward Yourself with Loyalty Tokens",
                      style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.w900,
                        color: Colors.black,
                        fontFamily: "Cartoonist",
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                    child: Text(
                      "Unlock Free Delights and Savor the Perks of Loyalty",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                        color: Color.fromARGB(193, 77, 77, 77),
                        fontFamily: "Cartoonist",
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 6),
                      child: GridView.builder(
                        physics: ScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 20,
                          childAspectRatio: 6.6 / 10,
                          crossAxisCount: 2,
                        ),
                        itemBuilder: (context, id) {
                          return RewardItem(
                              product: ProductRepository.getrewards(GetIt.I
                                      .get<SharedPreferences>()
                                      .getBool("onlyvegan") ??
                                  false)[id],
                              available: available);
                        },
                        itemCount: ProductRepository.getrewards(GetIt.I
                                    .get<SharedPreferences>()
                                    .getBool("onlyvegan") ??
                                false)
                            .length,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                "You have: ${GetIt.I.get<SharedPreferences>().getInt("tokens") ?? 0}",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: "Cartoonist",
                                  fontWeight: FontWeight.w900,
                                  color: Color.fromARGB(255, 5, 3, 30),
                                ),
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Container(
                                height: 22,
                                child: Image.asset("assets/coffeebean.png"),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "Used: $totalused",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: "Cartoonist",
                                  fontWeight: FontWeight.w900,
                                  color: Color.fromARGB(255, 5, 3, 30),
                                ),
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Container(
                                height: 22,
                                child: Image.asset("assets/coffeebean.png"),
                              ),
                            ],
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
      },
    );
  }
}
