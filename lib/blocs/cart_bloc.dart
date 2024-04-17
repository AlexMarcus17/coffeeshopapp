import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:coffeeshopapp/models/cartproduct.dart';
import 'package:coffeeshopapp/widgets/cartitem.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends HydratedBloc<CartEvent, CartState> {
  CartBloc() : super(CartList(list: [])) {
    on<AddItem>((event, emit) {
      var list = (state as CartList).list;
      var newlist = [...list];
      bool isfound = false;
      CartProduct cartProduct = event.cartProduct;
      newlist.forEach((element) {
        if (element.name == cartProduct.name &&
            element.decaff == cartProduct.decaff &&
            element.isreward == cartProduct.isreward) {
          element.num++;
          isfound = true;
        }
      });
      if (!isfound) {
        newlist.add(cartProduct);
      }
      emit(CartList(list: newlist));
    });
    on<DeleteItem>((event, emit) {
      var list = (state as CartList).list;
      var newlist = [...list];
      CartProduct cartProduct = event.cartProduct;
      newlist.removeWhere((element) => (element.name == cartProduct.name &&
          element.decaff == cartProduct.decaff &&
          element.isreward == cartProduct.isreward));
      emit(CartList(list: newlist));
    });
    on<PlusItem>((event, emit) {
      var list = (state as CartList).list;
      var newlist = [...list];
      CartProduct cartProduct = event.cartProduct;
      newlist.forEach((element) {
        if (element.name == cartProduct.name &&
            element.decaff == cartProduct.decaff &&
            element.isreward == cartProduct.isreward) {
          if (element.num < 10) element.num++;
        }
      });
      emit(CartList(list: newlist));
    });
    on<MinusItem>((event, emit) {
      var list = (state as CartList).list;
      var newlist = [...list];
      CartProduct cartProduct = event.cartProduct;
      newlist.forEach((element) {
        if (element.name == cartProduct.name &&
            element.decaff == cartProduct.decaff &&
            element.isreward == cartProduct.isreward) {
          if (element.num > 1) element.num--;
        }
      });
      emit(CartList(list: newlist));
    });
    on<PlaceOrder>((event, emit) {
      emit(CartList(list: []));
    });
  }

  @override
  CartState? fromJson(Map<String, dynamic> json) {
    try {
      return CartList.fromMap(json);
    } on Exception catch (e) {
      print(e);
    }
  }

  @override
  Map<String, dynamic>? toJson(CartState state) {
    try {
      return (state as CartList).toMap();
    } on Exception catch (e) {
      print(e);
    }
  }
}
