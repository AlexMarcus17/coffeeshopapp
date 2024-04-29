import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffeeshopapp/data/authrepo.dart';
import 'package:coffeeshopapp/models/order.dart' as Model;

class OrderRepository {
  OrderRepository({required this.authRepository});
  AuthRepository authRepository;
  int _tokens = 0;
  List<Model.Order> _orders = [];
  List<Model.Order> getOrders() {
    return _orders;
  }

  void reset() {
    _tokens = 0;
    _orders = [];
  }

  int getTokens() {
    return _tokens;
  }

  Future<void> updateTokens(int tokens) async {
    if (authRepository.isSignedIn) {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(authRepository.getUid())
          .set({"tokens": tokens});
      _tokens = tokens;
    }
  }

  Future<void> updateOrders() async {
    if (authRepository.isSignedIn) {
      var data1 = await FirebaseFirestore.instance
          .collection("users")
          .doc(authRepository.getUid())
          .get();
      _tokens = data1.data()?["tokens"] ?? 0;

      var data2 = await FirebaseFirestore.instance
          .collection("users")
          .doc(authRepository.getUid())
          .collection("orders")
          .get();

      _orders = data2.docs.map((e) => Model.Order.fromMap(e.data())).toList();
    }
  }

  Future<void> addOrder(Model.Order order, int tokens) async {
    if (authRepository.isSignedIn) {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(authRepository.getUid())
          .collection("orders")
          .add(order.toMap());
      await FirebaseFirestore.instance
          .collection("users")
          .doc(authRepository.getUid())
          .set({"tokens": tokens});
      await updateOrders();
    }
  }
}
