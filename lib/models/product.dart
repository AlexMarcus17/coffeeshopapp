import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Product {
  int categoryid;
  String name;
  String imagepath;
  double price;
  bool isvegan;
  String description;
  bool isreward;
  int tokenprice;
  int tokens;
  bool decaff;
  String subtitle;
  Product({
    required this.categoryid,
    required this.name,
    required this.imagepath,
    required this.price,
    required this.isvegan,
    required this.description,
    required this.isreward,
    required this.tokenprice,
    required this.tokens,
    required this.decaff,
    required this.subtitle,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'categoryid': categoryid,
      'name': name,
      'imagepath': imagepath,
      'price': price,
      'isvegan': isvegan,
      'description': description,
      'isreward': isreward,
      'tokenprice': tokenprice,
      'tokens': tokens,
      'decaff': decaff,
      'subtitle': subtitle,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      categoryid: map['categoryid'] as int,
      name: map['name'] as String,
      imagepath: map['imagepath'] as String,
      price: map['price'] as double,
      isvegan: map['isvegan'] as bool,
      description: map['description'] as String,
      isreward: map['isreward'] as bool,
      tokenprice: map['tokenprice'] as int,
      tokens: map['tokens'] as int,
      decaff: map['decaff'] as bool,
      subtitle: map['subtitle'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source) as Map<String, dynamic>);
}
