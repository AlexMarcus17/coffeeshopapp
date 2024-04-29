// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'order_bloc.dart';

@immutable
abstract class OrderState {}

class OrderList extends OrderState {
  final List<Order> list;
  OrderList({
    required this.list,
  });
}
