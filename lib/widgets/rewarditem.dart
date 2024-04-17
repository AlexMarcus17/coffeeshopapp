import 'package:coffeeshopapp/models/cartproduct.dart';
import 'package:coffeeshopapp/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/cart_bloc.dart';

class RewardItem extends StatefulWidget {
  Product product;
  int available;
  RewardItem({required this.product, required this.available});

  @override
  State<RewardItem> createState() => _RewardItemState();
}

class _RewardItemState extends State<RewardItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
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
            child: Stack(
              children: [
                ClipRRect(
                  clipBehavior: Clip.none,
                  child: Image.asset(widget.product.imagepath),
                ),
                Positioned(
                    right: 0,
                    bottom: 0,
                    child: (widget.product.isvegan)
                        ? SizedBox(
                            child: Image.asset("assets/vegantag.png"),
                            height: 30,
                            width: 30,
                          )
                        : SizedBox(
                            height: 30,
                            width: 30,
                          ))
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              "${widget.product.name}",
              style: TextStyle(
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
                    Row(
                      children: [
                        Text(
                          "${widget.product.tokenprice} ",
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: "Cartoonist",
                            fontWeight: FontWeight.w800,
                            color: Color.fromARGB(255, 228, 176, 108),
                          ),
                        ),
                        Container(
                          height: 20,
                          child: Image.asset("assets/coffeebean.png"),
                        ),
                      ],
                    ),
                    InkWell(
                      splashColor: Colors.black,
                      onTap: (widget.product.tokenprice <= widget.available)
                          ? () {
                              if (!widget.product.decaff) {
                                context.read<CartBloc>().add(AddItem(
                                    cartProduct: CartProduct(
                                        name: widget.product.name,
                                        imagepath: widget.product.imagepath,
                                        price: 0,
                                        num: 1,
                                        isreward: true,
                                        tokenprice: widget.product.tokenprice,
                                        tokens: 0,
                                        caffeine: false,
                                        decaff: false)));
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text("Item added to cart"),
                                  duration: Duration(milliseconds: 800),
                                ));
                              } else {
                                showGeneralDialog(
                                    barrierLabel: "",
                                    barrierDismissible: true,
                                    transitionDuration:
                                        Duration(milliseconds: 250),
                                    transitionBuilder: (context, animation,
                                        secondaryAnimation, child) {
                                      Tween<Offset> tween;
                                      tween = Tween(
                                          begin: const Offset(0, 1),
                                          end: Offset.zero);
                                      return SlideTransition(
                                        position: tween.animate(
                                          CurvedAnimation(
                                              parent: animation,
                                              curve: Curves.easeInOut),
                                        ),
                                        child: child,
                                      );
                                    },
                                    context: context,
                                    pageBuilder: (ctx, _, __) {
                                      bool caffeine = true;
                                      return Container(
                                        decoration: BoxDecoration(
                                            color: Colors.amber,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(30))),
                                        margin: EdgeInsets.symmetric(
                                            vertical:
                                                (MediaQuery.of(context)
                                                            .size
                                                            .height -
                                                        MediaQuery.of(context)
                                                            .viewInsets
                                                            .top -
                                                        MediaQuery.of(context)
                                                            .viewInsets
                                                            .bottom) *
                                                    0.37,
                                            horizontal: 10),
                                        height: 300,
                                        child: StatefulBuilder(
                                          builder: (context, setState) =>
                                              Scaffold(
                                            backgroundColor: Colors.transparent,
                                            body: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  SizedBox(
                                                    height: 4,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        InkWell(
                                                          onTap: () {
                                                            setState(() {
                                                              caffeine = true;
                                                            });
                                                          },
                                                          child: Container(
                                                            height: 40,
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.37,
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius: BorderRadius
                                                                  .all(Radius
                                                                      .circular(
                                                                          25)),
                                                              color: (caffeine)
                                                                  ? Color
                                                                      .fromARGB(
                                                                          255,
                                                                          105,
                                                                          54,
                                                                          3)
                                                                  : Color
                                                                      .fromARGB(
                                                                          255,
                                                                          180,
                                                                          166,
                                                                          124),
                                                            ),
                                                            child: Center(
                                                              child: Text(
                                                                "With Caffeine",
                                                                style: TextStyle(
                                                                    color: (caffeine)
                                                                        ? Color.fromARGB(
                                                                            255,
                                                                            237,
                                                                            201,
                                                                            154)
                                                                        : Colors
                                                                            .black,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w900,
                                                                    fontFamily:
                                                                        "Cartoonist",
                                                                    fontSize:
                                                                        18),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
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
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.37,
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius: BorderRadius
                                                                  .all(Radius
                                                                      .circular(
                                                                          25)),
                                                              color: (!caffeine)
                                                                  ? Color
                                                                      .fromARGB(
                                                                          255,
                                                                          105,
                                                                          54,
                                                                          3)
                                                                  : Color
                                                                      .fromARGB(
                                                                          255,
                                                                          180,
                                                                          166,
                                                                          124),
                                                            ),
                                                            child: Center(
                                                              child: Text(
                                                                "Decaffeinated",
                                                                style: TextStyle(
                                                                    color: (!caffeine)
                                                                        ? Color.fromARGB(
                                                                            255,
                                                                            237,
                                                                            201,
                                                                            154)
                                                                        : Colors
                                                                            .black,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w900,
                                                                    fontFamily:
                                                                        "Cartoonist",
                                                                    fontSize:
                                                                        18),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  ElevatedButton(
                                                    onPressed: () {
                                                      context.read<CartBloc>().add(AddItem(
                                                          cartProduct: CartProduct(
                                                              name: widget
                                                                  .product.name,
                                                              imagepath: widget
                                                                  .product
                                                                  .imagepath,
                                                              price: 0,
                                                              num: 1,
                                                              isreward: true,
                                                              tokenprice: widget
                                                                  .product
                                                                  .tokenprice,
                                                              tokens: 0,
                                                              caffeine: true,
                                                              decaff:
                                                                  !caffeine)));

                                                      Navigator.of(context)
                                                          .pop();
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                              SnackBar(
                                                        content: Text(
                                                            "Item added to cart"),
                                                        duration: Duration(
                                                            milliseconds: 800),
                                                      ));
                                                    },
                                                    child: Text(
                                                      "Add to Cart",
                                                      style: TextStyle(
                                                          fontSize: 22,
                                                          fontFamily:
                                                              "Coffee Crafts"),
                                                    ),
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                      ),
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 15),
                                                      elevation: 30.0,
                                                      backgroundColor:
                                                          Colors.brown,
                                                      shadowColor: Colors.amber,
                                                      foregroundColor:
                                                          Colors.amber,
                                                    ),
                                                  )
                                                ]),
                                          ),
                                        ),
                                      );
                                    });
                              }
                            }
                          : null,
                      child: Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset:
                                  Offset(0, 3), // changes the shadow direction
                            ),
                          ],
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                          Icons.add,
                          color: Color.fromARGB(255, 5, 3, 30),
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 8,
              )
            ],
          )
        ],
      ),
    );
  }
}
