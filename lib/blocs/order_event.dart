// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'order_bloc.dart';

@immutable
abstract class OrderEvent {}

class AddOrder extends OrderEvent {
  final Order order;
  final int tokens;
  AddOrder({
    required this.order,
    required this.tokens,
  });
}

class FetchOrders extends OrderEvent {}
