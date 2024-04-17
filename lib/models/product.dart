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
}
