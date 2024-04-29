import 'package:bloc/bloc.dart';
import 'package:coffeeshopapp/data/orderrepo.dart';
import 'package:coffeeshopapp/models/order.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderRepository orderRepository;
  OrderBloc(this.orderRepository) : super(OrderList(list: [])) {
    on<AddOrder>((event, emit) async {
      await orderRepository.addOrder(event.order, event.tokens);
      var list = orderRepository.getOrders();
      emit(OrderList(list: list));
    });
    on<FetchOrders>((event, emit) async {
      await orderRepository.updateOrders();
      var list = orderRepository.getOrders();
      emit(OrderList(list: list));
    });
  }
}
