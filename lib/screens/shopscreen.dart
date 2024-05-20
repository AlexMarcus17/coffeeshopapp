// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:coffeeshopapp/data/productrepo.dart';
import 'package:coffeeshopapp/widgets/shopitem.dart';

class ShopScreen extends StatefulWidget {
  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  int activecategory = 1;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8, left: 16, right: 12, bottom: 2),
          child: Text(
            "Welcome, ${GetIt.I.get<SharedPreferences>().getString("username") ?? "User"}",
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w900,
              color: Colors.black,
              fontFamily: "Cartoonist",
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 0),
          child: Text(
            "Fuel Your Passion for Great Coffee",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w900,
              color: Color.fromARGB(193, 77, 77, 77),
              fontFamily: "Cartoonist",
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.04,
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    activecategory = 1;
                  });
                },
                child: Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width * 0.40,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(25)),
                    color: (activecategory == 1)
                        ? const Color.fromARGB(255, 105, 54, 3)
                        : const Color.fromARGB(255, 180, 166, 124),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Hot Drinks",
                        style: TextStyle(
                            color: (activecategory == 1)
                                ? const Color.fromARGB(255, 237, 201, 154)
                                : Colors.black,
                            fontWeight: FontWeight.w900,
                            fontFamily: "Cartoonist",
                            fontSize: 18),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          SizedBox(
                              height: 32,
                              child: Image.asset("assets/coffeecup.png")),
                          Positioned(
                            right: -15,
                            child: SizedBox(
                              height: 32,
                              child: Image.asset("assets/hotcoffee.png"),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.04,
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    activecategory = 2;
                  });
                },
                child: Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width * 0.40,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(25)),
                    color: (activecategory == 2)
                        ? const Color.fromARGB(255, 105, 54, 3)
                        : const Color.fromARGB(255, 180, 166, 124),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Cold Drinks",
                        style: TextStyle(
                            color: (activecategory == 2)
                                ? const Color.fromARGB(255, 237, 201, 154)
                                : Colors.black,
                            fontWeight: FontWeight.w900,
                            fontFamily: "Cartoonist",
                            fontSize: 18),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          SizedBox(
                              height: 32,
                              child: Image.asset("assets/icedcoffee.png")),
                          Positioned(
                            right: -15,
                            child: SizedBox(
                              height: 32,
                              child: Image.asset("assets/bubbletea.png"),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.04,
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    activecategory = 3;
                  });
                },
                child: Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width * 0.40,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(25)),
                    color: (activecategory == 3)
                        ? const Color.fromARGB(255, 105, 54, 3)
                        : const Color.fromARGB(255, 180, 166, 124),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Snacks",
                        style: TextStyle(
                            color: (activecategory == 3)
                                ? const Color.fromARGB(255, 237, 201, 154)
                                : Colors.black,
                            fontWeight: FontWeight.w900,
                            fontFamily: "Cartoonist",
                            fontSize: 18),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          SizedBox(
                              height: 32,
                              child: Image.asset("assets/muffins.png")),
                          Positioned(
                            top: 4,
                            right: -19,
                            child: SizedBox(
                              height: 32,
                              child: Image.asset("assets/cake.png"),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.04,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: SingleChildScrollView(
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.all(20),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  childAspectRatio: 6.6 / 10,
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, id) {
                  return ShopItem(
                      product: ProductRepository.getbycategory(
                          activecategory,
                          GetIt.I
                                  .get<SharedPreferences>()
                                  .getBool("onlyvegan") ??
                              false)[id]);
                },
                itemCount: ProductRepository.getbycategory(
                        activecategory,
                        GetIt.I.get<SharedPreferences>().getBool("onlyvegan") ??
                            false)
                    .length,
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
