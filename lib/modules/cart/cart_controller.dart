import 'package:flutter/material.dart';
import 'models/cart_item_model.dart';
import '../home/models/product_model.dart';

class CartController extends ChangeNotifier {
  final List<CartItemModel> _items = [];

  List<CartItemModel> get items => _items;

  void addProduct(ProductModel product) {
    final index =
        _items.indexWhere((item) => item.product.id == product.id);

    if (index >= 0) {
      _items[index].quantity++;
    } else {
      _items.add(CartItemModel(product: product));
    }
    notifyListeners();
  }

  void removeProduct(ProductModel product) {
    _items.removeWhere((item) => item.product.id == product.id);
    notifyListeners();
  }

  void increment(ProductModel product) {
    addProduct(product);
  }

  void decrement(ProductModel product) {
    final index =
        _items.indexWhere((item) => item.product.id == product.id);

    if (index >= 0) {
      if (_items[index].quantity > 1) {
        _items[index].quantity--;
      } else {
        _items.removeAt(index);
      }
      notifyListeners();
    }
  }

  double get total =>
      _items.fold(0, (sum, item) => sum + item.total);

  bool get isEmpty => _items.isEmpty;
}
