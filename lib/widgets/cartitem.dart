import 'package:coffeeshopapp/blocs/cart_bloc.dart';
import 'package:coffeeshopapp/models/cartproduct.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartItem extends StatelessWidget {
  CartProduct cartProduct;
  CartItem(this.cartProduct);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: SizedBox(
        height: 150,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13),
          ),
          elevation: 5,
          color: Colors.amber,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 5, 3, 30),
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  child: ClipRRect(
                    clipBehavior: Clip.none,
                    child: Image.asset(cartProduct.imagepath),
                  ),
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 3),
                            child: Text(
                              cartProduct.name,
                              style: TextStyle(
                                  color: Color.fromARGB(255, 5, 3, 30),
                                  fontFamily: "Cartoonist",
                                  fontSize: 20,
                                  fontWeight: FontWeight.w900),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 6),
                            child: IconButton(
                              onPressed: () {
                                context
                                    .read<CartBloc>()
                                    .add(DeleteItem(cartProduct: cartProduct));
                              },
                              icon: Icon(Icons.delete),
                            ),
                          ),
                        ],
                      ),
                      (cartProduct.caffeine)
                          ? Text(
                              (cartProduct.decaff)
                                  ? "Decaffeinated"
                                  : "with Caffeine",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 124, 116, 104),
                                  fontFamily: "Cartoonist",
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20),
                            )
                          : SizedBox(
                              height: 10,
                            ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          (!cartProduct.isreward)
                              ? Padding(
                                  padding: const EdgeInsets.only(left: 3),
                                  child: Text(
                                    "${cartProduct.price * cartProduct.num} \$",
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 5, 3, 30),
                                        fontFamily: "Cartoonist",
                                        fontSize: 20,
                                        fontWeight: FontWeight.w900),
                                  ),
                                )
                              : Padding(
                                  padding: const EdgeInsets.only(left: 3),
                                  child: Row(
                                    children: [
                                      Text(
                                        "${cartProduct.tokenprice * cartProduct.num} ",
                                        style: TextStyle(
                                            color:
                                                Color.fromARGB(255, 5, 3, 30),
                                            fontFamily: "Cartoonist",
                                            fontSize: 20,
                                            fontWeight: FontWeight.w900),
                                      ),
                                      Container(
                                        height: 22,
                                        child: Image.asset(
                                            "assets/coffeebean.png"),
                                      ),
                                    ],
                                  ),
                                ),
                          Padding(
                            padding: const EdgeInsets.only(right: 6),
                            child: Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    context.read<CartBloc>().add(
                                        MinusItem(cartProduct: cartProduct));
                                  },
                                  icon: Icon(Icons.remove),
                                ),
                                Text(
                                  cartProduct.num.toString(),
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                                IconButton(
                                  onPressed: () {
                                    context.read<CartBloc>().add(
                                        PlusItem(cartProduct: cartProduct));
                                  },
                                  icon: Icon(Icons.add),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
