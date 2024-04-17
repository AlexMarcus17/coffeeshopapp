import 'package:bloc/bloc.dart';
import 'package:coffeeshopapp/models/order.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends HydratedBloc<OrderEvent, OrderState> {
  OrderBloc() : super(OrderList(list: [])) {
    on<AddOrder>((event, emit) {
      var list = (state as OrderList).list;
      var newlist = [...list];
      newlist.add(event.order);
      emit(OrderList(list: newlist));
    });
  }

  @override
  OrderState? fromJson(Map<String, dynamic> json) {
    return OrderList.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(OrderState state) {
    return (state as OrderList).toMap();
  }
}
