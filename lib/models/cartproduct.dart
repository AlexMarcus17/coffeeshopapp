import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class CartProduct {
  String name;
  String imagepath;
  double price;
  int num;
  bool isreward;
  int tokenprice;
  int tokens;
  bool caffeine;
  bool decaff;
  CartProduct({
    required this.name,
    required this.imagepath,
    required this.price,
    required this.num,
    required this.isreward,
    required this.tokenprice,
    required this.tokens,
    required this.caffeine,
    required this.decaff,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'imagepath': imagepath,
      'price': price,
      'num': num,
      'isreward': isreward,
      'tokenprice': tokenprice,
      'tokens': tokens,
      'caffeine': caffeine,
      'decaff': decaff,
    };
  }

  factory CartProduct.fromMap(Map<String, dynamic> map) {
    return CartProduct(
      name: map['name'] as String,
      imagepath: map['imagepath'] as String,
      price: map['price'] as double,
      num: map['num'] as int,
      isreward: map['isreward'] as bool,
      tokenprice: map['tokenprice'] as int,
      tokens: map['tokens'] as int,
      caffeine: map['caffeine'] as bool,
      decaff: map['decaff'] as bool,
    );
  }
}
