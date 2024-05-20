// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';

import 'package:coffeeshopapp/models/product.dart';
import 'package:coffeeshopapp/screens/detailscreen.dart';

class ShopItem extends StatelessWidget {
  Product product;
  ShopItem({required this.product});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        String? added = await Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => DetailScreen(product: product)));
        if (added == "added" && context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Item added to cart"),
            duration: Duration(milliseconds: 800),
          ));
        }
      },
      child: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
            color: Color.fromARGB(255, 5, 3, 30)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Hero(
                tag: product.name,
                child: ClipRRect(
                  child: Image.asset(product.imagepath),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                product.name,
                style: const TextStyle(
                    color: Color.fromARGB(255, 225, 206, 181),
                    fontFamily: "Cartoonist",
                    fontSize: 20,
                    fontWeight: FontWeight.w800),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "${product.price}\$",
                        style: const TextStyle(
                          fontSize: 13,
                          fontFamily: "League Spartan",
                          fontWeight: FontWeight.w300,
                          color: Color.fromARGB(255, 228, 176, 108),
                        ),
                      ),
                      (product.isvegan)
                          ? SizedBox(
                              height: 30,
                              width: 30,
                              child: Image.asset("assets/vegantag.png"),
                            )
                          : const SizedBox(
                              height: 30,
                              width: 30,
                            )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
