// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:coffeeshopapp/models/cartproduct.dart';

class Order {
  List<CartProduct> list;
  double moneyspent;
  int tokenspent;
  DateTime dateTime;
  Order({
    required this.list,
    required this.moneyspent,
    required this.tokenspent,
    required this.dateTime,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'list': list.map((x) => x.toMap()).toList(),
      'moneyspent': moneyspent,
      'tokenspent': tokenspent,
      'dateTime': dateTime.millisecondsSinceEpoch,
    };
  }

  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
      list: List<CartProduct>.from(
        (map['list'] as List<dynamic>).map<CartProduct>(
          (x) => CartProduct.fromMap(x as Map<String, dynamic>),
        ),
      ),
      moneyspent: map['moneyspent'] as double,
      tokenspent: map['tokenspent'] as int,
      dateTime: DateTime.fromMillisecondsSinceEpoch(map['dateTime'] as int),
    );
  }
}
