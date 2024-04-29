// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'cart_bloc.dart';

@immutable
abstract class CartEvent {}

class AddItem extends CartEvent {
  final CartProduct cartProduct;
  AddItem({
    required this.cartProduct,
  });
}

class PlusItem extends CartEvent {
  final CartProduct cartProduct;
  PlusItem({
    required this.cartProduct,
  });
}

class MinusItem extends CartEvent {
  final CartProduct cartProduct;
  MinusItem({
    required this.cartProduct,
  });
}

class DeleteItem extends CartEvent {
  final CartProduct cartProduct;
  DeleteItem({
    required this.cartProduct,
  });
}

class PlaceOrder extends CartEvent {}
