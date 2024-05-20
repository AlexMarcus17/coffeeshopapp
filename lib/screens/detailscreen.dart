// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable, use_key_in_widget_constructors
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:coffeeshopapp/blocs/cart_bloc.dart';
import 'package:coffeeshopapp/models/cartproduct.dart';
import 'package:coffeeshopapp/models/product.dart';

class DetailScreen extends StatefulWidget {
  Product product;
  DetailScreen({
    required this.product,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool caffeine = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 5, 3, 30),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          backgroundColor: const Color.fromARGB(0, 249, 153, 57),
          elevation: 0,
          centerTitle: true,
          title: ShaderMask(
            shaderCallback: (bounds) {
              return const LinearGradient(colors: [
                Color.fromARGB(255, 123, 55, 30),
                Color.fromARGB(255, 182, 118, 54),
                Color.fromARGB(255, 155, 77, 0)
              ]).createShader(bounds);
            },
            child: const Text(
              "Mocha Moments",
              style: TextStyle(
                  fontFamily: "Food Zone",
                  fontWeight: FontWeight.bold,
                  fontSize: 24),
            ),
          ),
        ),
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.15,
                ),
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                      color: Color.fromARGB(255, 237, 201, 154),
                    ),
                  ),
                ),
              ],
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: 20,
                        right: MediaQuery.of(context).size.width * 0.22,
                        left: MediaQuery.of(context).size.width * 0.22,
                        bottom: 6),
                    child: Hero(
                      tag: widget.product.name,
                      child: ClipRect(
                        child: Image.asset(widget.product.imagepath),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 5, 3, 30),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(37),
                        topRight: Radius.circular(26),
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(37),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.47,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 16, left: 22),
                                child: Text(
                                  widget.product.name,
                                  style: const TextStyle(
                                      color: Color.fromARGB(255, 237, 201, 154),
                                      fontFamily: "Cartoonist",
                                      fontWeight: FontWeight.w900,
                                      fontSize: 22),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 22),
                              child: Text(
                                "${widget.product.price}\$",
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontFamily: "League Spartan",
                                  fontWeight: FontWeight.w300,
                                  color: Color.fromARGB(255, 228, 176, 108),
                                ),
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8, left: 22),
                          child: Text(
                            widget.product.subtitle,
                            style: const TextStyle(
                                color: Color.fromARGB(255, 166, 155, 140),
                                fontFamily: "Cartoonist",
                                fontWeight: FontWeight.w700,
                                fontSize: 20),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 22, bottom: 16),
                                  child: Text(
                                    "You get: ${widget.product.tokens} ",
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontFamily: "Cartoonist",
                                      fontWeight: FontWeight.w800,
                                      color: Color.fromARGB(255, 228, 176, 108),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 16),
                                  child: SizedBox(
                                    height: 20,
                                    child: Image.asset("assets/coffeebean.png"),
                                  ),
                                ),
                              ],
                            ),
                            (widget.product.isvegan)
                                ? Padding(
                                    padding: const EdgeInsets.only(
                                        right: 22, bottom: 6),
                                    child: SizedBox(
                                      height: 28,
                                      width: 30,
                                      child: Image.asset("assets/vegantag.png"),
                                    ),
                                  )
                                : const SizedBox(
                                    height: 30,
                                    width: 30,
                                  )
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.78,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Description",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: "Cartoonist",
                              fontWeight: FontWeight.w900,
                              fontSize: 22),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          widget.product.description,
                          style: const TextStyle(
                              color: Colors.black,
                              fontFamily: "Cartoonist",
                              fontWeight: FontWeight.w800,
                              fontSize: 21),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  (widget.product.decaff)
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  caffeine = true;
                                });
                              },
                              child: Container(
                                height: 40,
                                width: MediaQuery.of(context).size.width * 0.37,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      const BorderRadius.all(Radius.circular(25)),
                                  color: (caffeine)
                                      ? const Color.fromARGB(255, 105, 54, 3)
                                      : const Color.fromARGB(255, 180, 166, 124),
                                ),
                                child: Center(
                                  child: Text(
                                    "With Caffeine",
                                    style: TextStyle(
                                        color: (caffeine)
                                            ? const Color.fromARGB(255, 237, 201, 154)
                                            : Colors.black,
                                        fontWeight: FontWeight.w900,
                                        fontFamily: "Cartoonist",
                                        fontSize: 18),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  caffeine = false;
                                });
                              },
                              child: Container(
                                height: 40,
                                width: MediaQuery.of(context).size.width * 0.37,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      const BorderRadius.all(Radius.circular(25)),
                                  color: (!caffeine)
                                      ? const Color.fromARGB(255, 105, 54, 3)
                                      : const Color.fromARGB(255, 180, 166, 124),
                                ),
                                child: Center(
                                  child: Text(
                                    "Decaffeinated",
                                    style: TextStyle(
                                        color: (!caffeine)
                                            ? const Color.fromARGB(255, 237, 201, 154)
                                            : Colors.black,
                                        fontWeight: FontWeight.w900,
                                        fontFamily: "Cartoonist",
                                        fontSize: 18),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      : const SizedBox(
                          height: 1,
                        ),
                  const SizedBox(
                    height: 24,
                  ),
                  SizedBox(
                    height: 40,
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 5, 3, 30),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: () {
                        context.read<CartBloc>().add(AddItem(
                            cartProduct: CartProduct(
                                name: widget.product.name,
                                imagepath: widget.product.imagepath,
                                price: widget.product.price,
                                num: 1,
                                isreward: false,
                                tokenprice: 0,
                                tokens: widget.product.tokens,
                                caffeine: widget.product.decaff,
                                decaff: !caffeine)));
                        Navigator.of(context).pop("added");
                      },
                      child: const Text(
                        "ADD TO CART",
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
