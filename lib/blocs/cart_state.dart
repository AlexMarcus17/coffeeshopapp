// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'cart_bloc.dart';

@immutable
abstract class CartState {}

class CartList extends CartState {
  List<CartProduct> list;
  CartList({
    required this.list,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'list': list.map((x) => x.toMap()).toList(),
    };
  }

  factory CartList.fromMap(Map<String, dynamic> map) {
    return CartList(
      list: List<CartProduct>.from(
        (map['list'] as List<dynamic>).map<CartProduct>(
          (x) => CartProduct.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }
}
