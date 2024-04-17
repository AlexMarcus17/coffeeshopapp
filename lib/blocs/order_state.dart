// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'order_bloc.dart';

@immutable
abstract class OrderState {}

class OrderList extends OrderState {
  List<Order> list;
  OrderList({
    required this.list,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'list': list.map((x) => x.toMap()).toList(),
    };
  }

  factory OrderList.fromMap(Map<String, dynamic> map) {
    return OrderList(
      list: List<Order>.from(
        (map['list'] as List<dynamic>).map<Order>(
          (x) => Order.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }
}
