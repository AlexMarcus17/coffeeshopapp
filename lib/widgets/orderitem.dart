import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';

import '../models/order.dart';

class OrderItem extends StatelessWidget {
  Order order;
  OrderItem(this.order);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        height: 100 + order.list.length * 26,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        child: ListView.builder(
          itemBuilder: (context, id) {
            if (id == 0)
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 7, horizontal: 15),
                child: Text(
                  DateFormat('dd/MM/yyyy HH:mm').format(order.dateTime),
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                    color: Colors.black,
                    fontFamily: "Cartoonist",
                  ),
                ),
              );
            if (id < order.list.length + 1) {
              var cartitem = order.list[id - 1];
              return SizedBox(
                height: 26,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 2, horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${cartitem.num}x",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          color: Colors.black,
                          fontFamily: "Cartoonist",
                        ),
                      ),
                      Text(
                        cartitem.name,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          color: Colors.black,
                          fontFamily: "Cartoonist",
                        ),
                      ),
                      (!cartitem.isreward)
                          ? Text(
                              "${cartitem.price * cartitem.num} \$",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w800,
                                color: Colors.black,
                                fontFamily: "Cartoonist",
                              ),
                            )
                          : Row(
                              children: [
                                Text(
                                  "${cartitem.tokenprice * cartitem.num} ",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.black,
                                    fontFamily: "Cartoonist",
                                  ),
                                ),
                                Container(
                                  height: 21,
                                  child: Image.asset("assets/coffeebean.png"),
                                ),
                              ],
                            ),
                    ],
                  ),
                ),
              );
            }
            if (id == order.list.length + 1)
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 4, horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total",
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w900,
                        color: Colors.black,
                        fontFamily: "Cartoonist",
                      ),
                    ),
                    Text(
                      "${order.moneyspent} \$",
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w900,
                        color: Colors.black,
                        fontFamily: "Cartoonist",
                      ),
                    )
                  ],
                ),
              );
            if (id == order.list.length + 2)
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 4, horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Tokens spent",
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w900,
                        color: Colors.black,
                        fontFamily: "Cartoonist",
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "${order.tokenspent} ",
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w900,
                            color: Colors.black,
                            fontFamily: "Cartoonist",
                          ),
                        ),
                        Container(
                          height: 22,
                          child: Image.asset("assets/coffeebean.png"),
                        ),
                      ],
                    ),
                  ],
                ),
              );
          },
          itemCount: order.list.length + 3,
        ),
      ),
    );
  }
}
